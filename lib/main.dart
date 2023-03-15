import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';
import 'src/domain_manager.dart';
import 'src/features/cart/application/cart_sync_service.dart';
import 'src/features/cart/data/local/local_cart_repository_impl.dart';
import 'src/features/notification/notification_service.dart';
import 'src/features/reminder/data/reminder_repository_impl.dart';
import 'src/locator.dart';
import 'src/utils/provider_logger.dart';

Future<void> main() async {
  await LLocator.initializeApp();

  // * Pass all caught errors that are thrown within the Flutter framework to Crashlytics
  FlutterError.onError = (errorDetails) {
    if (!kIsWeb) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    }
  };

  //* Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    if (!kIsWeb) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    }
    return true;
  };

  // * Local repositories need init and override
  final localCartRepository = LocalCartRepositoryImpl();
  final reminderRepository = ReminderRepositoryImpl();

  await Future.wait([
    localCartRepository.init(),
    reminderRepository.init(),
  ]);

  // * Create ProviderContainer with any required overrides
  final container = ProviderContainer(
    overrides: [
      DomainManager.instance.localCartRepositoryProvider.overrideWith(
        (ref) {
          ref.onDispose(localCartRepository.dispose);
          return localCartRepository;
        },
      ),
      DomainManager.instance.reminderRepositoryProvider.overrideWith((ref) {
        ref.onDispose(reminderRepository.dispose);
        return reminderRepository;
      }),
    ],
    observers: [
      ProviderLogger(),
    ],
  );
  // * Initialize CartSyncService to start the listener
  container.read(cartSyncServiceProvider);
  await container.read(notificationServiceProvider).initialize();
  // * Entry point of the app
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

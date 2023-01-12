import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/locator.dart';

import 'src/app.dart';

Future<void> main() async {
  await initializeApp();

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

  // * Entry point of the app
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

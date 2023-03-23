import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import '../firebase_options.dart';
import 'router/coordinator.dart';

class LLocator {
  static Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // Remove '#' sign in url
    usePathUrlStrategy();

    await Future.wait([
      _initFirebaseServices(),
      _initPayment(),
    ]);
  }

  static Future<void> handleDeepLinks() async {
    // * Handle deep links: links received while the app is terminated
    // Check if you received the link via `getInitialLink` first
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();

    if (initialLink != null) {
      final Uri deepLink = initialLink.link;
      LCoordinator.push(deepLink.path);
    }

    // * Handle deep links: links received while the app is running
    // * (either in the foreground or background)
    FirebaseDynamicLinks.instance.onLink.listen(
      (dynamicLinkData) {
        // Set up the `onLink` event listener next as it may be received here
        final Uri deepLink = dynamicLinkData.link;
        LCoordinator.push(deepLink.path);
      },
    );
  }

  static Future<void> _initPayment() async {
    if (kIsWeb) return;
    Stripe.publishableKey =
        const String.fromEnvironment('STRIPE_PUBLISHABLE_KEY');
    Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
    Stripe.urlScheme = 'flutterstripe';
    await Stripe.instance.applySettings();
  }

  static Future<void> _initFirebaseServices() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((_) {
      if (!kIsWeb) {
        // Only send error to Firebase Crashlytics when not in debug mode.
        FirebaseCrashlytics.instance
            .setCrashlyticsCollectionEnabled(!kDebugMode);
      }
    });
  }
}

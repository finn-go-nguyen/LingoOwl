import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import '../firebase_options.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Remove '#' sign in url
  usePathUrlStrategy();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (!kIsWeb) {
    // Only send error to Firebase Crashlytics when not in debug mode.
    await FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(!kDebugMode);
  }
}

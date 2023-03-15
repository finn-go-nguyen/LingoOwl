# Online course app

<p align="center">
  <a href="https://flutter.io/">
    <img src="https://storage.googleapis.com/cms-storage-bucket/ec64036b4eacc9f3fd73.svg" alt="Logo" width=320 height=72>
  </a>

  <p align="center">
    <a href="https://github.com/go-finn-nguyen/lingo_owl/issues/new">Report bug</a>
    ·
    <a href="https://github.com/go-finn-nguyen/lingo_owl/issues/new">Request feature</a>
  </p>
</p>

## Table of contents

- [How to Use](#how-to-use)
- [Code Conventions](#code-conventions)
- [Dependencies](#dependencies)
- [Code structure](#code-structure)

## How to Use 
**Step 1:**

Download or clone this repo by using the link below:
```
https://github.com/go-finn-nguyen/lingo_owl.git
```
**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```
**Step 3:**

This project uses inject library that works with code generation, execute the following command to generate files:
```
flutter pub run build_runner build --delete-conflicting-outputs
```
or watch command in order to keep the source code synced automatically:

```
flutter pub run build_runner watch --delete-conflicting-outputs
```

**Step 4:**

Add `secret_keys.json` file to root folder then execute the following command to build app:

### Android:
```
flutter build apk --dart-define-from-file=secret_keys.json
```

### Webapp
```
flutter build web --dart-define-from-file=secret_keys.json
```
# Code Conventions
- [analysis_options.yaml](analysis_options.yaml)
- [About code analytics flutter](https://medium.com/flutter-community/effective-code-in-your-flutter-app-from-the-beginning-e597444e1273)

  In Flutter, Modularization will be done at a file level. While building widgets, we have to make sure they stay independent and re-usable as maximum. Ideally, widgets should be easily extractable into an independent project.


# Dependencies


## State Management
> State Management is still the hottest topic in Flutter Community. There are tons of choices available and it’s super intimidating for a beginner to choose one. Also, all of them have their pros and cons. So, what’s the best approach
- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) A Reactive Caching and Data-binding Framework. [Learn more](https://docs-v2.riverpod.dev/) 
- [More about state management](https://flutter.dev/docs/development/data-and-backend/state-mgmt/options)

## Routing

- [go_router](https://pub.dev/packages/go_router)

## Utilities

- [logger](https://pub.dev/packages/logger)
- [flutter_svg](https://pub.dev/packages/flutter_svg)
- [google_fonts](https://pub.dev/packages/google_fonts)
- [flutter_form_builder](https://pub.dev/packages/flutter_form_builder)
- [form_builder_validators](https://pub.dev/packages/form_builder_validators)
- [android_intent_plus](https://pub.dev/packages/android_intent_plus)
- [url_launcher](https://pub.dev/packages/url_launcher)
- [lottie](https://pub.dev/packages/lottie) Render animations exported as json natively
- [cached_network_image](https://pub.dev/packages/cached_network_image)
- [shimmer](https://pub.dev/packages/shimmer) Loading effect
- [image_picker](https://pub.dev/packages/image_picker)
- [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter) icons
- [flutter_rating_bar](https://pub.dev/packages/flutter_rating_bar)
- [flutter_animate](https://pub.dev/packages/flutter_animate) animation
- [sembast](https://pub.dev/packages/sembast) local storage
- [sembast_web](https://pub.dev/packages/sembast_web) local storage for web
- [path_provider](https://pub.dev/packages/uuid) get system path for specific platform
- [uuid](https://pub.dev/packages/uuid) id generator
- [easy_debounce](https://pub.dev/packages/uuid) debounce and throttle
- [video_player](https://pub.dev/packages/video_player)
- [intl](https://pub.dev/packages/intl) date, number formatting
- [wakelock](https://pub.dev/packages/wakelock) keep the device screen awake
- [flex_color_scheme](https://pub.dev/packages/flex_color_scheme) theming
- [awesome_notifications](https://pub.dev/packages/awesome_notifications)
- [flutter_html](https://pub.dev/packages/flutter_html) render article with HTML format
- [dio](https://pub.dev/packages/dio) HTTP request handler
- [freezed](https://pub.dev/packages/freezed) write model class with less boiler code
- [awesome_notifications](https://pub.dev/packages/awesome_notifications) push notification
- [smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator)
- [awesome_snackbar_content](https://pub.dev/packages/awesome_snackbar_content)

## Flutter Gen
- [flutter_gen](https://pub.dev/packages/flutter_gen) The Flutter code generator for your assets, fonts, colors, … — Get rid of all String-based APIs.

## Firebase services
- [firebase_core](https://pub.dev/packages/firebase_core)

- [firebase_auth](https://pub.dev/packages/firebase_auth)

- [cloud_firestore](https://pub.dev/packages/cloud_firestore)

- [google_sign_in](https://pub.dev/packages/google_sign_in)

- [flutter_facebook_auth](https://pub.dev/packages/flutter_facebook_auth)

- [firebase_storage](https://pub.dev/packages/firebase_storage)

- [firebase_crashlytics](https://pub.dev/packages/firebase_crashlytics)

- [firebase_auth_oauth](https://pub.dev/packages/firebase_auth_oauth)

## Payment

- [flutter_stripe](https://pub.dev/packages/flutter_stripe)

# Code structure
Here is the core folder structure which flutter provides.
```
online_course_app/
|- android
|- assets
|- functions
|- lib
|- web
```
Here is the folder structure we have been using in this project

```
lib/
|- gen/
|- src/
  |- constants/
  |- features/
    |- cart/
      |- application/
      |- data/
      |- model/
      |- view/
    |- article/
    |- authentication/
    |- course/
    |- enrolled_course/
    |- home/
    |- lecture/
    |- note/
    |- notification/
    |- profile/
    |- rating_count/
    |- reminder/
    |- reviews/
    |- search/ 
    |- settings/ 
    |- upload_file/ 
    |- video/
    |- welcome/ 
    |- wishlist/
  |- router/
  |- themes/
  |- utils/
  |- widgets/
    |- animation/
    |- common/
    |- dialog/
    |- state/
  |- app.dart
  |- domain_manager.dart
  |- locator.dart
|- firebase_options.dart
|- main.dart
```

## Github Action
- Github Action only deploys to Firebase distribution when pull request has been created.
- Version of file release will auto increase when github action deploy.
# Advanced Provider Architecture Tutorial - Image Picker + Firebase Storage Upload

This project shows how to capture, upload and show an avatar image, dependent on the currently logged-in user.

It serves as the foundation for the following tutorials on Provider architecture:

## Advanced Provider Tutorial - Part 1: Project Setup & Authentication Flow

To get started with this tutorial, checkout the [`initial-setup`]() branch.

Then, follow the steps in [Firebase Configuration](#firebase-configuration).

Video tutorial here:

[![Advanced Provider Tutorial - Part 1: Project Setup & Authentication Flow](media/flutter-provider-advanced-banner-1.png)]()

## Advanced Provider Tutorial - Part 2: MultiProvider & Multiple Services

To continue from the end of the previous tutorial, checkout the [`authentication-complete`]() branch.

**Video tutorial upcoming**

### Advanced Provider Tutorial - Part 3: Dependencies Between Providers

To continue from the end of the previous tutorial, checkout the [`working-implementation`]()  branch.

**Video tutorial upcoming**

The final, completed project is available on the [`master`]() branch.

## Firebase Configuration

To use this project with Firebase authentication, some configuration steps are required.

- Create a new project with the Firebase console.
- Add iOS and Android apps in the Firebase project settings.
- On Android, use `com.codingwithflutter.firebase_user_avatar_flutter` as the package name (adding a SHA-1 certificate fingerprint is **not** needed for this project).
- then, [download and copy](https://firebase.google.com/docs/flutter/setup#configure_an_android_app) `google-services.json` into `android/app`.
- On iOS, use `com.example.firebaseUserAvatarFlutter` as the bundle ID.
- then, [download and copy](https://firebase.google.com/docs/flutter/setup#configure_an_ios_app) `GoogleService-Info.plist` into `iOS/Runner`, and add it to the Runner target in Xcode.

See this document for full instructions:

- [https://firebase.google.com/docs/flutter/setup](https://firebase.google.com/docs/flutter/setup)   

## Additional References

A lot of the techniques used in this project are explained in great detail, and implemented step-by-step in my Flutter & Firebase Udemy course.

This is available for early access at this link (discount code included):

- [Flutter & Firebase: Build a Complete App for iOS & Android](https://www.udemy.com/flutter-firebase-build-a-complete-app-for-ios-android/?couponCode=DART15&password=codingwithflutter)

## [License: MIT](LICENSE.md)
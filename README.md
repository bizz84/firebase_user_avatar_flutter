## Advanced Provider Architecture - Image Picker + Firebase Storage Upload

This project shows how to capture, upload and show an avatar image, dependent on the currently logged-in user.

It serves as the foundation for some advanced tutorials on Provider architecture.

TODO: YouTube Banner

## Tutorial Steps

1. Initial project setup: see [`initial-setup`]() branch.
2. Intermediate working implementation: see [`intermediate-implementation`]() branch.
3. Final optimal implementation: see [`optimal-implementation`]() branch.

## Running the project with Firebase

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
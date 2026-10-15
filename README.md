# handrills

A new Flutter project.

## Android build

For the reusable upgrade procedure and release-signing troubleshooting, see
[Android migration guide](ANDROID_MIGRATION.md).

The Android project uses Flutter's declarative Gradle plugins. Plugin versions
are defined in `android/settings.gradle`, with Gradle 9.3.1, Android Gradle
Plugin 9.1.0, and Kotlin 2.4.0 aligned with Flutter 3.47.7.

Ensure `android/local.properties` points to the installed Flutter and Android
SDKs. Run `flutter doctor -v` to check the Android toolchain, then
`flutter build apk --debug` to validate the build. Release builds use the
signing credentials in the untracked `android/key.properties` file.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

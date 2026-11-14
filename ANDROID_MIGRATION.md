# Android Gradle migration and release-signing guide

Use this runbook for a human or an AI assistant migrating another older Flutter
app. It records the successful HanDrills migration on October 15, 2026.
Do not copy HanDrills identifiers, credentials, or SDK-level choices into another
app without checking that app's requirements.

## Can Flutter automate this?

Partly, but there is no general-purpose `flutter migrate` command in the installed
Flutter 3.47.7 CLI that safely performs this entire migration.

- `flutter analyze --suggestions` diagnoses Java, Gradle, and AGP compatibility;
  it does not perform this complete rewrite.
- Flutter builds run some automatic migrations. In this project, they added
  the `android.builtInKotlin=false` and `android.newDsl=false` compatibility flags.
  They did not replace the obsolete Flutter `apply from:` statements.
- `flutter create --platforms=android .` repairs missing platform files. It is
  not a reliable way to migrate existing customized Gradle files.
- `flutter create --platforms=android --overwrite .` can overwrite custom
  configuration. Do not run it blindly on a published app.
- Android Studio's AGP Upgrade Assistant can help with AGP upgrades, but does not
  replace the Flutter plugin migration or restore signing credentials.

The safest template-assisted approach is to generate a separate disposable
project with the same installed Flutter SDK and compare its Android configuration:

```sh
# Run outside the existing app, in a new directory.
flutter create --platforms=android --no-pub \
  --org com.example --project-name gradle_reference ./gradle_reference
```

Use its compatible tool versions and plugin structure as a reference, not as a
replacement for the existing app. New templates may use Kotlin DSL
(`.gradle.kts`) and built-in Kotlin, while an older app uses Groovy (`.gradle`)
and the separate Kotlin plugin. Do not mix these approaches accidentally.

## 1. Inspect and preserve the app

Before editing:

1. Inspect `git status` and existing diffs. Preserve unrelated work.
2. Back up the Android configuration and signing material securely.
   A Git backup alone is insufficient for ignored credentials.
3. Read `android/settings.gradle`, `android/build.gradle`,
   `android/app/build.gradle`, `android/gradle.properties`, the Gradle wrapper,
   manifests, and `pubspec.yaml` (or their Kotlin DSL equivalents).
4. Record the app's application ID, namespace/activity package, SDK levels,
   Java/Kotlin targets, versioning, signing configuration, flavors, Firebase
   plugins, dependencies, permissions, resources, and native customizations.
5. Run:

   ```sh
   flutter --version
   flutter doctor -v
   flutter analyze --suggestions
   ```

Use the Java runtime reported by `flutter doctor -v`; terminal `java` may differ.
Fix actual SDK/toolchain errors first. Here, Android SDK 36 and command-line
tools were already working, so no shell configuration change was needed.

## 2. Select a compatible toolchain

The successful HanDrills configuration was:

| Component                                | Version or setting                                    |
| ---------------------------------------- | ----------------------------------------------------- |
| Flutter                                  | 3.47.7                                                |
| Gradle wrapper                           | 9.3.1                                                 |
| Android Gradle Plugin (AGP)              | 9.1.0                                                 |
| Kotlin Gradle Plugin                     | 2.4.0                                                 |
| Java source/target and Kotlin JVM target | 17                                                    |
| Gradle runtime JDK                       | Android Studio bundled JDK 25.0.3                     |
| Compatibility flags                      | `android.builtInKotlin=false`, `android.newDsl=false` |

These versions came from the installed Flutter SDK's template defaults, not an
arbitrary upgrade to the latest Gradle. Recheck defaults and compatibility when
using another Flutter release. Java compilation target 17 is distinct from the
JDK running Gradle.

This migration retained the separate Kotlin plugin, using Flutter's compatibility
flags. It did not migrate to AGP's built-in Kotlin; that is a separate future
migration, and Flutter still warns about it.

## 3. Replace imperative Flutter plugin loading

For a Groovy project matching this one:

### `android/settings.gradle`

Replace the old `app_plugin_loader.gradle` application with:

```groovy
pluginManagement {
    def properties = new Properties()
    file("local.properties").withInputStream { properties.load(it) }
    def flutterSdkPath = properties.getProperty("flutter.sdk")
    assert flutterSdkPath != null, "flutter.sdk not set in local.properties"

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id "dev.flutter.flutter-plugin-loader" version "1.0.0"
    id "com.android.application" version "9.1.0" apply false
    id "org.jetbrains.kotlin.android" version "2.4.0" apply false
}

include ':app'
```

Keep `pluginManagement` and `plugins` before other settings logic. Preserve
additional modules and migrate other plugin declarations as needed.
The Flutter loader must not have `apply false`.

### `android/build.gradle`

Remove the old AGP/Kotlin `buildscript` classpath declarations and
`ext.kotlin_version` once all consumers have been migrated. Preserve other
plugins and custom logic; do not delete an entire block that still has consumers.

Replace `jcenter()` with `mavenCentral()`, retaining `google()`. Keep the existing
build-directory, subproject, and clean-task configuration.

### `android/app/build.gradle`

Place this block at the top:

```groovy
plugins {
    id 'com.android.application'
    id 'org.jetbrains.kotlin.android'
    id 'dev.flutter.flutter-gradle-plugin'
}
```

Remove the old `apply plugin:` statements for Android/Kotlin, the Flutter
`apply from: ".../flutter.gradle"` statement, and the now-unused `flutterRoot`
lookup. Preserve local-properties handling if versioning still uses it.

Remove the obsolete explicit
`kotlin-stdlib-jdk7:$kotlin_version` dependency; the Kotlin plugin supplies the
standard library. Check for any other uses before removing `kotlin_version`.

Add the app's own namespace and align Java/Kotlin targets:

```groovy
android {
    namespace "YOUR_EXISTING_APP_NAMESPACE"

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_17
        targetCompatibility JavaVersion.VERSION_17
    }

    // Retain the app's other Android configuration.
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}
```

Keep `flutter { source '../..' }` and all app-specific signing, dependencies,
flavors, and build types.

### Wrapper, compatibility flags, and manifest

In `android/gradle/wrapper/gradle-wrapper.properties`, use:

```properties
distributionUrl=https\://services.gradle.org/distributions/gradle-9.3.1-bin.zip
```

For the separate-Kotlin-plugin approach used here, retain these in
`android/gradle.properties`:

```properties
android.builtInKotlin=false
android.newDsl=false
```

Do not copy these opt-outs into a project intentionally using built-in Kotlin.

Remove the obsolete `package="..."` attribute from the source
`android/app/src/main/AndroidManifest.xml` after defining the correct Gradle
namespace. Preserve the activity's package resolution and all manifest content.
Check additional source manifests for the same migration requirement.

Upgrade build.gradle values: `compileSdkVersion 36`, `targetSdkVersion 36`,
and `minSdkVersion 36`

## 4. Restore release signing

A successful debug build does not validate release signing.

HanDrills had its existing upload keystore, but `android/key.properties` was
missing. This caused `:app:signReleaseBundle` to throw a
`NullPointerException`. Flutter also displayed an AGP/new-DSL hint even though
`android.newDsl=false` was already set. Diagnose the actual failing task rather
than treating every generic Flutter Fix hint as the root cause.

For each app, locate its own existing keystore and credentials. Do not create a
replacement key or reuse HanDrills' signing material without confirming intent.
Create the Git-ignored `android/key.properties` locally:

```properties
storePassword=REPLACE_LOCALLY_WITH_EXISTING_KEYSTORE_PASSWORD
keyPassword=REPLACE_LOCALLY_WITH_EXISTING_KEY_PASSWORD
keyAlias=REPLACE_WITH_THIS_KEYSTORES_ALIAS
storeFile=../upload-keystore.jks
```

The relative path above is resolved by `file(...)` in `android/app/build.gradle`,
so it points to `android/upload-keystore.jks`. Adapt it to the actual keystore
location. Confirm that `signingConfigs.release` loads these four properties and
`buildTypes.release` uses that configuration.

To inspect aliases on this Mac, run from the app root:

```sh
"/Applications/Android Studio.app/Contents/jbr/Contents/Home/bin/keytool" \
  -list -v -keystore android/upload-keystore.jks
```

Enter the password at the prompt, not in the command line. Successful verified
listing confirms the keystore password; listing without verification does not.
HanDrills' alias was `upload`, but another app's alias may differ. PKCS12 stores
often use the same store and key password; verify by building, do not assume.
Certificate SHA fingerprints are identifiers, not passwords.

Never paste passwords into chat, logs, documentation, or commits. The assistant
should not read credential values just to check file presence. Verify exclusion:

```sh
git check-ignore android/key.properties
```

Keep secure backups of the keystore and passwords. Do not add keystores to Git.
For a published app with unrecoverable upload credentials, investigate a Google
Play App Signing upload-key reset before generating any replacement.

## 5. Validate and record the result

```sh
flutter build apk --debug
flutter build appbundle --release
git diff --check
git status --short
```

Expected outputs:

- Debug APK: `build/app/outputs/flutter-apk/app-debug.apk`
- Signed release bundle: `build/app/outputs/bundle/release/app-release.aab`

Confirm both commands exit successfully and the artifacts are newly generated.
Review the diff for unintended changes, especially identifiers, signing,
minimum SDK, and non-Android files. Before uploading, ensure the release version
code is higher than the app's previous Play release and compare the signing
certificate with the upload certificate registered for that app.

If signing fails, check file existence, non-placeholder property values,
keystore path, alias, and passwords before changing Gradle versions again.
For deeper diagnostics, use the same JDK as Flutter and run:

```sh
cd android
./gradlew :app:signReleaseBundle --stacktrace --console=plain
```

Do not upload private build logs to external services. Native-access warnings
and font tree-shaking messages were not the blockers in this migration.

### Release startup: WorkManager database creation failure

Test the release build on a device or emulator, not just compilation. HanDrills'
Mobile Ads dependency pulled in WorkManager 2.7.0 and Room 2.2.5. With the newer
R8 shrinker, the release removal report listed the public no-argument
constructor of `androidx.work.impl.WorkDatabase_Impl` as removed. Room creates
this database reflectively, so startup failed in `InitializationProvider`
before Flutter started.

For this dependency combination, `android/app/proguard-rules.pro` preserves the
reflective entry point:

```proguard
-keep class androidx.work.impl.WorkDatabase_Impl {
    public <init>();
}
```

The release build type loads it with `proguardFiles 'proguard-rules.pro'`.
Preserve existing ProGuard files when adding this entry. Do not disable
WorkManager initialization or all shrinking to hide the problem. For another
app, inspect its dependency versions, complete exception, and R8 reports before
applying the rule. After rebuilding, confirm the constructor is retained and
launch the signed release APK on a compatible device.

For HanDrills, the rebuilt release APK installed successfully on the API 36
emulator. The constructor appeared in R8's retained-member report, the app
remained in the foreground, and Flutter loaded its localization assets without
an AndroidRuntime error in the new process.

The debug APK was verified during the migration. The user subsequently confirmed
the release build succeeded after restoring the signing properties.

## Suggested prompt for the next app

> Follow this Android migration runbook for this app. Inspect its current files,
> Flutter version, and dirty worktree first. Preserve its application ID,
> namespace, SDK requirements, versioning, signing identity, flavors, Firebase
> plugins, and native customizations. Use compatible versions from the installed
> Flutter SDK, not blindly the HanDrills versions. Migrate obsolete Flutter
> plugin application and validate both debug APK and signed release bundle.
> Never expose credentials, overwrite unrelated work, regenerate the Android
> folder blindly, or replace the existing signing key. If credentials are
> missing, ask me to restore them locally and report release validation blocked.

## References

- [Flutter declarative Gradle plugin migration](https://docs.flutter.dev/release/breaking-changes/flutter-gradle-plugin-apply)
- [Flutter built-in Kotlin migration](https://docs.flutter.dev/release/breaking-changes/migrate-to-built-in-kotlin/for-app-developers)
- [Android release signing](https://docs.flutter.dev/deployment/android#sign-the-app)

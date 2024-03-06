Android update:

Based on the latest documentation I can find and personal testing over several flutter projects, the way for the latest android gradle versions is as follows:

AGP: 1.9.22 (up from 1.9.0) latest
Gradle 8.1.1 (up from 7.4.2) and is latest supported

so:

    ext.kotlin_version = '1.9.22'
            classpath 'com.android.tools.build:gradle:8.1.1'


Then, the latest documentation indicates that the settings.gradle should be built with this in the settings.gradle:

plugins {
    id "dev.flutter.flutter-plugin-loader" version "1.0.0"
    id "com.android.application" version "8.1.1" apply false
    id "org.jetbrains.kotlin.android" version "1.9.22" apply false
}

Changing gradle wrapper:

distributionUrl=https\://services.gradle.org/distributions/gradle-8.1.1-all.zip


in app/build.gradle:

    throw new RuntimeException("Flutter SDK not found. Define location with flutter.sdk in the local.properties file.")

Change to RuntimeException (functions the same, fixes an annoying linting error)

Changed :

android {
    namespace "dev.hemanths.paisa"
    compileSdkVersion flutter.compileSdkVersion

    compileOptions {

because later gradle versions complain otherwise, and setting compileSdkVersion to flutter.compileSdkVersion is optional, can just be set to a static 34

Added (optional)
    testNamespace "dev.hemanths.paisa.dev"

See https://developer.android.com/build/configure-app-module#groovy


##
If you try to run the app now, you will get errors regarding 2 dev_dependencies, 
- flutter_launcher_icons
- flutter_native_splash

removing them also does this:
These packages are no longer being depended on:
- flutter_native_splash 2.2.0+1
- lint 1.10.0
- universal_io 2.2.2

running some flutter pub upgrade --major-versions, and it changes the version of js from 0.6.7 to 0.7.1

Now I can build app using flutter build apk --flavor dev --no-tree-shake-icons

There will be a deprecated warning for in_app_review 2.0.8, but will still build
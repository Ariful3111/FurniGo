# Getting Started

<cite>
**Referenced Files in This Document**
- [pubspec.yaml](file://pubspec.yaml)
- [README.md](file://README.md)
- [lib/main.dart](file://lib/main.dart)
- [analysis_options.yaml](file://analysis_options.yaml)
- [web/index.html](file://web/index.html)
- [android/local.properties](file://android/local.properties)
- [android/gradle.properties](file://android/gradle.properties)
- [android/app/src/main/kotlin/com/example/zb_dezign/MainActivity.kt](file://android/app/src/main/kotlin/com/example/zb_dezign/MainActivity.kt)
- [ios/Runner/AppDelegate.swift](file://ios/Runner/AppDelegate.swift)
- [ios/Podfile](file://ios/Podfile)
</cite>

## Table of Contents
1. [Introduction](#introduction)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
4. [Project Setup](#project-setup)
5. [Running the Application](#running-the-application)
6. [Environment Variables and Configuration](#environment-variables-and-configuration)
7. [Platform-Specific Guides](#platform-specific-guides)
8. [Common Issues and Troubleshooting](#common-issues-and-troubleshooting)
9. [Verification Checklist](#verification-checklist)
10. [Next Steps](#next-steps)

## Introduction
Welcome to the ZB-DEZINE Flutter project. This guide will help you install Flutter, set up your development environment, and run the application across Android, iOS, and Web platforms. The project follows modern Flutter architecture patterns with dependency injection, routing, theming, and modular feature organization.

## Prerequisites
Before installing and running the project, ensure you have:
- Basic understanding of Flutter and Dart
- A compatible operating system (macOS, Windows, or Linux)
- Android Studio or VS Code with Flutter/Dart plugins installed
- Android SDK and/or Xcode (for iOS) depending on the platform you plan to target
- Git for version control

## Installation
Follow these steps to install Flutter and prepare your environment:

1. Install Flutter SDK
   - Download Flutter SDK from the official website
   - Extract the archive to a permanent location
   - Add Flutter to your PATH environment variable
   - Verify installation by running flutter doctor in your terminal

2. Install Android Studio or VS Code
   - Android Studio: Install Android Studio and enable Flutter/Dart plugins
   - VS Code: Install VS Code and add Flutter and Dart extensions

3. Configure Android Emulator or iOS Simulator
   - Android: Set up an AVD (Android Virtual Device) via AVD Manager
   - iOS: Ensure Xcode is installed and open the simulator from Xcode

4. Install additional dependencies
   - For iOS: Install CocoaPods if not present
   - For Android: Ensure Android SDK Build-Tools and Gradle are installed

**Section sources**
- [README.md:1-17](file://README.md#L1-L17)

## Project Setup
Set up the ZB-DEZINE project locally:

1. Clone the repository
   - git clone <repository-url>
   - cd ZB-DEZINE

2. Install dependencies
   - Run flutter pub get to fetch all required packages defined in pubspec.yaml

3. Verify project structure
   - Confirm the presence of lib/, android/, ios/, web/, and other platform folders

4. Configure local properties (Android)
   - Update android/local.properties with your Android SDK path and Flutter SDK path

5. Configure iOS pods (iOS)
   - Navigate to ios/ and run pod install to set up CocoaPods dependencies

6. Run analyzer
   - Execute flutter analyze to check for potential issues using configured lints

**Section sources**
- [pubspec.yaml:1-112](file://pubspec.yaml#L1-L112)
- [analysis_options.yaml:1-29](file://analysis_options.yaml#L1-L29)
- [android/local.properties:1-5](file://android/local.properties#L1-L5)
- [ios/Podfile:1-44](file://ios/Podfile#L1-L44)

## Running the Application
Launch the app on different platforms:

### Android
1. Connect an Android device or start an emulator
2. Run flutter run in the project root
3. The app will build and deploy to the connected device/emulator

### iOS
1. Ensure Xcode is open and a simulator/device is selected
2. Run flutter run in the project root
3. The app will build and deploy to the selected iOS target

### Web
1. Run flutter run -d chrome (or your preferred browser)
2. Open the provided localhost URL in your browser
3. The web app will load with PWA capabilities

### Desktop (Linux/macOS/Windows)
1. Run flutter run -d linux, flutter run -d macos, or flutter run -d windows
2. The desktop app will launch on the respective platform

**Section sources**
- [lib/main.dart:12-47](file://lib/main.dart#L12-L47)
- [web/index.html:1-39](file://web/index.html#L1-L39)

## Environment Variables and Configuration
Configure environment variables and project settings:

### Android Configuration
- SDK Paths: Ensure android/local.properties contains correct sdk.dir and flutter.sdk paths
- Gradle Properties: Review android/gradle.properties for memory and AndroidX settings
- MainActivity: The Kotlin MainActivity extends FlutterActivity as the entry point

### iOS Configuration
- Podfile Setup: The ios/Podfile manages Flutter iOS integration and CocoaPods configuration
- AppDelegate: The Swift AppDelegate handles app lifecycle events and plugin registration

### Web Configuration
- Base HREF: The web/index.html includes a placeholder for base href used during builds
- Manifest: The manifest.json file supports Progressive Web App features

### Project-wide Settings
- SDK Version: The project targets Dart SDK ^3.9.0 as defined in pubspec.yaml
- Lint Rules: analysis_options.yaml enforces Flutter lints for code quality

**Section sources**
- [android/local.properties:1-5](file://android/local.properties#L1-L5)
- [android/gradle.properties:1-3](file://android/gradle.properties#L1-L3)
- [android/app/src/main/kotlin/com/example/zb_dezign/MainActivity.kt:1-6](file://android/app/src/main/kotlin/com/example/zb_dezign/MainActivity.kt#L1-L6)
- [ios/Runner/AppDelegate.swift:1-14](file://ios/Runner/AppDelegate.swift#L1-L14)
- [ios/Podfile:1-44](file://ios/Podfile#L1-L44)
- [web/index.html:1-39](file://web/index.html#L1-L39)
- [pubspec.yaml:21-22](file://pubspec.yaml#L21-L22)
- [analysis_options.yaml:8-10](file://analysis_options.yaml#L8-L10)

## Platform-Specific Guides
### Android Development
- Use Android Studio for layout editing and debugging
- Enable AndroidX compatibility in gradle.properties
- Test on multiple screen sizes and orientations
- Use MainActivity.kt as the primary activity entry point

### iOS Development
- Use Xcode for interface design and signing
- Ensure proper provisioning profiles for device testing
- Run pod install after adding new iOS dependencies
- The AppDelegate handles Flutter plugin registration

### Web Development
- Enable web support with flutter create . (if not already enabled)
- Test responsive behavior across different viewport sizes
- Verify PWA features like offline caching and service workers
- Use Chrome DevTools for debugging web-specific issues

### Desktop Development
- Linux: Ensure GTK and other dependencies are installed
- macOS: Use Xcode for signing and distribution
- Windows: Install Visual Studio build tools if targeting Windows

## Common Issues and Troubleshooting
### Flutter Doctor Warnings
- Missing Android SDK: Install Android Studio and SDK tools
- Missing iOS tools: Install Xcode and command-line tools
- Device connectivity: Enable USB debugging on Android or trust developer certificate on iOS

### Build Failures
- Gradle sync errors: Update Gradle version in android/gradle/wrapper/gradle-wrapper.properties
- CocoaPods issues: Run pod repo update and pod install in ios/
- Memory errors: Increase heap size in android/gradle.properties JVM arguments

### Platform-Specific Problems
- Android white screen: Check MainActivity.kt extends FlutterActivity correctly
- iOS build errors: Verify FLUTTER_ROOT exists in Generated.xcconfig
- Web deployment: Ensure web/index.html has correct base href during build

### Dependency Conflicts
- Run flutter pub upgrade to resolve version conflicts
- Check pubspec.yaml for incompatible package versions
- Clean cache with flutter pub cache repair if needed

### Hot Reload/Restart Issues
- Restart the app if hot reload fails
- Clear build artifacts with flutter clean
- Reinstall dependencies with flutter pub get

**Section sources**
- [ios/Podfile:13-26](file://ios/Podfile#L13-L26)
- [android/gradle.properties:1-3](file://android/gradle.properties#L1-L3)

## Verification Checklist
Complete these steps to verify successful installation:

1. Flutter Installation
   - [ ] flutter doctor shows no critical errors
   - [ ] Dart SDK version matches pubspec.yaml requirement

2. Project Setup
   - [ ] flutter pub get completes successfully
   - [ ] Android local.properties paths are correct
   - [ ] iOS pods installed without errors

3. Platform Testing
   - [ ] Android app launches on emulator/device
   - [ ] iOS app launches on simulator/device
   - [ ] Web app loads in browser with PWA features
   - [ ] Desktop app runs on target platform

4. Code Quality
   - [ ] flutter analyze reports no issues
   - [ ] Lint rules are properly enforced

5. Application Behavior
   - [ ] App initializes dependency injection
   - [ ] Theme switching works correctly
   - [ ] Navigation routes are accessible

## Next Steps
After successful setup:

1. Explore the codebase structure
   - Review lib/main.dart for app initialization
   - Examine lib/core/ for shared architecture components
   - Study lib/features/ for feature-based organization

2. Start development
   - Create new features under lib/features/
   - Add routes in lib/core/routes/
   - Implement dependency injection in lib/core/di/

3. Testing
   - Write unit tests in test/
   - Add widget tests for UI components
   - Implement integration tests for critical flows

4. Deployment
   - Prepare release builds for each platform
   - Configure app icons and launch screens
   - Set up continuous integration if desired
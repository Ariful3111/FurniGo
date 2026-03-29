# Platform-Specific Implementation

<cite>
**Referenced Files in This Document**
- [pubspec.yaml](file://pubspec.yaml)
- [lib/main.dart](file://lib/main.dart)
- [lib/core/di/dependency_injection.dart](file://lib/core/di/dependency_injection.dart)
- [lib/firebase_options.dart](file://lib/firebase_options.dart)
- [android/app/src/main/AndroidManifest.xml](file://android/app/src/main/AndroidManifest.xml)
- [android/app/build.gradle.kts](file://android/app/build.gradle.kts)
- [android/app/google-services.json](file://android/app/google-services.json)
- [android/build.gradle.kts](file://android/build.gradle.kts)
- [android/app/src/main/res/values/styles.xml](file://android/app/src/main/res/values/styles.xml)
- [ios/Runner/Info.plist](file://ios/Runner/Info.plist)
- [ios/Runner/AppDelegate.swift](file://ios/Runner/AppDelegate.swift)
- [ios/Runner/GoogleService-Info.plist](file://ios/Runner/GoogleService-Info.plist)
- [ios/Podfile](file://ios/Podfile)
- [web/index.html](file://web/index.html)
- [web/manifest.json](file://web/manifest.json)
- [linux/CMakeLists.txt](file://linux/CMakeLists.txt)
- [macos/Runner/Info.plist](file://macos/Runner/Info.plist)
- [windows/CMakeLists.txt](file://windows/CMakeLists.txt)
</cite>

## Update Summary
**Changes Made**
- Added comprehensive Firebase integration documentation for Android and iOS platforms
- Updated Android implementation to include Google Services plugin configuration
- Enhanced iOS implementation with Firebase configuration and GoogleService-Info.plist
- Added Firebase options configuration and initialization patterns
- Updated application ID configurations for both platforms
- Integrated Firebase authentication and core services

## Table of Contents
1. [Introduction](#introduction)
2. [Project Structure](#project-structure)
3. [Core Components](#core-components)
4. [Architecture Overview](#architecture-overview)
5. [Detailed Component Analysis](#detailed-component-analysis)
6. [Firebase Integration](#firebase-integration)
7. [Dependency Analysis](#dependency-analysis)
8. [Performance Considerations](#performance-considerations)
9. [Troubleshooting Guide](#troubleshooting-guide)
10. [Conclusion](#conclusion)
11. [Appendices](#appendices)

## Introduction
This document explains the platform-specific implementation of ZB-DEZINE across Android, iOS, Web, Windows, macOS, and Linux. It covers build configurations, permissions, integrations, deployment settings, and platform-specific optimizations. The application now includes comprehensive Firebase integration for authentication and cloud services, with enhanced Google Services configuration for both Android and iOS platforms.

## Project Structure
ZB-DEZINE follows a standard Flutter monorepo layout with platform-specific folders under android/, ios/, linux/, macos/, windows/, and web/. The application bootstraps in lib/main.dart and initializes dependency injection via lib/core/di/dependency_injection.dart. Platform-specific build and packaging logic is defined in each platform's dedicated configuration files, with Firebase integration managed through lib/firebase_options.dart.

```mermaid
graph TB
A["lib/main.dart"] --> B["lib/core/di/dependency_injection.dart"]
A --> C["lib/firebase_options.dart"]
A --> D["pubspec.yaml"]
A --> E["android/app/src/main/AndroidManifest.xml"]
A --> F["android/app/google-services.json"]
A --> G["ios/Runner/GoogleService-Info.plist"]
A --> H["ios/Runner/Info.plist"]
A --> I["web/index.html"]
A --> J["linux/CMakeLists.txt"]
A --> K["macos/Runner/Info.plist"]
A --> L["windows/CMakeLists.txt"]
```

**Diagram sources**
- [lib/main.dart:12-19](file://lib/main.dart#L12-L19)
- [lib/core/di/dependency_injection.dart:11-26](file://lib/core/di/dependency_injection.dart#L11-L26)
- [lib/firebase_options.dart:17-68](file://lib/firebase_options.dart#L17-L68)
- [pubspec.yaml:82-118](file://pubspec.yaml#L82-L118)
- [android/app/src/main/AndroidManifest.xml:1-46](file://android/app/src/main/AndroidManifest.xml#L1-L46)
- [android/app/google-services.json:1-46](file://android/app/google-services.json#L1-L46)
- [ios/Runner/GoogleService-Info.plist:1-34](file://ios/Runner/GoogleService-Info.plist#L1-L34)
- [ios/Runner/Info.plist:1-50](file://ios/Runner/Info.plist#L1-L50)
- [web/index.html:1-39](file://web/index.html#L1-L39)
- [linux/CMakeLists.txt:1-129](file://linux/CMakeLists.txt#L1-L129)
- [macos/Runner/Info.plist:1-33](file://macos/Runner/Info.plist#L1-L33)
- [windows/CMakeLists.txt:1-109](file://windows/CMakeLists.txt#L1-L109)

**Section sources**
- [lib/main.dart:12-19](file://lib/main.dart#L12-L19)
- [pubspec.yaml:82-118](file://pubspec.yaml#L82-L118)

## Core Components
- Application bootstrap and routing are initialized in lib/main.dart. The app reads a token from persistent storage during startup and selects the initial route accordingly.
- Dependency injection is centralized in lib/core/di/dependency_injection.dart, registering storage, theme, and network services. Firebase is initialized during dependency injection using DefaultFirebaseOptions.currentPlatform.
- Firebase integration is managed through lib/firebase_options.dart, which provides platform-specific configuration for Android and iOS.

Key behaviors:
- Token retrieval and conditional routing based on presence of a stored token.
- Global theme initialization using ScreenUtil and GetMaterialApp.
- Shared service registration for storage, theme, and HTTP networking.
- Automatic Firebase initialization with platform-specific configuration.

**Section sources**
- [lib/main.dart:12-19](file://lib/main.dart#L12-L19)
- [lib/main.dart:21-46](file://lib/main.dart#L21-L46)
- [lib/core/di/dependency_injection.dart:11-26](file://lib/core/di/dependency_injection.dart#L11-L26)
- [lib/core/di/dependency_injection.dart:14-17](file://lib/core/di/dependency_injection.dart#L14-L17)
- [lib/firebase_options.dart:17-68](file://lib/firebase_options.dart#L17-L68)

## Architecture Overview
The runtime architecture is consistent across platforms, with platform-specific build and packaging steps. The Flutter engine renders UI, while platform channels and native integrations are configured per platform. Firebase services are integrated through a unified configuration system managed by DefaultFirebaseOptions.

```mermaid
graph TB
subgraph "Shared"
L["lib/main.dart"]
DI["lib/core/di/dependency_injection.dart"]
FO["lib/firebase_options.dart"]
end
subgraph "Android"
AMF["AndroidManifest.xml"]
ABG["app/build.gradle.kts"]
GSJ["google-services.json"]
end
subgraph "iOS"
IPL["Info.plist"]
AP["AppDelegate.swift"]
POD["Podfile"]
GSI["GoogleService-Info.plist"]
end
subgraph "Web"
WIDX["web/index.html"]
WMF["web/manifest.json"]
end
subgraph "Desktop"
LC["linux/CMakeLists.txt"]
MC["macos/Info.plist"]
WC["windows/CMakeLists.txt"]
end
L --> DI
DI --> FO
L --> AMF
L --> IPL
L --> WIDX
L --> LC
L --> MC
L --> WC
AMF --> ABG
ABG --> GSJ
IPL --> AP
AP --> POD
POD --> GSI
```

**Diagram sources**
- [lib/main.dart:12-19](file://lib/main.dart#L12-L19)
- [lib/core/di/dependency_injection.dart:11-26](file://lib/core/di/dependency_injection.dart#L11-L26)
- [lib/firebase_options.dart:17-68](file://lib/firebase_options.dart#L17-L68)
- [android/app/src/main/AndroidManifest.xml:1-46](file://android/app/src/main/AndroidManifest.xml#L1-L46)
- [android/app/build.gradle.kts:1-48](file://android/app/build.gradle.kts#L1-L48)
- [android/app/google-services.json:1-46](file://android/app/google-services.json#L1-L46)
- [ios/Runner/Info.plist:1-50](file://ios/Runner/Info.plist#L1-L50)
- [ios/Runner/AppDelegate.swift:1-14](file://ios/Runner/AppDelegate.swift#L1-L14)
- [ios/Podfile:1-44](file://ios/Podfile#L1-L44)
- [ios/Runner/GoogleService-Info.plist:1-34](file://ios/Runner/GoogleService-Info.plist#L1-L34)
- [web/index.html:1-39](file://web/index.html#L1-L39)
- [web/manifest.json:1-36](file://web/manifest.json#L1-L36)
- [linux/CMakeLists.txt:1-129](file://linux/CMakeLists.txt#L1-L129)
- [macos/Runner/Info.plist:1-33](file://macos/Runner/Info.plist#L1-L33)
- [windows/CMakeLists.txt:1-109](file://windows/CMakeLists.txt#L1-L109)

## Detailed Component Analysis

### Android Implementation
- Build configuration
  - Application module build script applies Android application, Google Services, Kotlin, and Flutter Gradle plugins. The Google Services plugin (com.google.gms.google-services) is integrated for Firebase support.
  - Sets compile/target SDK versions via Flutter SDK defaults, Java/Kotlin JVM target to 17, and uses the Flutter-sourced applicationId "zbdezign.com.au".
  - Top-level Gradle config centralizes build output and evaluation dependencies on the app module.
- Manifest and permissions
  - Declares the main activity, export status, launch theme, hardware acceleration, orientation and UI mode config changes, and intent queries for text processing.
  - Includes Flutter embedding metadata.
- Theming
  - Defines light launch and normal themes for the activity window background.
- Deployment settings
  - Release signing config references the debug keystore for development builds.
- Firebase Integration
  - google-services.json contains Firebase project configuration including API keys, OAuth clients, and mobile SDK app ID.
  - Application ID "zbdezign.com.au" matches the Firebase configuration.

```mermaid
flowchart TD
Start(["Android Build Start"]) --> ApplyPlugins["Apply Gradle Plugins<br/>Android App, Google Services, Kotlin, Flutter"]
ApplyPlugins --> ConfigureSDK["Configure compile/target SDK<br/>Java/Kotlin 17"]
ConfigureSDK --> DefaultConfig["Set applicationId: zbdezign.com.au<br/>minSdk, targetSdk, versionCode, versionName"]
DefaultConfig --> BuildTypes["Configure build types<br/>Release uses debug signing"]
BuildTypes --> FirebaseConfig["Integrate Google Services<br/>google-services.json"]
FirebaseConfig --> FlutterSource["Flutter source path"]
FlutterSource --> End(["Build Complete"])
```

**Diagram sources**
- [android/app/build.gradle.kts:1-48](file://android/app/build.gradle.kts#L1-L48)
- [android/build.gradle.kts:1-25](file://android/build.gradle.kts#L1-L25)
- [android/app/google-services.json:1-46](file://android/app/google-services.json#L1-L46)

**Section sources**
- [android/app/build.gradle.kts:11-43](file://android/app/build.gradle.kts#L11-L43)
- [android/app/src/main/AndroidManifest.xml:6-33](file://android/app/src/main/AndroidManifest.xml#L6-L33)
- [android/app/src/main/res/values/styles.xml:3-17](file://android/app/src/main/res/values/styles.xml#L3-L17)
- [android/build.gradle.kts:8-20](file://android/build.gradle.kts#L8-L20)
- [android/app/google-services.json:1-46](file://android/app/google-services.json#L1-L46)

### iOS Implementation
- Build configuration
  - Podfile configures CocoaPods, locates Flutter root, installs iOS pods, and applies additional build settings for the target.
  - Uses framework-based linking with use_frameworks! for better compatibility.
- App metadata and capabilities
  - Info.plist defines bundle identifiers, display names, supported orientations (including iPad), and enables indirect input events and minimum frame duration on iPhone.
- App lifecycle
  - AppDelegate registers plugins and defers to the Flutter app delegate.
- Firebase Integration
  - GoogleService-Info.plist contains Firebase configuration for iOS including client ID, API key, bundle ID "zbdezign.com.au", and Google App ID.
  - iOS-specific configurations include client ID and bundle ID matching the Android application ID.
- Deployment settings
  - Platform targeting and pod installation are handled by the Podfile.

```mermaid
sequenceDiagram
participant Dev as "Developer"
participant Pods as "Podfile"
participant Xcode as "Xcode Build"
participant App as "AppDelegate"
participant Firebase as "Firebase Services"
Dev->>Pods : Run pod install
Pods->>Xcode : Configure build settings and targets
Xcode->>App : Launch application
App->>Firebase : Initialize with GoogleService-Info.plist
Firebase-->>App : Firebase services ready
App->>Flutter : Register plugins
Flutter-->>Dev : Render app
```

**Diagram sources**
- [ios/Podfile:28-43](file://ios/Podfile#L28-L43)
- [ios/Runner/AppDelegate.swift:4-13](file://ios/Runner/AppDelegate.swift#L4-L13)
- [ios/Runner/Info.plist:25-47](file://ios/Runner/Info.plist#L25-L47)
- [ios/Runner/GoogleService-Info.plist:1-34](file://ios/Runner/GoogleService-Info.plist#L1-L34)

**Section sources**
- [ios/Podfile:1-44](file://ios/Podfile#L1-L44)
- [ios/Runner/Info.plist:19-47](file://ios/Runner/Info.plist#L19-L47)
- [ios/Runner/AppDelegate.swift:1-14](file://ios/Runner/AppDelegate.swift#L1-L14)
- [ios/Runner/GoogleService-Info.plist:1-34](file://ios/Runner/GoogleService-Info.plist#L1-L34)

### Web Implementation
- Progressive Web App support
  - index.html includes a base href placeholder for deployment paths, Apple touch icon meta tags for iOS mobile web apps, favicon, and a manifest link.
  - manifest.json defines standalone display, theme/background colors, orientation, and multiple icon sizes including maskable variants.
- Browser compatibility and deployment
  - Uses Flutter's web bootstrap script and PWA manifest integration for offline caching and installability.

```mermaid
flowchart TD
Start(["Web Build"]) --> HTML["Inject base href and manifest link"]
HTML --> PWA["Serve PWA manifest with icons"]
PWA --> Bootstrap["Load Flutter bootstrap script"]
Bootstrap --> End(["Render PWA"])
```

**Diagram sources**
- [web/index.html:17-36](file://web/index.html#L17-L36)
- [web/manifest.json:1-36](file://web/manifest.json#L1-L36)

**Section sources**
- [web/index.html:19-36](file://web/index.html#L19-L36)
- [web/manifest.json:1-36](file://web/manifest.json#L1-L36)

### Desktop Implementations
- Linux
  - CMake defines binary name, application ID, standard compiler settings, Flutter managed directory, GTK system dependencies, and installation of assets and ICU data. It supports Debug/Profile/Release modes and installs AOT libraries for non-Debug builds.
- macOS
  - Info.plist defines bundle identifiers, display name, minimum system version, and main nib/class entries for the app.
- Windows
  - CMake defines binary name, Unicode definitions, standard compiler settings, Flutter managed directory, and installation of assets, ICU data, and AOT libraries for Profile/Release. It supports in-place installation for Visual Studio builds.

```mermaid
graph TB
subgraph "Linux"
L1["Binary name and ID"]
L2["GTK pkg-config and Flutter"]
L3["Install assets and ICU"]
L4["AOT install for non-Debug"]
end
subgraph "macOS"
M1["Bundle info and main nib/class"]
end
subgraph "Windows"
W1["Unicode and compiler flags"]
W2["Flutter managed and plugins"]
W3["Install assets and AOT"]
end
```

**Diagram sources**
- [linux/CMakeLists.txt:7-129](file://linux/CMakeLists.txt#L7-L129)
- [macos/Runner/Info.plist:19-31](file://macos/Runner/Info.plist#L19-L31)
- [windows/CMakeLists.txt:7-109](file://windows/CMakeLists.txt#L7-L109)

**Section sources**
- [linux/CMakeLists.txt:1-129](file://linux/CMakeLists.txt#L1-L129)
- [macos/Runner/Info.plist:1-33](file://macos/Runner/Info.plist#L1-L33)
- [windows/CMakeLists.txt:1-109](file://windows/CMakeLists.txt#L1-L109)

## Firebase Integration

### Firebase Configuration Overview
ZB-DEZINE implements comprehensive Firebase integration through a unified configuration system managed by DefaultFirebaseOptions. This system provides platform-specific Firebase configurations for Android and iOS while maintaining a consistent interface across platforms.

### Android Firebase Configuration
- Application ID: "zbdezign.com.au"
- Project ID: "shopping-cart-b246f"
- Storage Bucket: "shopping-cart-b246f.firebasestorage.app"
- API Key: "AIzaSyBZipNuaf7fAACtSWPBEIcMDEyiVxVWa8Q"
- Mobile SDK App ID: "1:375214531894:android:0809bb69eeb53858d93f97"
- OAuth Client ID: "375214531894-fki8g1s7vrciefa8iusb3f8jlsk6t9jf.apps.googleusercontent.com"

### iOS Firebase Configuration
- Bundle ID: "zbdezign.com.au"
- Project ID: "shopping-cart-b246f"
- Storage Bucket: "shopping-cart-b246f.firebasestorage.app"
- API Key: "AIzaSyB0QvxCClcbLUPtA79cav2RZXErqjInbkg"
- Google App ID: "1:375214531894:ios:52fd78dcbfadf3d5d93f97"
- iOS Client ID: "375214531894-4tjukvbm260dil3so646h1taa9a3esqp.apps.googleusercontent.com"

### Firebase Initialization Process
The Firebase initialization process follows a structured approach:
1. Dependency injection initializes Firebase during app startup
2. DefaultFirebaseOptions.currentPlatform selects platform-specific configuration
3. Firebase.initializeApp is called with the selected options
4. Firebase services are available throughout the application lifecycle

```mermaid
flowchart TD
Start(["App Startup"]) --> InitDI["Initialize Dependency Injection"]
InitDI --> FirebaseInit["Firebase.initializeApp"]
FirebaseInit --> OptionsSelect["DefaultFirebaseOptions.currentPlatform"]
OptionsSelect --> AndroidCheck{"Platform?"}
AndroidCheck --> |Android| AndroidConfig["Load Android Firebase Options"]
AndroidCheck --> |iOS| iOSConfig["Load iOS Firebase Options"]
AndroidConfig --> ServicesReady["Firebase Services Ready"]
iOSConfig --> ServicesReady
ServicesReady --> AppRun["Application Running"]
```

**Diagram sources**
- [lib/core/di/dependency_injection.dart:14-17](file://lib/core/di/dependency_injection.dart#L14-L17)
- [lib/firebase_options.dart:17-68](file://lib/firebase_options.dart#L17-L68)

**Section sources**
- [lib/firebase_options.dart:17-68](file://lib/firebase_options.dart#L17-L68)
- [lib/core/di/dependency_injection.dart:14-17](file://lib/core/di/dependency_injection.dart#L14-L17)
- [android/app/google-services.json:1-46](file://android/app/google-services.json#L1-L46)
- [ios/Runner/GoogleService-Info.plist:1-34](file://ios/Runner/GoogleService-Info.plist#L1-L34)

## Dependency Analysis
- Shared dependencies and assets
  - pubspec.yaml declares Flutter SDK, UI and utility packages, and Firebase-related packages including firebase_core (^3.10.1), firebase_auth (^5.3.1), and google_sign_in (^6.2.2).
  - Defines assets and fonts for the app.
- Platform-specific build-time dependencies
  - Android integrates Google Services plugin and Kotlin for Firebase support.
  - iOS uses CocoaPods and Flutter pod helper with Firebase configuration files.
  - Web relies on PWA manifest and bootstrap script.
  - Desktop platforms rely on CMake and system libraries (GTK on Linux).
- Firebase integration dependencies
  - Both Android and iOS platforms include Firebase configuration files (google-services.json and GoogleService-Info.plist).
  - DefaultFirebaseOptions manages platform-specific Firebase configurations.

```mermaid
graph LR
P["pubspec.yaml"] --> A["Android Gradle + Google Services"]
P --> I["iOS Pods + Firebase Config"]
P --> W["Web PWA"]
P --> L["Linux CMake"]
P --> MAC["macOS Info.plist"]
P --> WIN["Windows CMake"]
A --> GS["google-services.json"]
I --> GSI["GoogleService-Info.plist"]
```

**Diagram sources**
- [pubspec.yaml:30-66](file://pubspec.yaml#L30-L66)
- [pubspec.yaml:88-118](file://pubspec.yaml#L88-L118)
- [android/app/build.gradle.kts:1-9](file://android/app/build.gradle.kts#L1-L9)
- [ios/Podfile:28-36](file://ios/Podfile#L28-L36)
- [web/index.html:32-36](file://web/index.html#L32-L36)
- [linux/CMakeLists.txt:50-51](file://linux/CMakeLists.txt#L50-L51)
- [windows/CMakeLists.txt:49-50](file://windows/CMakeLists.txt#L49-L50)
- [android/app/google-services.json:1-46](file://android/app/google-services.json#L1-L46)
- [ios/Runner/GoogleService-Info.plist:1-34](file://ios/Runner/GoogleService-Info.plist#L1-L34)

**Section sources**
- [pubspec.yaml:30-66](file://pubspec.yaml#L30-L66)
- [pubspec.yaml:88-118](file://pubspec.yaml#L88-L118)
- [android/app/build.gradle.kts:1-9](file://android/app/build.gradle.kts#L1-L9)
- [ios/Podfile:28-36](file://ios/Podfile#L28-L36)
- [web/index.html:32-36](file://web/index.html#L32-L36)
- [linux/CMakeLists.txt:50-51](file://linux/CMakeLists.txt#L50-L51)
- [windows/CMakeLists.txt:49-50](file://windows/CMakeLists.txt#L49-L50)

## Performance Considerations
- Android
  - Hardware acceleration enabled for smoother rendering.
  - ConfigChanges include orientation and UI mode to reduce restarts during rotation.
  - Google Services integration adds minimal overhead with lazy initialization.
- iOS
  - Minimum frame duration disabled on iPhone to allow higher refresh rates where supported.
  - Indirect input events enabled for advanced input handling.
  - Firebase configuration loaded from GoogleService-Info.plist for optimal performance.
- Web
  - PWA manifest and bootstrap script enable fast loading and offline readiness.
- Desktop
  - Compiler flags and AOT library installation for optimized runtime performance on Linux and Windows.
  - Linux uses RPATH to load bundled libraries efficiently.
- Firebase Optimization
  - DefaultFirebaseOptions provides efficient platform selection without runtime overhead.
  - Firebase services initialized once during dependency injection.

**Section sources**
- [android/app/src/main/AndroidManifest.xml:13-14](file://android/app/src/main/AndroidManifest.xml#L13-L14)
- [android/app/src/main/AndroidManifest.xml:12](file://android/app/src/main/AndroidManifest.xml#L12)
- [ios/Runner/Info.plist:44-47](file://ios/Runner/Info.plist#L44-L47)
- [web/index.html:36](file://web/index.html#L36)
- [linux/CMakeLists.txt:44-46](file://linux/CMakeLists.txt#L44-L46)
- [windows/CMakeLists.txt:42-44](file://windows/CMakeLists.txt#L42-L44)
- [lib/core/di/dependency_injection.dart:14-17](file://lib/core/di/dependency_injection.dart#L14-L17)

## Troubleshooting Guide
- Android
  - If release builds fail, verify signing configuration and ensure keystore availability.
  - If the app does not launch, confirm the MAIN action and LAUNCHER category are present in the manifest.
  - If Firebase services fail to initialize, verify google-services.json integrity and application ID match.
- iOS
  - If pods fail to install, ensure Flutter root is correctly detected and run the Flutter pod setup helper.
  - If the app does not render, check plugin registration in AppDelegate.
  - If Firebase services fail to initialize, verify GoogleService-Info.plist contains correct bundle ID and API keys.
- Web
  - If PWA icons or manifest are missing, verify manifest.json paths and icons array.
  - If base href causes routing issues, rebuild with the correct base-href argument.
- Desktop
  - If Linux fails to link GTK, ensure pkg-config and GTK development packages are installed.
  - If Windows AOT libraries are missing, confirm Profile/Release builds include the AOT artifact.
- Firebase Issues
  - Verify DefaultFirebaseOptions.currentPlatform returns correct platform configuration.
  - Check that firebase_options.dart matches platform-specific configuration files.
  - Ensure Firebase dependencies in pubspec.yaml are compatible with each other.

**Section sources**
- [android/app/build.gradle.kts:36-42](file://android/app/build.gradle.kts#L36-L42)
- [android/app/src/main/AndroidManifest.xml:23-26](file://android/app/src/main/AndroidManifest.xml#L23-L26)
- [ios/Podfile:13-26](file://ios/Podfile#L13-L26)
- [ios/Runner/AppDelegate.swift:10](file://ios/Runner/AppDelegate.swift#L10)
- [web/manifest.json:11-34](file://web/manifest.json#L11-L34)
- [linux/CMakeLists.txt:54-56](file://linux/CMakeLists.txt#L54-L56)
- [windows/CMakeLists.txt:105-108](file://windows/CMakeLists.txt#L105-L108)
- [lib/firebase_options.dart:17-68](file://lib/firebase_options.dart#L17-L68)

## Conclusion
ZB-DEZINE's platform-specific implementations leverage Flutter's unified codebase with targeted build and packaging configurations per platform. The enhanced Firebase integration provides robust authentication and cloud services across Android and iOS platforms. Android focuses on SDK alignment, Google Services integration, and Firebase configuration, while iOS emphasizes CocoaPods integration, Firebase plist configuration, and platform-specific app IDs. Web targets PWA readiness, and Desktop platforms optimize for native environments using CMake and system libraries. The unified DefaultFirebaseOptions system ensures consistent Firebase behavior across platforms while maintaining platform-specific optimizations.

## Appendices
- Versioning and build metadata
  - pubspec.yaml documents versioning semantics for Android (versionName/versionCode), iOS (CFBundleShortVersionString/CFBundleVersion), and Windows (product and file version parts with build suffix).
- Asset and font configuration
  - pubspec.yaml lists image and icon assets and outlines font inclusion from packages.
- Firebase Configuration Details
  - Android application ID: "zbdezign.com.au"
  - iOS bundle ID: "zbdezign.com.au"
  - Firebase Project ID: "shopping-cart-b246f"
  - Storage Bucket: "shopping-cart-b246f.firebasestorage.app"

**Section sources**
- [pubspec.yaml:12-19](file://pubspec.yaml#L12-L19)
- [pubspec.yaml:88-118](file://pubspec.yaml#L88-L118)
- [android/app/google-services.json:11-13](file://android/app/google-services.json#L11-L13)
- [ios/Runner/GoogleService-Info.plist:15-16](file://ios/Runner/GoogleService-Info.plist#L15-L16)
- [lib/firebase_options.dart:52-68](file://lib/firebase_options.dart#L52-L68)
# 🛋️ FurniGo

![Flutter](https://img.shields.io/badge/Flutter-3.24.0-blue?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.5.0-blue?logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-Auth-orange?logo=firebase&logoColor=white)
![GetX](https://img.shields.io/badge/State-GetX-purple)
![Platform](https://img.shields.io/badge/Platform-Android%20|%20iOS-lightgrey)
![CI/CD](https://img.shields.io/badge/CI%2FCD-GitHub_Actions-black?logo=github)

A cross-platform Flutter application for buying, selling, and renting new or used furniture for both residential and commercial spaces — with multi-category browsing and a clean, modern UI.

---

## 📌 About

FurniGo is a full-featured furniture marketplace that connects buyers, sellers, and renters on a single platform. Users can browse furniture across multiple categories, list their own items for sale or rent, and manage their profile — all within a smooth and responsive mobile experience.

---

## ✨ Features

- 🌗 Light & Dark mode support
- 🏠 Two user modes — Residential & Commercial
- 🔐 Firebase Authentication with user token management
- 🛒 Buy, sell, and rent new or used furniture
- 📦 Multi-category furniture browsing
- 👤 User profile editing
- 🔍 Smart search with Flutter Typeahead
- 📅 Date-based filtering with Table Calendar
- ⚙️ CI/CD pipeline via GitHub Actions

---
## 📸 Screenshots

> Add your app screenshots here
```
<img src="assets/screenshots/home_light.png" width="200"/>
<img src="assets/screenshots/home_dark.png" width="200"/>
<img src="assets/screenshots/product.png" width="200"/>
<img src="assets/screenshots/profile.png" width="200"/>
```

---

## 👥 User Modes

| Mode | Description |
|------|-------------|
| **Residential** | Individual users looking to furnish personal living spaces |
| **Commercial** | Businesses furnishing offices or commercial properties |

---

## 🛠️ Tech Stack

| Category | Technology |
|----------|------------|
| Framework | Flutter & Dart |
| State Management | GetX |
| Authentication | Firebase Auth |
| Local Storage | Get Storage |
| API | REST API |
| Architecture | MVVM |
| CI/CD | GitHub Actions |

---

## 📦 Packages Used

| Package | Purpose |
|---------|---------|
| `get` | State management, navigation & routing |
| `firebase_auth` | User authentication |
| `get_storage` | Local data storage & token management |
| `image_picker` | Pick images from gallery or camera |
| `flutter_screenutil` | Responsive UI scaling |
| `flutter_typeahead` | Search suggestions |
| `flutter_spinkit` | Loading animations |
| `table_calendar` | Calendar & date filtering |

---

## 🏗️ Architecture

This project follows **MVVM (Model-View-ViewModel)** architecture
with **GetX** for state management, dependency injection, and navigation.

```
lib/
├── core/              # Constants, theme, utilities, app colors, GetX navigation & route management
├── modules/           # Feature screens (View + ViewModel)
│   ├── binding/       # manage and bind controller data
│   ├── controller/    # logical and functional part
│   ├── view/          # implement Ui, logical, function code
│   └── widgets/       # shared element for this mod
└── main.dart          # main page of the app
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK >= 3.0.0
- Dart >= 3.0.0
- Android Studio or VS Code
- Firebase project configured

### Installation

```bash
# Clone the repository
git clone https://github.com/Ariful3111/Furnigo.git

# Navigate to project directory
cd Furnigo

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Firebase Setup

1. Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
2. Add your `google-services.json` inside `android/app/`
3. Add your `GoogleService-Info.plist` inside `ios/Runner/`
4. Enable **Email/Password** authentication in Firebase Console

---

## ⚙️ CI/CD

This project uses **GitHub Actions** for continuous integration.
On every push to the `main` branch, the pipeline automatically
builds and validates the Flutter application.

Pipeline file located at: `.github/workflows/`

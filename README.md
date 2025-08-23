# Flutter Riverpod Boilerplate

A production-ready Flutter boilerplate with Riverpod state management, following clean architecture principles and modern development practices.

## **Core Architecture**
- **Clean Architecture** with feature-based structure
- **Riverpod** with annotations and code generation
- **Dependency Injection** using Riverpod providers
- **GoRouter** to navigation

## Project Structure

```
lib/
├── core/                    # Core infrastructure
│   ├── config/             # App configuration
│   │   ├── router/         # GoRouter setup
│   │   └── localization/   # i18n configuration
│   ├── services/           # Core services
│   │   ├── api_client.dart # HTTP client
│   │   ├── storage_service.dart
│   │   └── interceptors/   # Request interceptors
│   ├── models/             # Shared models
│   ├── exceptions/         # Custom exceptions
│   └── extensions/         # Dart extensions
├── features/               # Feature modules
│   ├── example/            # Example CRUD feature
│   │   ├── data/          # Data layer
│   │   │   ├── models/    # Feature models
│   │   │   ├── datasources/ # Local & remote sources
│   │   │   └── repositories/ # Repository implementation
│   │   └── presentation/   # UI layer
│   │       ├── pages/     # Screen widgets
│   │       ├── controllers/ # Riverpod controllers
│   │       └── widgets/   # Feature widgets
│   └── home/              # Home feature
└── shared/                 # Shared UI components
    ├── widgets/           # Reusable widgets
    ├── theme/            # App theming
    └── strings/          # Shared translations
```

## Getting Started

### **Prerequisites**
- Flutter SDK 3.7+
- Dart 3.0+
- FVM: https://fvm.app/documentation/getting-started

### **Setup**
```
make setup
make run-dev
```

## Architecture Overview

### **Data Flow**
```
  Widget → Controller (@riverpod) → Repository → DataSource → API/Storage
      ↑        ↓                      ↑           ↑           ↑
     UI      State              Local+Remote   Dio HTTP   SharedPrefs
          (AsyncValue)          (offline-first) (interceptors)
```

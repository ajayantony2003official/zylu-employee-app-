# Zylu Employee App — Mobile Application (Flutter)

This is the Flutter mobile application for the Zylu Employee App.
It displays employee data fetched from a Laravel REST API and implements search, filtering, and UI state management using Clean Architecture and BLoC pattern.

---

## Tech Stack

* Flutter 3.22+
* Dart 3+
* BLoC (State Management)
* Clean Architecture
* REST API integration
* Cached Network Image
* HTTP package

---

## Architecture

This project follows Clean Architecture principles:

```text
lib/
├── core/
│    ├── constants/
│    ├── error/
│    ├── network/
│    └── widgets/
│
├── data/
│    ├── datasources/
│    ├── models/
│    └── repositories/
│
├── domain/
│    ├── entities/
│    ├── repositories/
│    └── usecases/
│
├── presentation/
│    ├── bloc/
│    ├── pages/
│    └── widgets/
│
└── main.dart
```

---

## Features

* Fetch employees from Laravel API
* Display employee list with profile image
* Search employees by name (client-side filtering)
* Show active and veteran status
* Show calculated experience years
* Skeleton loading while fetching data
* Error handling
* Responsive UI

---

## State Management

This project uses BLoC pattern for state management.

Flow:

```text
UI → Bloc → UseCase → Repository → API → Repository → Bloc → UI
```

---

## API Integration

The app connects to Laravel backend API:

```text
GET /api/employees
```

Base URL configured in:

```text
lib/core/constants/api_constants.dart
```

Example:

```dart
static const String baseUrl = "http://127.0.0.1:8000/api";
```

For Android emulator:

```dart
http://10.0.2.2:8000/api
```

---

## Setup Instructions

### 1. Install dependencies

```bash
flutter pub get
```

---

### 2. Run the application

```bash
flutter run
```

---

## Supported Platforms

* Android Emulator
* Android Physical Device

---

## Packages Used

* flutter_bloc
* equatable
* http
* cached_network_image
* dartz
* get_it

---

## Backend Repository

Laravel backend provides employee data via REST API.

Make sure backend is running before launching the app.

---

## Notes for Assessment Reviewer

Steps to run mobile app:

```bash
flutter pub get
flutter run
```

Ensure Laravel backend is running at:

```text
http://127.0.0.1:8000
```

or emulator URL:

```text
http://10.0.2.2:8000
```

---

## Author

Ajayantony M
Flutter Developer

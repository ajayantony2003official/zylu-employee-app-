# Zylu Employee App — Backend API (Laravel)

This is the Laravel REST API backend for the Zylu Employee App.
It provides employee data to the Flutter mobile application. Search and filtering logic are handled on the Flutter client side.

---

## Tech Stack

* Laravel 10+
* PHP 8.1+
* MySQL
* REST API
* Eloquent ORM
* Laravel Storage (for employee images)

---

## Features

* Employee listing API
* Public image access via Laravel storage
* Experience calculation field in API response
* Automated database seeding for testing
* Clean JSON API response structure

---

## API Endpoint

### Get All Employees

```http
GET /api/employees
```

This endpoint returns the complete list of employees.

Search and filtering are implemented on the Flutter mobile application.

---

## Example API Response

```json
[
  {
    "id": 1,
    "name": "Arun Prakash",
    "email": "arun.prakash@example.com",
    "role": "Senior Software Engineer",
    "joining_date": "2015-02-18",
    "experience_years": 10,
    "is_active": true,
    "image_url": "http://127.0.0.1:8000/storage/employees/1.jpg"
  }
]
```

---

## Setup Instructions

### 1. Install dependencies

```bash
composer install
```

### 2. Create environment file

```bash
cp .env.example .env
```

### 3. Configure database

Update `.env`:

```env
DB_DATABASE=zylu_employee
DB_USERNAME=root
DB_PASSWORD=
```

### 4. Generate application key

```bash
php artisan key:generate
```

### 5. Run migrations and seed database

```bash
php artisan migrate --seed
```

This will automatically insert 12 test employees.

---

### 6. Link storage

```bash
php artisan storage:link
```

---

### 7. Run server

```bash
php artisan serve
```

Server URL:

```text
http://127.0.0.1:8000
```

API URL:

```text
http://127.0.0.1:8000/api/employees
```

---

## Seeder

Seeder file:

```text
database/seeders/EmployeeSeeder.php
```

Run manually:

```bash
php artisan db:seed
```

---

## Architecture Note

The backend is responsible for:

* Providing employee data
* Managing database
* Serving employee images

The Flutter application handles:

* Search functionality
* Filtering logic
* UI state management using BLoC
* Client-side data processing

---

## Author

Ajayantony M
Flutter & Laravel Developer

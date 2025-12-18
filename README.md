ScholarCred Flutter Web Application

A Flutter Web application built as part of a machine test, featuring clean architecture, and state management using BLoC.
The application includes product listing, cart, order flow, and authentication modules.

✨ Features

Flutter Web

Clean Architecture (Data / Domain / Presentation)

State Management using flutter_bloc

Supabase integration (for products & backend)

Modular and scalable folder structure

Reusable UI components

Git version control with clean commits

📁 Project Structure

lib/
│
├── core/
│   ├── di/
│   │   └── injection.dart        # Dependency injection
│   └── images_path/
│       └── images.dart           # Centralized asset paths
│
├── features/
│   ├── auth/                     # Authentication feature
│   ├── cart/                     # Cart feature
│   ├── order/                    # Order & tracking feature
│   └── product/                  # Product feature
│       ├── data/
│       │   ├── data_sources/
│       │   │   └── supabase_product_data_sources.dart
│       │   └── model/
│       │       └── product_model.dart
│       │
│       ├── domain/
│       │   ├── entities/
│       │   │   └── product.dart
│       │   ├── repositories/
│       │   │   └── product_repository.dart
│       │   └── use_cases/
│       │
│       └── presentation/
│           ├── bloc/
│           │   ├── product_bloc.dart
│           │   ├── product_event.dart
│           │   └── product_state.dart
│           ├── pages/
│           └── widgets/
│
├── main.dart                     # Application entry point


🧱 Architecture Overview

This project follows Clean Architecture, divided into three main layers:

1️⃣ Presentation Layer

Contains UI widgets, pages, and BLoC

Handles user interaction and state rendering

Uses flutter_bloc for state management

presentation/
 ├── bloc/
 ├── pages/
 └── widgets/

2️⃣ Domain Layer

Business logic layer

Contains Entities, Repositories (abstract), and Use Cases

Independent of Flutter or external libraries

domain/
 ├── entities/
 ├── repositories/
 └── use_cases/

3️⃣ Data Layer

Handles data fetching from external sources (Supabase)

Converts raw data into domain entities

Implements repository contracts

data/
 ├── data_sources/
 └── model/


🚀 Getting Started (Setup Instructions)

Requirements:

Flutter SDK

Chrome browser (for Flutter Web)

Git

1️⃣ Clone the Repository
git clone https://github.com/jishnuSabu/Schalarcred_test.git
cd Schalarcred_test

2️⃣ Install Dependencies
flutter pub get

3️⃣ Run Flutter Web
flutter run -d chrome


🧪 Testing

flutter test


🛠️ Tools & Packages Used

Flutter

flutter_bloc

Supabase

Google Fonts

Git & GitHub

Firebase

📌 Firebase Hosting Deployment

1️⃣ Install Firebase CLI

npm install -g firebase-tools


2️⃣ Login to Firebase

firebase login


3️⃣ Initialize Firebase in the Project

firebase init


Select Hosting

Choose your Firebase project or create a new one

Set build/web as the public directory

Configure as a single-page app: Yes

4️⃣ Build Flutter Web

flutter build web


5️⃣ Deploy to Firebase Hosting

firebase deploy


Your Flutter Web application will now be live at your Firebase Hosting URL.

👤 Author
Jishnu Sabu
Flutter Developer

📄 License
This project is for evaluation and educational purposes.

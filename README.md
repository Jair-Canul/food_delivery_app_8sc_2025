# 🍕 FoodGo - Food Delivery App

Welcome to **FoodGo**, a complete food delivery application developed with Flutter. This project demonstrates a full user flow from sign-up to ordering, wallet management with Stripe integration, and a comprehensive admin dashboard using Firebase.

![App Demo](assets/FoodApp.gif)

---

## 🏫 Academic Information

* **Course:** [Programación de Aplicaciones Móviles]
* **Professor:** [Rodrigo Fidel Gaxiola Sosa]
* **Student:** [Jair David Canul Serralta]

---

## 🚀 Functionalities

The application features a robust set of tools for both Users and Admins, powered by Firebase backend and Stripe payments:

### 👤 User Features
* **Authentication:** Secure Sign Up and Login using Firebase Auth (Email/Password).
* **Dynamic Catalog:** Browse food categories (Pizza, Burger, Chinese, Mexican) managed via models.
* **Shopping Logic:** Add items to cart, view details, and manage orders.
* **Wallet & Payments:** * Digital wallet interface.
    * **Stripe Integration:** Securely add funds and process payments.
* **Order Tracking:** Real-time status updates (Pending/Delivered).
* **Profile:** User profile management.

### 🛡️ Admin Features
* **Admin Portal:** Secure login (`admin_login.dart`).
* **Dashboard:** Overview of app activity (`home_admin.dart`).
* **Order Management:** View and update order statuses (`all_order.dart`).
* **User Control:** Manage registered users (`manage_users.dart`).

---

## 🛠️ Technologies Used

* **Framework:** [Flutter](https://flutter.dev/) & [Dart](https://dart.dev/)
* **Backend:** [Firebase](https://firebase.google.com/) (Auth, Firestore)
* **Payments:** [Stripe](https://stripe.com/)
* **Version Control:** [GitHub](https://github.com/)
* **Animation:** [Rive](https://rive.app/)


---

## 📂 Project Structure

The project follows a clean architecture separating logic, models, and UI:

```text
lib/
├── Admin/
│   ├── admin_login.dart      # Admin authentication screen
│   ├── all_order.dart        # Screen to view all customer orders
│   ├── home_admin.dart       # Main Admin Dashboard
│   └── manage_users.dart     # User management interface
├── model/
│   ├── burger_model.dart     # Data model for Burgers
│   ├── category_model.dart   # Data model for Food Categories
│   ├── chinese_model.dart    # Data model for Chinese food
│   ├── mexican_model.dart    # Data model for Mexican food
│   └── pizza_model.dart      # Data model for Pizzas
├── pages/
│   ├── bottomnav.dart        # Bottom Navigation Bar logic
│   ├── detail_page.dart      # Product details and "Add to Cart"
│   ├── home.dart             # Main User Home Screen
│   ├── login.dart            # User Login Screen
│   ├── onboarding.dart       # Intro/Splash Screen
│   ├── order.dart            # User Order History Screen
│   ├── profile.dart          # User Profile Settings
│   ├── signup.dart           # User Registration Screen
│   └── wallet.dart           # Wallet UI and Stripe Payment logic
└── service/
    ├── auth.dart             # Authentication services
    ├── burger_data.dart      # Mock data/Providers for Burgers
    ├── category_data.dart    # Mock data/Providers for Categories
    ├── chinese_data.dart     # Mock data/Providers for Chinese food
    ├── constant.dart         # App constants (API Keys, Colors)
    ├── database.dart         # Firestore Database methods
    ├── mexican_data.dart     # Mock data/Providers for Mexican food
    ├── pizza_data.dart       # Mock data/Providers for Pizzas
    ├── shared_pref.dart      # Local storage handling
    ├── widget_support.dart   # Custom reusable widgets
    ├── firebase_options.dart # Firebase configuration
    └── main.dart             # App Entry Point
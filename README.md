# PayEZ Pay - Digital Wallet & FinTech App (Flutter)

PayEZ Pay is a portfolio-focused mobile application built with Flutter, simulating a modern digital wallet and bill payment service. The project was developed as a case study to demonstrate core skills in mobile development, backend integration, and state management, specifically targeting the booming FinTech sector in Egypt and the wider MENA region.


## ✨ Core Features

* **Secure User Authentication:** Full email & password sign-up and login flow using Firebase Authentication.
* **Real-time Dashboard:** A dynamic home screen that displays the user's current balance and personal information, updated instantly from Firestore.
* **Live Transaction History:** The user's balance and transaction list update in real-time without needing a manual refresh, powered by Firestore Streams.
* **Wallet Top-Up:** A simulated feature allowing users to add funds to their wallet, demonstrating secure balance update logic.
* **Bill Payments:** A core FinTech feature where users can pay for mock services, with transactions only succeeding if the wallet balance is sufficient.
* **Profile & Settings Management:** Users can manage their profile, change their password, and log out securely.
* **Add Biometric Authentcation:** to make any tranaction you must add your phone main authentication like PIN or another biometric auth  
* **Localization (i18n):** The app supports multiple languages (English & Arabic) using Flutter's l10n package.
* **Dynamic Theming:** Users can switch between a clean Light Mode and a sleek Dark Mode.

## 🛠️ Tech Stack & Architecture

This project was built with a modern, scalable, and professional tech stack.

* **Framework:** Flutter
* **Backend:** Google Firebase (Authentication & Firestore Database)
* **State Management:** Cubit / Riverpod for predictable and decoupled state logic.
* **Architecture:**
    * **Feature-First Structure:** Code is organized by feature (e.g., home, profile, auth) for maintainability.
    * **Auth Gate Pattern:** A central AuthGate widget listens to the global authentication state to securely direct users to either the login screen or the main app.
    * **Service Layer:** A dedicated service (FirestoreService) handles all communication with the backend, separating business logic from the UI.
* **Internationalization:** Flutter Localization (l10n)
* **Routing:** MaterialPageRoute for clear and simple navigation.

## 📱 App Showcase

This section demonstrates the core user flows of the application through animated GIFs.

<table>
  <tr>
    <td align="center">
      <h3>🏠 Home & Real-time Balance</h3>
      <img src="https://raw.githubusercontent.com/ZakariaAshraf/PayEZ-Pay/master/HomeflowGif.gif" alt="Home Dashboard" width="300">
    </td>
    <td align="center">
      <h3>💰 Add Money</h3>
      <img src="https://raw.githubusercontent.com/ZakariaAshraf/PayEZ-Pay/master/TopUpflowGif.gif" alt="Add Money & Payments" width="300">
    </td>
    <td align="center">
      <h3>💸 Bill Pay</h3>
      <img src="https://raw.githubusercontent.com/ZakariaAshraf/PayEZ-Pay/master/PayBillsflowGif.gif" alt="Add Money & Payments" width="300">
    </td>
  </tr>
</table>

## 🚀 Getting Started

To clone and run this project locally, follow these steps:

### Prerequisites:

* Flutter SDK installed.
* A configured IDE like VS Code or Android Studio.

### Clone the Repository:

```bash
git clone https://github.com/ZakariaAshraf/PayEZ-Pay.git
cd PayEZ-Pay
```


Set Up Firebase:

Create a new project on the Firebase Console.

Set up a new Flutter App within your Firebase project.

Follow the on-screen instructions to download the google-services.json (for Android) and GoogleService-Info.plist (for iOS) files and place them in the correct directories.

In the Firebase console, enable Authentication (Email/Password method) and Firestore Database.

Install Dependencies:
```bash
flutter pub get
```


Run the App:
```bash
flutter run
```


📝 Project Development Journey

This project was built following a structured development plan, moving through distinct phases from ideation to deployment.

Phase 0: Foundation & Planning: The project started with a clear PRD (Product Requirements Document), wireframes, and a development timeline. The Flutter project and Firebase backend were set up.

Phase 1: UI Shell & Models: All screens were built statically based on the wireframes, and the data models (UserModel, TransactionModel) were created to support the UI without logic.

Phase 2: Authentication: Firebase Authentication was integrated to build a fully functional and secure login/registration system, protected by the "Auth Gate" architecture.

Phase 3: Core FinTech Logic: The heart of the application was built using a FirestoreService and secure Firestore Transactions to handle balance updates and bill payments atomically and safely.

Phase 4: Polishing & Final Touches: The final phase involved adding localization, dynamic theming, error handling, loading indicators, and writing this comprehensive README to prepare the project for a professional portfolio.

This structured approach ensured a high-quality, maintainable, and robust final product.

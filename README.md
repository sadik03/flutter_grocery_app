# Flutter Grocery App

A beautiful and modern grocery shopping app built with Flutter, featuring Firebase authentication and a clean Material Design 3 UI.

## Features

- 🔐 **Firebase Authentication** - Email/Password login and signup
- 🛒 **Shopping Cart** - Add products to cart with quantity management
- 📦 **Product Catalog** - Browse products by categories
- 🎨 **Modern UI** - Clean Material Design 3 interface with animations
- 🌙 **Dark Mode** - Toggle between light and dark themes
- 🌍 **Multi-language Support** - English and Arabic localization
- 📱 **Responsive Design** - Works on all screen sizes

## Screenshots

[Add your app screenshots here]

## Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Android Studio / VS Code
- Firebase account

### Firebase Setup

1. **Create a Firebase Project**
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Create a new project or use an existing one
   - Enable Email/Password authentication in Authentication section

2. **Android Setup**
   - Download `google-services.json` from Firebase Console
   - Place it in `android/app/` directory
   - Update `android/app/build.gradle` with Firebase dependencies

3. **iOS Setup** (Optional)
   - Download `GoogleService-Info.plist` from Firebase Console
   - Place it in `ios/Runner/` directory
   - Update `ios/Podfile` with Firebase dependencies

4. **Web Setup** (Optional)
   - Add Firebase configuration to `web/index.html`

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/sadik03/flutter_grocery_app.git
   cd flutter_grocery_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── app/
│   ├── components/          # Reusable UI components
│   ├── data/
│   │   ├── local/          # Local storage (SharedPreferences)
│   │   ├── models/         # Data models
│   │   └── services/       # Services (AuthService, etc.)
│   ├── modules/            # Feature modules
│   │   ├── login/         # Login page
│   │   ├── signup/        # Signup page
│   │   ├── home/          # Home page
│   │   ├── cart/          # Shopping cart
│   │   ├── product_details/ # Product details
│   │   └── ...
│   └── routes/            # App routing
├── config/
│   ├── theme/             # App themes
│   └── translations/      # Localization files
└── utils/                 # Utility functions and constants
```

## Key Dependencies

- **get**: State management and routing
- **firebase_core**: Firebase initialization
- **firebase_auth**: Authentication
- **cloud_firestore**: Database
- **flutter_screenutil**: Responsive design
- **flutter_animate**: Animations
- **shared_preferences**: Local storage
- **badges**: Badge widgets
- **carousel_slider**: Image carousel
- **flutter_svg**: SVG support

## Authentication Flow

1. **Splash Screen** → Shows app logo
2. **Welcome Screen** → Introduction with "Get Started" button
3. **Login Screen** → Email/Password login with "Forgot Password" and "Sign Up" options
4. **Signup Screen** → Create new account with name, email, and password
5. **Home Screen** → Main app interface after successful authentication

## Firebase Configuration Required

Before running the app, you need to:

1. Add `google-services.json` to `android/app/`
2. Update `android/build.gradle` with:
   ```gradle
   dependencies {
       classpath 'com.google.gms:google-services:4.4.0'
   }
   ```
3. Update `android/app/build.gradle` with:
   ```gradle
   apply plugin: 'com.google.gms.google-services'
   ```

## Features to Implement

- [ ] Password reset functionality
- [ ] Google Sign-In
- [ ] Order history
- [ ] Payment integration
- [ ] Push notifications
- [ ] Product search
- [ ] Favorites/Wishlist
- [ ] User profile management

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

- GitHub: [@sadik03](https://github.com/sadik03)
- Repository: [flutter_grocery_app](https://github.com/sadik03/flutter_grocery_app)

## Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- GetX for state management
- All open-source contributors

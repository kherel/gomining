# Gomining Wallet

## Features

- **Bitcoin Wallet Management**: Send and receive Bitcoin transactions
- **Real-time Balance Tracking**: View confirmed and unconfirmed balances
- **Transaction History**: Complete transaction history with status tracking
- **QR Code Support**: Generate and scan QR codes for easy address sharing
- **Multi-language Support**: Available in English and Russian
- **Modern UI**: Clean, branded interface with custom Figtree font family
- **Address Validation**: Built-in Bitcoin address validation
- **Testnet Support**: Currently configured for Bitcoin testnet

## Architecture

The app follows a clean architecture pattern with:

- **State Management**: Flutter Bloc for predictable state management
- **Dependency Injection**: GetIt for service locator pattern
- **API Integration**: Dio for HTTP client with Bitcoin blockchain APIs
- **Internationalization**: Slang for type-safe translations
- **Custom UI Components**: Branded design system with reusable widgets

## Tech Stack

- **Framework**: Flutter 3.8.1+
- **State Management**: flutter_bloc
- **HTTP Client**: Dio
- **Dependency Injection**: GetIt
- **Internationalization**: Slang
- **QR Code**: qr_flutter
- **Bitcoin Validation**: btc_address_validate_swan

## Project Structure

```
lib/
├── config/           # App configuration and setup
├── logic/           # Business logic and state management
│   ├── api/         # API services and clients
│   ├── cubits/      # BLoC state management
│   ├── models/      # Data models
│   └── get_it/      # Dependency injection services
├── ui/              # User interface
│   ├── pages/       # App screens
│   ├── widgets/     # Reusable UI components
│   ├── theme/       # App theming and branding
│   └── utils/       # UI utilities
└── main.dart        # App entry point
```

## Getting Started

### Prerequisites

- Flutter SDK 3.8.1 or higher
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- iOS Simulator / Android Emulator or physical device

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd gomining_kherel
```

2. Install dependencies:
```bash
flutter pub get
```

3. Generate translations:
```bash
flutter packages pub run slang
```

4. Run the app:
```bash
flutter run
```

## Configuration

The app is currently configured to work with Bitcoin testnet. To change the network:

1. Update `lib/config/api_config.dart` with your preferred Bitcoin node URL
2. Modify the blockchain stream URL if needed

## Features Overview

### Wallet Management
- View total balance (confirmed + unconfirmed)
- Send Bitcoin to any valid address
- Receive Bitcoin with QR code generation
- Address validation and error handling

### Transaction History
- Complete transaction list with timestamps
- Transaction status (confirmed/pending)
- Incoming/outgoing transaction indicators
- Real-time updates

### User Interface
- Modern, clean design with custom branding
- Responsive layout for different screen sizes
- Dark/light theme support
- Intuitive navigation with bottom bar

## Development

### Code Generation
Run the following commands when making changes:

```bash
# Generate translations
flutter packages pub run slang

# Generate dependency injection
flutter packages pub run build_runner build
```

### Testing
```bash
flutter test
```

## API Integration

The app integrates with:
- **Bitcoin Testnet Node**: For blockchain data and transaction broadcasting
- **Blockstream API**: For additional blockchain information and transaction details

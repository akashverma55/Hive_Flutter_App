# Hive Database Demo App

A Flutter application demonstrating the use of Hive database for local data storage. This app allows users to manage a simple product inventory with CRUD (Create, Read, Update, Delete) operations.

## Features

- ✅ Add new products with name and price
- ✅ View all stored products in a list
- ✅ Edit existing product information
- ✅ Delete products from the database
- ✅ Form validation for required fields
- ✅ Beautiful UI with teal accent theme
- ✅ Background image support
- ✅ Real-time data updates

## Screenshots

### Main Interface
![image](https://github.com/user-attachments/assets/b8daeb15-6761-479a-8782-d9678292c431)

## Technologies Used

- **Flutter**: Cross-platform mobile app development framework
- **Hive**: Lightweight and fast NoSQL database for Flutter
- **Material Design**: Google's design system for beautiful UI

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  hive_flutter: ^1.1.0
```

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/akashverma55/Hive_Flutter_App.git
   cd hive_demoapp
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Add background image (optional)**
   - Create an `assets/images/` folder in your project root
   - Add your background image as `bg.png`
   - Update `pubspec.yaml` to include assets:
   ```yaml
   flutter:
     assets:
       - assets/images/
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart          # Main application file with UI and logic
assets/
├── images/
    └── bg.png         # Background image (optional)
```

## How It Works

### Database Operations

The app uses Hive database with the following operations:

- **Initialize**: `Hive.initFlutter()` and `Hive.openBox("MyBox")`
- **Create**: `mybox.add(data)` - Adds new product
- **Read**: `mybox.keys` and `mybox.get(key)` - Retrieves all products
- **Update**: `mybox.put(key, updatedData)` - Updates existing product
- **Delete**: `mybox.delete(key)` - Removes product

### Key Features Implementation

1. **Form Validation**: Ensures both product name and price are filled
2. **Edit Mode**: Click edit icon to populate form with existing data
3. **Cancel Edit**: Cancel button appears during edit mode
4. **Real-time Updates**: UI refreshes automatically after any database operation
5. **Input Formatting**: Price field accepts only numeric input

## Code Highlights

### Database Initialization
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("MyBox");
  runApp(const MyApp());
}
```

### CRUD Operations
```dart
// Create
Future<void> _addItem(Map<String, dynamic> data) async {
  await mybox.add(data);
  _getItem();
}

// Update
Future<void> _updateItem(dynamic key, Map<String, dynamic> updatedData) async {
  await mybox.put(key, updatedData);
  _getItem();
}

// Delete
Future<void> _deleteItem(dynamic key) async {
  await mybox.delete(key);
  _getItem();
}
```

## Customization

### Changing Theme Colors
The app uses a teal accent theme. To customize colors, modify the color values in the `build` method:

```dart
// Primary color
Color.fromARGB(255, 0, 80, 75)

// Accent color
Colors.tealAccent

// Background colors
Colors.teal[50]
```

### Adding More Fields
To add more product fields:

1. Update the data map structure in `_addItem` and `_updateItem`
2. Add new `TextEditingController` for the field
3. Create additional `TextField` widgets in the UI
4. Update the `_getItem` method to include new fields

## Troubleshooting

### Common Issues

1. **Hive box not opening**
   - Ensure `Hive.initFlutter()` is called before `Hive.openBox()`
   - Check if the box name is consistent throughout the app

2. **Background image not showing**
   - Verify the image path in `pubspec.yaml`
   - Ensure the image file exists in `assets/images/bg.png`
   - Run `flutter pub get` after updating `pubspec.yaml`

3. **Build errors**
   - Run `flutter clean` and `flutter pub get`
   - Check Flutter and Dart SDK versions

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is open source and available under the [MIT License](LICENSE).

## Contact

For questions or suggestions, please open an issue in the repository.

---

**Happy Coding! 🚀**

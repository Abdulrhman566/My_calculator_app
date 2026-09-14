# 🧮 Calculator App

A clean, dark-themed calculator built with Flutter — basic arithmetic
(add, subtract, multiply, divide), percent, sign toggle, and a running
expression preview above the main display.

## 🗂 Project structure

```
calculator_app/
├── pubspec.yaml
└── lib/
    ├── main.dart                      # App entry point + theme
    ├── screens/
    │   └── calculator_screen.dart     # UI + state (button grid, display)
    ├── widgets/
    │   └── calculator_button.dart     # Reusable pill-shaped button
    └── utils/
        └── calculator_logic.dart      # Pure math + number formatting
```

No third-party packages required — just Flutter's SDK.

## 🚀 Run it

```bash
cd calculator_app
flutter pub get
flutter run
```

## ✨ Features

- `AC` clears everything; becomes `C` (clear current entry) once you've typed something
- `+/-` toggles the sign of the current number
- `%` divides the current number by 100
- Chained operations work like a standard calculator (e.g. `2 + 3 + 4 =` → `9`)
- Division by zero and invalid results show `Error`
- Display auto-shrinks (`FittedBox`) so long numbers never overflow

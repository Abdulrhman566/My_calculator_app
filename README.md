# 🧮 Calculator App

A clean, dark-themed calculator built with Flutter — basic arithmetic,
percent, sign toggle, chained operations, and a running expression
preview above the main display. Zero third-party dependencies.

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)
![Platform](https://img.shields.io/badge/platform-iOS%20%7C%20Android-lightgrey)
![License](https://img.shields.io/badge/license-MIT-green)

<p align="center">
  <img src="assets\images\Screenshot_20260914_041920_com.example.calculator_app[1].jpg" width="180" alt="Calculator screen" />
</p>

---

## ✨ Features

| Button | Behavior |
|---|---|
| `AC` / `C` | Clears everything (`AC`) or just the current entry (`C`) — label switches automatically once you've typed something |
| `+/-` | Toggles the sign of the number currently on screen |
| `%` | Divides the current number by 100 |
| `+ − × ÷` | Chain freely — e.g. `2 + 3 + 4 =` evaluates left-to-right to `9`, just like a standard calculator |
| `=` | Evaluates and shows the full expression (e.g. `12 + 8 =`) above the result |
| `.` | Adds a decimal point (ignored if the current number already has one) |

Extra touches:
- **Auto-shrinking display** — long results scale down with `FittedBox` instead of overflowing or truncating
- **Divide-by-zero / invalid math** shows `Error` instead of crashing
- **Pill-shaped buttons** with ripple feedback and a purple accent for operators

---

## 🗂 Project structure

```
calculator_app/
├── pubspec.yaml
└── lib/
    ├── main.dart                      # App entry point + theme
    ├── screens/
    │   └── calculator_screen.dart     # UI + state machine (button grid, display)
    ├── widgets/
    │   └── calculator_button.dart     # Reusable pill-shaped button
    └── utils/
        └── calculator_logic.dart      # Pure math + number formatting (no UI, easy to unit test)
```

### Why the logic lives in its own file
`calculator_logic.dart` has no Flutter imports — it's plain Dart. That
means `CalculatorLogic.apply()` and `CalculatorLogic.format()` can be
unit-tested directly, without spinning up widgets:

```dart
test('chained addition', () {
  final r = CalculatorLogic.apply('+', 2, 3);
  expect(CalculatorLogic.format(r), '5');
});
```

---

## 🚀 Getting started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) 3.x or newer
- A connected device, emulator, or simulator

### Run it

```bash
cd calculator_app
flutter pub get
flutter run
```

No code generation, no extra packages beyond Flutter's SDK — `flutter pub get` is all the setup you need.

---

## 🛣 Possible next steps

- [ ] Add scientific functions (√, x², 1/x)
- [ ] Keep a calculation history (list of past expressions)
- [ ] Add haptic feedback on button tap
- [ ] Light/dark theme toggle
- [ ] Unit tests for `CalculatorLogic` and widget tests for the button grid

---

## 📄 License

MIT — free to use, modify, and learn from.
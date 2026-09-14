/// Pure, UI-free calculator logic.
/// Kept separate from the screen so it's easy to test or reuse.
class CalculatorLogic {
  static double apply(String operator, double a, double b) {
    switch (operator) {
      case '+':
        return a + b;
      case '−':
        return a - b;
      case '×':
        return a * b;
      case '÷':
        return b == 0 ? double.nan : a / b;
      default:
        return b;
    }
  }

  /// Formats a double for display: drops the trailing ".0" for whole
  /// numbers, and trims trailing zeros for decimals.
  static String format(double value) {
    if (value.isNaN) return 'Error';
    if (value.isInfinite) return 'Error';

    if (value == value.roundToDouble() && value.abs() < 1e15) {
      return value.toStringAsFixed(0);
    }

    String text = value.toStringAsPrecision(10);
    if (text.contains('.')) {
      text = text.replaceFirst(RegExp(r'0+$'), '');
      text = text.replaceFirst(RegExp(r'\.$'), '');
    }
    return text;
  }
}

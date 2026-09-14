import 'package:flutter/material.dart';
import '../utils/calculator_logic.dart';
import '../widgets/calculator_button.dart';

const Color kBg = Color(0xFF16161D);
const Color kNumberBg = Color(0xFF2B2B35);
const Color kFunctionBg = Color(0xFF3A3A46);
const Color kOperatorBg = Color(0xFF6C4CE0);
const Color kOperatorActiveBg = Color(0xFFF4F1FF);

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0';
  String _expression = '';
  double? _operand1;
  String? _operator;
  bool _shouldResetDisplay = false;

  void _onDigit(String digit) {
    setState(() {
      if (_shouldResetDisplay) {
        _display = digit;
        _shouldResetDisplay = false;
      } else {
        _display = _display == '0' ? digit : _display + digit;
      }
    });
  }

  void _onDecimal() {
    setState(() {
      if (_shouldResetDisplay) {
        _display = '0.';
        _shouldResetDisplay = false;
      } else if (!_display.contains('.')) {
        _display = '$_display.';
      }
    });
  }

  void _onOperator(String op) {
    setState(() {
      final current = double.tryParse(_display) ?? 0;
      if (_operand1 != null && _operator != null && !_shouldResetDisplay) {
        final result = CalculatorLogic.apply(_operator!, _operand1!, current);
        _display = CalculatorLogic.format(result);
        _operand1 = result;
      } else {
        _operand1 = current;
      }
      _operator = op;
      _expression = '${CalculatorLogic.format(_operand1!)} $op';
      _shouldResetDisplay = true;
    });
  }

  void _onEquals() {
    setState(() {
      if (_operand1 == null || _operator == null) return;
      final current = double.tryParse(_display) ?? 0;
      final result = CalculatorLogic.apply(_operator!, _operand1!, current);
      _expression = '${CalculatorLogic.format(_operand1!)} $_operator '
          '${CalculatorLogic.format(current)} =';
      _display = CalculatorLogic.format(result);
      _operand1 = null;
      _operator = null;
      _shouldResetDisplay = true;
    });
  }

  void _onClear() {
    setState(() {
      _display = '0';
      _expression = '';
      _operand1 = null;
      _operator = null;
      _shouldResetDisplay = false;
    });
  }

  void _onToggleSign() {
    setState(() {
      if (_display.startsWith('-')) {
        _display = _display.substring(1);
      } else if (_display != '0') {
        _display = '-$_display';
      }
    });
  }

  void _onPercent() {
    setState(() {
      final value = double.tryParse(_display) ?? 0;
      _display = CalculatorLogic.format(value / 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    final clearLabel = _display != '0' || _operator != null ? 'C' : 'AC';

    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _expression,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerRight,
                      child: Text(
                        _display,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 72,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 0, 6, 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      CalculatorButton(
                        label: clearLabel,
                        background: kFunctionBg,
                        foreground: Colors.white,
                        fontSize: 26,
                        onTap: _onClear,
                      ),
                      CalculatorButton(
                        label: '+/-',
                        background: kFunctionBg,
                        foreground: Colors.white,
                        fontSize: 24,
                        onTap: _onToggleSign,
                      ),
                      CalculatorButton(
                        label: '%',
                        background: kFunctionBg,
                        foreground: Colors.white,
                        onTap: _onPercent,
                      ),
                      CalculatorButton(
                        label: '÷',
                        background: kOperatorBg,
                        foreground: Colors.white,
                        onTap: () => _onOperator('÷'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CalculatorButton(
                        label: '7',
                        background: kNumberBg,
                        foreground: Colors.white,
                        onTap: () => _onDigit('7'),
                      ),
                      CalculatorButton(
                        label: '8',
                        background: kNumberBg,
                        foreground: Colors.white,
                        onTap: () => _onDigit('8'),
                      ),
                      CalculatorButton(
                        label: '9',
                        background: kNumberBg,
                        foreground: Colors.white,
                        onTap: () => _onDigit('9'),
                      ),
                      CalculatorButton(
                        label: '×',
                        background: kOperatorBg,
                        foreground: Colors.white,
                        onTap: () => _onOperator('×'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CalculatorButton(
                        label: '4',
                        background: kNumberBg,
                        foreground: Colors.white,
                        onTap: () => _onDigit('4'),
                      ),
                      CalculatorButton(
                        label: '5',
                        background: kNumberBg,
                        foreground: Colors.white,
                        onTap: () => _onDigit('5'),
                      ),
                      CalculatorButton(
                        label: '6',
                        background: kNumberBg,
                        foreground: Colors.white,
                        onTap: () => _onDigit('6'),
                      ),
                      CalculatorButton(
                        label: '−',
                        background: kOperatorBg,
                        foreground: Colors.white,
                        onTap: () => _onOperator('−'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CalculatorButton(
                        label: '1',
                        background: kNumberBg,
                        foreground: Colors.white,
                        onTap: () => _onDigit('1'),
                      ),
                      CalculatorButton(
                        label: '2',
                        background: kNumberBg,
                        foreground: Colors.white,
                        onTap: () => _onDigit('2'),
                      ),
                      CalculatorButton(
                        label: '3',
                        background: kNumberBg,
                        foreground: Colors.white,
                        onTap: () => _onDigit('3'),
                      ),
                      CalculatorButton(
                        label: '+',
                        background: kOperatorBg,
                        foreground: Colors.white,
                        onTap: () => _onOperator('+'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CalculatorButton(
                        label: '0',
                        background: kNumberBg,
                        foreground: Colors.white,
                        flex: 2,
                        onTap: () => _onDigit('0'),
                      ),
                      CalculatorButton(
                        label: '.',
                        background: kNumberBg,
                        foreground: Colors.white,
                        onTap: _onDecimal,
                      ),
                      CalculatorButton(
                        label: '=',
                        background: kOperatorBg,
                        foreground: Colors.white,
                        onTap: _onEquals,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

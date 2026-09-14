import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final Color background;
  final Color foreground;
  final VoidCallback onTap;
  final int flex;
  final double fontSize;
  final FontWeight fontWeight;

  const CalculatorButton({
    super.key,
    required this.label,
    required this.background,
    required this.foreground,
    required this.onTap,
    this.flex = 1,
    this.fontSize = 28,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: AspectRatio(
          aspectRatio: flex == 1 ? 1 : 2.28,
          child: Material(
            color: background,
            shape: const StadiumBorder(),
            child: InkWell(
              customBorder: const StadiumBorder(),
              onTap: onTap,
              child: Align(
                alignment: flex == 1
                    ? Alignment.center
                    : Alignment.centerLeft,
                child: Padding(
                  padding: flex == 1
                      ? EdgeInsets.zero
                      : const EdgeInsets.only(left: 28),
                  child: Text(
                    label,
                    style: TextStyle(
                      color: foreground,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color backgroundColor;
  final double borderRadius;
  final EdgeInsets padding;
  final Color? borderColor; // color del borde opcional

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor = const Color(0xFFCCCCCC),
    this.borderRadius = 8,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: borderColor != null
                ? BorderSide(color: borderColor!)
                : BorderSide.none,
          ),
        ),
        child: child,
      ),
    );
  }
}

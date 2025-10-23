import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double radius;
  final double width;
  final double vertical;
  final double horizontal;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.radius,
    this.width = double.infinity,
    this.vertical = 12.0,
    this.horizontal = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          padding: EdgeInsets.symmetric(
            vertical: vertical,
            horizontal: horizontal,
          ),
        ),
        child: Text(text, style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }
}

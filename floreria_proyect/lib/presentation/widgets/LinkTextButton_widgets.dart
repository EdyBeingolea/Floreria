import 'package:flutter/material.dart';

class LinkTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  const LinkTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

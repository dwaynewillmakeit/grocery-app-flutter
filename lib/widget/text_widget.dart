import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final bool isTitle;
  final int maxLines;

  const TextWidget(
      {super.key,
      required this.text,
      required this.color,
      required this.fontSize,
      this.isTitle = false,
      this.maxLines = 10});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
          color: color),
    );
  }
}

import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;
  final bool isRequired;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const Label({
    super.key,
    required this.text,
    this.isRequired = false,
    this.margin = const EdgeInsets.symmetric(vertical: 8),
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Row(
        children: [
          Text(text),
          if (isRequired) const Text(' *', style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}

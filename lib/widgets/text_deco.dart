import 'package:flutter/material.dart';

class TextDeco extends StatelessWidget {
 const  TextDeco({
    super.key,
    required this.text,
    this.maxLines=10,
    required this.textsize,
    required this.color,
    this.istitle = false,
  });
  final String text;
  final int maxLines;
  final double textsize;
  final Color color;
  final bool istitle;
  
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: color,
        fontSize: textsize,
        fontWeight: istitle ? FontWeight.bold : FontWeight.normal
      ),
    );
  }
}

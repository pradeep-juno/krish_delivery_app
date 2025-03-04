import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

Widget buildAnimatedPlaceholder(List<String> texts) {
  return SizedBox(
    height: 20,
    child: DefaultTextStyle(
      style: TextStyle(color: Colors.grey, fontSize: 16),
      child: AnimatedTextKit(
        repeatForever: true,
        animatedTexts: texts.map((text) {
          return FadeAnimatedText(text, duration: Duration(seconds: 2));
        }).toList(),
      ),
    ),
  );
}

Widget filterButton(String imagePath, String label) {
  return GestureDetector(
    onTap: () {
      // Add your onPressed functionality here
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 16, height: 16, color: Colors.black54),
          SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ],
      ),
    ),
  );
}

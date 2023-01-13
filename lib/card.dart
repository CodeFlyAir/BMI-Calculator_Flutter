import 'package:flutter/material.dart';
import 'constants.dart';

class CardLayout extends StatelessWidget {
  const CardLayout({super.key, required this.color, this.cardChild});

  final Color color;
  final cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10.0)),
      child: cardChild,
    );
  }
}

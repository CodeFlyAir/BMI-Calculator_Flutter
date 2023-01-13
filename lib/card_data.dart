import 'package:flutter/material.dart';
import 'constants.dart';

class cardData extends StatelessWidget {
  const cardData(
      {super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: kIconSize,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}

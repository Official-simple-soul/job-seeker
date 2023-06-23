import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  const TopTitle({super.key, required this.titleText });

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Center(
                child: Text(
          titleText,
          style: TextStyle(fontSize: 17, letterSpacing: 5, fontWeight: FontWeight.bold),
        )))
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.buttonText,
    required this.onPress,
    this.icon,
  });

  final String buttonText;
  final Function onPress;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress();
      },
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: const Color(0xFF291150),
              borderRadius: BorderRadius.circular(10.0)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonText,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 10),
                Icon(
                  icon,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

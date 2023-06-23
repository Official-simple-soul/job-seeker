import 'package:flutter/material.dart';

class OrLoginWith extends StatelessWidget {
  const OrLoginWith({super.key, required this.optionText, required this.onPress});

  final String optionText;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Text(
            'Or continue with',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  print('Google');
                },
                child: Container(
                  decoration: const BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage('img/Google.png'))),
                  width: 70,
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Facebook');
                },
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('img/Facebook.png'))),
                  width: 70,
                  height: 100,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
             onPress();
            },
            child: Text(
              optionText,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

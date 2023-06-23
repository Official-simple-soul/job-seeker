import 'package:flutter/material.dart';

class WelcomeInfo extends StatelessWidget {
  const WelcomeInfo({required this.main, required this.mini});

  final String main;
  final String mini;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(main, style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4,),
            child: Text(mini),
          ),
        ],
      ),
    );
  }
}

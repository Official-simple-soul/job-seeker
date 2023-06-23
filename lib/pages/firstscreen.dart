import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import 'welcome.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('img/startedimg.png'))),
            )),
            Expanded(
              child: Column(children: [
                Container(
                  width: 250,
                  child: const Text(
                    'Find a Perfect Job Match',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: const Text(
                      'Find your dream job is more easier \n and faster wwith JobSeeker',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomButton(
                    buttonText: 'Let\'s Get Started',
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Welcome()),
                      );
                    },
                    icon: (Icons.arrow_forward),
                  ),
                ),
              ]),
            )
          ],
        ),
      )),
    );
  }
}

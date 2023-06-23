import 'package:flutter/material.dart';
import 'package:job_seeker/components/application_card.dart';
import 'package:job_seeker/pages/application.dart';
import 'package:job_seeker/pages/mainhome.dart';
import 'profile.dart';
import 'notification.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.counter, required this.userRole});

  int counter;
  String userRole;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter(int index) {
    setState(() {
      widget.counter = index;
    });
  }

  final List<Widget> _pages = [
    MainHome(),
    Applications(),
    ProfilePage(),
    DataApi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 239, 241),
      body: _pages[widget.counter],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _incrementCounter,
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.counter,
          selectedItemColor: Color(0xFF291150),
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment), label: 'Application'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_active), label: 'Notification'),
          ]),
    );
  }
}

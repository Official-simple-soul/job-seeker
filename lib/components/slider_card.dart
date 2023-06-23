import 'package:flutter/material.dart';

class SliderCard extends StatefulWidget {
  @override
  _MySliderCard createState() => _MySliderCard();
}

class _MySliderCard extends State<SliderCard> {
  int idx = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  idx = 1;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: idx == 1 ? Color(0xFF291150) : Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 30,
                  ),
                  child: Center(
                    child: Text(
                      'Description',
                      style: TextStyle(
                        color: idx == 1 ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  idx = 2;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: idx == 2 ? Color(0xFF291150) : Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 30,
                  ),
                  child: Center(
                    child: Text(
                      'Company',
                      style: TextStyle(
                        color: idx == 2 ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  idx = 3;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: idx == 3 ? Color(0xFF291150) : Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 30,
                  ),
                  child: Center(
                    child: Text(
                      'Reviews',
                      style: TextStyle(
                        color: idx == 3 ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

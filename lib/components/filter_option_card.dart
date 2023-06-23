import 'package:flutter/material.dart';

class FilterOptionCard extends StatefulWidget {
  @override
  _FilterOptionCard createState() => _FilterOptionCard();
}

class _FilterOptionCard extends State<FilterOptionCard> {
  int idx = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
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
                          horizontal: 20,
                        ),
                        child: Center(
                          child: Text(
                            'Full Time',
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
                  padding: const EdgeInsets.only(right: 15),
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
                          horizontal: 20,
                        ),
                        child: Center(
                          child: Text(
                            'Part Time',
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
                  padding: const EdgeInsets.only(right: 15),
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
                          horizontal: 20,
                        ),
                        child: Center(
                          child: Text(
                            'Contract',
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
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        idx = 4;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: idx == 4 ? Color(0xFF291150) : Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 30,
                        ),
                        child: Center(
                          child: Text(
                            'Freelance',
                            style: TextStyle(
                              color: idx == 4 ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                 padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        idx = 5;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: idx == 5 ? Color(0xFF291150) : Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 30,
                        ),
                        child: Center(
                          child: Text(
                            'Remote',
                            style: TextStyle(
                              color: idx == 5 ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

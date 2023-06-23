import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplicationCard extends StatelessWidget {
  const ApplicationCard(
      {super.key,
      required this.companyLogo,
      required this.companyName,
      required this.jobTitle,
      required this.location,
      required this.status,
      required this.salary});

  final String companyLogo;
  final String companyName;
  final String jobTitle;
  final String location;
  final String status;
  final String salary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(companyLogo))),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(companyName),
                    Text(
                      jobTitle,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Text(location),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Color.fromARGB(255, 236, 239, 241),
                            context: context,
                            isScrollControlled:
                                true, // Set isScrollControlled to true
                            builder: (BuildContext context) {
                              return SingleChildScrollView(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color.fromARGB(
                                                  255, 119, 15, 8)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 30),
                                            child: Text(
                                              'Remove',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      )),
                                ),
                              );
                            },
                          );
                        },
                        child: Icon(Icons.more_vert),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: status == 'Submitted'
                        ? Color(0xFF291150)
                        : status == 'Pending'
                            ? const Color.fromARGB(255, 155, 141, 17)
                            : status == 'Delivered'
                                ? const Color.fromARGB(255, 38, 122, 40)
                                : status == 'Reviewing'
                                    ? const Color.fromARGB(255, 29, 128, 209)
                                    : status == 'Rejected'
                                        ? const Color.fromARGB(255, 187, 45, 35)
                                        : null,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      status,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Text(
                  '$salary yearly',
                  style: TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}

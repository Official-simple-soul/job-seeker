import 'package:flutter/material.dart';
import 'package:job_seeker/pages/applypage.dart';
import 'package:job_seeker/components/custom_button.dart';
import 'package:job_seeker/components/slider_card.dart';

void slider(context, widget, idx) {
  showModalBottomSheet(
    backgroundColor: Color.fromARGB(255, 236, 239, 241),
    context: context,
    isScrollControlled: true, // Set isScrollControlled to true
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height *
              0.8, // Set desired height (80% of the screen height)
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.network(
                    widget.companyLogo,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    widget.jobTitle,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.companyName,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text('-',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w800)),
                    SizedBox(
                      width: 7,
                    ),
                    Icon(
                      Icons.location_pin,
                      size: 20,
                      color: Colors.grey,
                    ),
                    Text(widget.location, style: TextStyle(fontSize: 14))
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.lock_clock),
                          SizedBox(
                            width: 10,
                          ),
                          Text(widget.jobType)
                        ],
                      ),
                      Text(widget.currency + widget.salary)
                    ],
                  ),
                ),
                SliderCard(),
                const SizedBox(
                  height: 20,
                ),
                const Column(
                  children: [
                    Text(
                      'Qualifications:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.circle,
                        size: 14,
                      ),
                      title: Text(
                          'Exceptional communication skills and team working skill'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.circle,
                        size: 14,
                      ),
                      title: Text(
                          'Exceptional communication skills and team working skill'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.circle,
                        size: 14,
                      ),
                      title: Text(
                          'Exceptional communication skills and team working skill'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.circle,
                        size: 14,
                      ),
                      title: Text(
                          'Exceptional communication skills and team working skill'),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                                buttonText: 'Apply Now',
                                onPress: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ApplyPage(
                                                jobTitle: widget.jobTitle,
                                                jobLink: widget.jobLink,
                                              )));
                                }),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF291150),
                                borderRadius: BorderRadius.circular(8)),
                            width: 50,
                            height: 50,
                            child: Center(
                                child: Icon(
                              Icons.message,
                              color: const Color.fromARGB(255, 230, 229, 229),
                              size: 30,
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

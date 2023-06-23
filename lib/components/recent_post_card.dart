import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:job_seeker/pages/applypage.dart';
import 'package:job_seeker/components/custom_button.dart';
import 'package:job_seeker/components/slideup.dart';

// ignore: must_be_immutable
class RecentPostCard extends StatefulWidget {
  RecentPostCard(
      {Key? key,
      required this.companyLogo,
      required this.jobTitle,
      required this.jobType,
      required this.jobLink,
      required this.salary,
      required this.companyName,
      required this.currency,
      required this.dateUploaded,
      required this.expiry,
      required this.location})
      : super(key: key);

  final String companyLogo;
  final String jobTitle;
  final String jobType;
  final String salary;
  final String jobLink;
  final String companyName;
  final String location;
  final String currency;
  final String dateUploaded;
  final String expiry;

  @override
  State<RecentPostCard> createState() => _RecentPostCardState();
}

class _RecentPostCardState extends State<RecentPostCard> {
  int idx = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          slider(context, widget, idx);
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.companyLogo,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.jobTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(widget.jobType),
                        // Text(widget.expiry.split(' at ').first),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // width: 60,
                      child: Text(widget.currency + widget.salary),
                    ),
                    SizedBox(height: 10),
                    Container(
                      // width: ,
                      child: Text(widget.dateUploaded),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

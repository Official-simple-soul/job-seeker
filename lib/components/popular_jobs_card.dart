import 'package:flutter/material.dart';
import 'package:job_seeker/components/slideup.dart';

class PopularJobCard extends StatefulWidget {
  const PopularJobCard(
      {super.key,
      required this.companyLogo,
      required this.companyName,
      required this.jobTitle,
      required this.location,
      required this.jobLink,
      required this.jobType,
      required this.currency,
      required this.salary});

  final String companyName;
  final String companyLogo;
  final String jobTitle;
  final String salary;
  final String currency;
  final String location;
  final String jobType;
  final String jobLink;

  @override
  State<PopularJobCard> createState() => _PopularJobCardState();
}

class _PopularJobCardState extends State<PopularJobCard> {
  @override
  Widget build(BuildContext context) {
    int idx = 1;

    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          slider(
            context,
            widget,
            idx,
          );
        },
        child: Container(
          width: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            widget.companyLogo,
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        widget.companyName,
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  Text(widget.jobType)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(widget.jobTitle),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Text(widget.currency + widget.salary,
                      style: TextStyle(fontWeight: FontWeight.w700)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(widget.location),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

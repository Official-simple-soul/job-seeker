import 'package:flutter/material.dart';
import 'package:job_seeker/components/application_card.dart';
import 'package:job_seeker/components/top_title.dart';
import 'package:job_seeker/data/data.dart';

class Applications extends StatelessWidget {
  const Applications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 239, 241),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopTitle(titleText: 'Applications'),
              SizedBox(
                height: 25,
              ),
              Text(
                'My Applications',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: jobs.length,
                      itemBuilder: (context, index) {
                        final job = jobs[index];

                        return ApplicationCard(
                            companyLogo: job['companyLogo'],
                            companyName: job['companyName'],
                            jobTitle: job['jobTitle'],
                            location: job['location'],
                            status: job['status'],
                            salary: job['salary']);
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

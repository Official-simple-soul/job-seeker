// import 'package:flutter/material.dart';
// import 'package:job_seeker/components/search_card.dart';
// import 'package:job_seeker/data/data.dart';

// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key, required this.searchValue}) : super(key: key);

//   final String searchValue;

//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   late List<Map<String, dynamic>> filteredJobs;

//   @override
//   void initState() {
//     super.initState();
//     filteredJobs = jobs
//         .where((job) => job['jobTitle']
//             .toString()
//             .toLowerCase()
//             .contains(widget.searchValue))
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xFF291150),
//           title: Text(
//             widget.searchValue,
//             style: TextStyle(color: Colors.white, fontSize: 17),
//           ),
//           iconTheme: IconThemeData(color: Colors.white),
//         ),
//         backgroundColor: Color.fromARGB(255, 236, 239, 241),
//         body: Padding(
//           padding: EdgeInsets.only(right: 20, left: 20, top: 40),
//           child: Column(
//             children: [
//               Text('${filteredJobs.length} Result'),
//               SizedBox(
//                 height: 20,
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: filteredJobs.length,
//                   itemBuilder: (context, index) {
//                     final job = filteredJobs[index];

//                     return SearchCard(
//                       companyLogo: job['companyLogo'],
//                       companyName: job['companyName'],
//                       jobTitle: job['jobTitle'],
//                       location: job['location'],
//                       jobType: job['type'],
//                       salary: job['salary'],
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_seeker/components/search_card.dart';

class SearchPage extends StatefulWidget {
  final String searchValue;

  const SearchPage({Key? key, required this.searchValue}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Stream<List<DocumentSnapshot>> searchStream;

  @override
  void initState() {
    super.initState();
    searchStream = fetchAlbumFromFirestore();
  }

  Stream<List<DocumentSnapshot>> fetchAlbumFromFirestore() {
    return FirebaseFirestore.instance
        .collection('jobs')
        // .where('jobTitle', isGreaterThanOrEqualTo: widget.searchValue)
        .snapshots()
        .map(
          (QuerySnapshot snapshot) => snapshot.docs,
        );
  }

  //   @override
  // void initState() {
  //   super.initState();
  //   filteredJobs = jobs
  //       .where((job) => job['jobTitle']
  //           .toString()
  //           .toLowerCase()
  //           .contains(widget.searchValue))
  //       .toList();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF291150),
          title: Text(
            widget.searchValue,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 236, 239, 241),
        body: Padding(
          padding: EdgeInsets.only(right: 20, left: 20, top: 40),
          child: StreamBuilder<List<DocumentSnapshot>>(
            stream: searchStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final filteredJob = snapshot.data!;
                final filteredJobs = filteredJob.where((event) =>
                    event['jobTitle']
                        .toString()
                        .toLowerCase()
                        .contains(widget.searchValue)).toList();
                return Column(
                  children: [
                    Text('${filteredJobs.length} Result'),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredJobs.length,
                        itemBuilder: (context, index) {
                          final jobs = filteredJobs[index];
                          final job =
                              jobs.data() as Map<String, dynamic>? ?? {};

                          String? companyLogo = job['companyLogo'];
                          String? companyName = job['companyName'];
                          String? jobTitle = job['jobTitle'];
                          String? location = job['location'];
                          String? jobType = job['jobType'];
                          String? salary = job['salary'];
                          String? dateUploaded = job['dateUploaded'];
                          String? currency = job['currency'];

                          return SearchCard(
                            companyLogo: companyLogo ??
                                'https://infoguidenigeria.com/wp-content/uploads/2021/08/vacancy-apply-logo.jpg?w=640',
                            companyName: companyName ?? '',
                            jobTitle: jobTitle ?? '',
                            location: location ?? '',
                            jobType: jobType ?? '',
                            salary: salary ?? '',
                            dateUploaded: dateUploaded ?? '',
                            currency: currency ?? '',
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

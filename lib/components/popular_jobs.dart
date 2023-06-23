import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'popular_jobs_card.dart';
import 'package:job_seeker/api/job_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PopularJobs extends StatefulWidget {
  const PopularJobs({super.key});

  @override
  State<PopularJobs> createState() => _PopularJobsState();
}

class _PopularJobsState extends State<PopularJobs> {
  late Stream<List<DocumentSnapshot>> albumStream;

  @override
  void initState() {
    super.initState();
    albumStream = fetchAlbumFromFirestore();
  }

  Stream<List<DocumentSnapshot>> fetchAlbumFromFirestore() {
    return FirebaseFirestore.instance
        .collection('jobs')
        .orderBy('salary', descending: true)
        .snapshots()
        .map(
          (QuerySnapshot snapshot) => snapshot.docs,
        );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DocumentSnapshot>>(
      stream: albumStream,
      builder: (context, snapshot) {
        // ...

        if (snapshot.hasData) {
          final albums = snapshot.data!;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: albums.length,
            itemBuilder: (context, index) {
              final album = albums[index];
              final data = album.data() as Map<String, dynamic>? ?? {};

              String extractText(String text) {
                List<String> parts = text.split('-');
                return parts.length > 1 ? parts.first.trim() : text;
              }

              String? companyLogo = data['imageUrl'];
              String? jobTitle = data['jobTitle'];
              String? jobType = data['jobType'];
              String? salary = data['salary'];
              String? companyName = data['companyName'];
              String? location = data['location'];
              String? jobLink = data['jobLink'];
              String? currency = data['currency'];

              return PopularJobCard(
                companyLogo: companyLogo ??
                    'https://infoguidenigeria.com/wp-content/uploads/2021/08/vacancy-apply-logo.jpg?w=640',
                jobTitle: jobTitle ?? '',
                jobType: jobType ?? '',
                salary: salary ?? '',
                companyName: companyName ?? '',
                location: location ?? '',
                jobLink: jobLink ?? '',
                currency: currency ?? '',
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const Center(
          child: CupertinoActivityIndicator(
            color: Color(0xFF291150),
            radius: 20.0,
          ),
        );
      },
    );
  }
}

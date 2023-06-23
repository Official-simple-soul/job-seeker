import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_seeker/pages/signup.dart';
import 'recent_post_card.dart';

class RecentPost extends StatefulWidget {
  const RecentPost({Key? key});

  @override
  State<RecentPost> createState() => _RecentPostState();
}

class _RecentPostState extends State<RecentPost> {
  late Stream<List<DocumentSnapshot>> albumStream;

  @override
  void initState() {
    super.initState();
    albumStream = fetchAlbumFromFirestore();
  }

  Stream<List<DocumentSnapshot>> fetchAlbumFromFirestore() {
    return FirebaseFirestore.instance.collection('jobs')
        .orderBy('timestamp', descending: true)
        .snapshots().map(
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
            itemCount: albums.length,
            itemBuilder: (context, index) {
              final album = albums[index];
              final data = album.data() as Map<String, dynamic>? ?? {};

            

              String? companyLogo = data['imageUrl'];
              String? jobTitle = data['jobTitle'];
              String? jobType = data['jobType'];
              String? salary = data['salary'];
              String? companyName = data['companyName'];
              String? location = data['location'];
              String? jobLink = data['jobLink'];
              String? dateUploaded = data['dateUploaded'];
              String? currency = data['currency'];
              String? expiry = data['expiry'].toString();

              return RecentPostCard(
                companyLogo: companyLogo ??
                    'https://infoguidenigeria.com/wp-content/uploads/2021/08/vacancy-apply-logo.jpg?w=640',
                jobTitle: jobTitle ?? '',
                jobType: jobType ?? '',
                salary: salary ?? '',
                companyName: companyName ?? '',
                location: location ?? '',
                jobLink: jobLink ?? '',
                currency: currency ?? '',
                dateUploaded: dateUploaded ?? '',
                expiry: expiry ?? '',
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



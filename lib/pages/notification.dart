import 'package:flutter/material.dart';
import 'package:job_seeker/api/job_data.dart';

class DataApi extends StatefulWidget {
  const DataApi({super.key});

  @override
  State<DataApi> createState() => _DataApiState();
}

class _DataApiState extends State<DataApi> {
  late Future<List<Album>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: FutureBuilder<List<Album>>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final album = snapshot.data![index];
                  return ListTile(
                    tileColor: Colors.red,
                    title: Text(album.companyName),
                    subtitle: Text('ID: ${album.jobTitle}'),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      )),
    );
  }
}

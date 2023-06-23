import 'dart:io';

import 'package:flutter/material.dart';
import 'package:job_seeker/components/add_job_slider.dart';
import 'package:job_seeker/components/filter_slider.dart';
import 'package:job_seeker/pages/home.dart';
import 'package:job_seeker/pages/profile.dart';
import 'package:job_seeker/pages/searchpage.dart';
import '../components/recent_post.dart';
import '../components/popular_jobs.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 239, 241),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    filterSlider(context);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('img/Filter.png'))),
                    width: 50,
                    height: 50,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage(
                                  counter: 2,
                                  userRole: '',
                                )));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 50,
                      height: 50,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child:
                                profileImage != null && profileImage!.isNotEmpty
                                    ? Image.network(
                                        profileImage!,
                                        width: 70,
                                        height: 60,
                                        fit: BoxFit.cover,
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        },
                                      )
                                    : Image.network(
                                        'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
                                        fit: BoxFit.cover,
                                      ),
                          ),
                          if (profileImage == null || profileImage!.isEmpty)
                            Positioned.fill(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                        ],
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    // Adjust the width as needed
                    child: TextField(
                  controller: _searchController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter search..',
                  ),
                )),
                const SizedBox(width: 15.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchPage(
                                searchValue: _searchController.text)));
                    // _searchController.clear();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF291150),
                        borderRadius: BorderRadius.circular(8)),
                    width: 50,
                    height: 50,
                    child: Center(
                        child: Icon(
                      Icons.search,
                      color: const Color.fromARGB(255, 230, 229, 229),
                      size: 30,
                    )),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Job',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('Show All'),
              ],
            ),
          ),
          Container(
            height: 160,
            child: PopularJobs(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Post',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('Show All'),
              ],
            ),
          ),
          Expanded(
            child: RecentPost(),
          ),
        ]),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openAddJobModal(context);
        },
        backgroundColor: Color(0xFF291150),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

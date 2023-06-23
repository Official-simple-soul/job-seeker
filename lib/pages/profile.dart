import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:job_seeker/components/top_title.dart';
import 'package:job_seeker/pages/editprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_seeker/pages/welcome.dart';
import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';

String? profileImage;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 
  Stream<QuerySnapshot> getProfileData() {
    final currentUserID = FirebaseAuth.instance.currentUser!.email;
    return FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: currentUserID)
        .snapshots();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
  }

  File? uploadedImg;

  Future<void> uploadFileToFirebaseStorage(
      filePath, Function(String?) onImageUrl) async {
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('profileImages/${DateTime.now()}.jpg');

    try {
      final uploadTask = storageReference.putFile(filePath);
      final snapshot = await uploadTask.whenComplete(() {});
      final imageUrl = await snapshot.ref.getDownloadURL();
      onImageUrl(imageUrl);
      print('File uploaded successfully.');
    } catch (e) {
      print('Error uploading file: $e');
      onImageUrl(null);
    }
  }

  void pickImage() async {
    final users = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid);
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        uploadedImg = file;
      });
    }

    String? imageUrl;

    await uploadFileToFirebaseStorage(uploadedImg, (url) {
      imageUrl = url;

      if (imageUrl != null) {
        try {
          users.update({'profileImg': imageUrl});
          print('user created');
        } catch (e) {
          print('Failed to add user');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 239, 241),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: StreamBuilder<QuerySnapshot>(
            stream: getProfileData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final profiles = snapshot.data?.docs;

                return ListView.builder(
                  itemCount: profiles!.length,
                  itemBuilder: (context, index) {
                    final profile = profiles[index];
                    final profileData = profile.data() as Map<String, dynamic>;

                    final accountName = profileData.containsKey('accountname')
                        ? profileData['accountname']
                        : 'Choose account name';
                    final address = profileData.containsKey('address')
                        ? profileData['address']
                        : 'Choose address';
                    final phone = profileData.containsKey('phonenumber')
                        ? profileData['phonenumber']
                        : 'Choose phone number';
                    profileImage = profileData.containsKey('profileImg')
                        ? profileData['profileImg']
                        : 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png';

                    return Column(
                      children: [
                        TopTitle(titleText: 'Profile'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: pickImage,
                                child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 198, 197, 197),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            profileImage!,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
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
                                            errorBuilder: (BuildContext context,
                                                Object exception,
                                                StackTrace? stackTrace) {
                                              return Image.network(
                                                'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
                                                fit: BoxFit.cover,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  accountName,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ProfileDetails(
                              labelText: profileData['username'],
                              label: 'User Name',
                            ),
                            ProfileDetails(
                              labelText: accountName,
                              label: 'Account Name',
                            ),
                            ProfileDetails(
                              labelText: address,
                              label: 'Address',
                            ),
                            ProfileDetails(
                              labelText: phone,
                              label: 'Phone Number',
                            ),
                            ProfileDetails(
                              labelText: profileData['email'],
                              label: 'Email Address',
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 50),
                          child: GestureDetector(
                            onTap: signOut,
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 166, 27, 27),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Center(
                                  child: Text(
                                    'Log Out',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
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

class ProfileDetails extends StatelessWidget {
  ProfileDetails({super.key, required this.labelText, required this.label});

  final String label;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditProfile(
                        label: label,
                        labelText: labelText,
                      )));
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 217, 216, 216),
                    offset: Offset(1.0, 1.0),
                    blurRadius: 1.0,
                    spreadRadius: 1.0),
              ],
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          labelText,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          label,
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_outlined)
                ],
              ),
            )),
      ),
    );
  }
}

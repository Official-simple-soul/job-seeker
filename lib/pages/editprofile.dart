import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_seeker/components/custom_button.dart';
import 'package:job_seeker/components/inputs.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.label, required this.labelText});

  final String label;
  final String labelText;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _controller = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;



  @override
  void dispose() {
    _controller.text;
    super.dispose();
  }

  void saveChanges() async {
    final val = _controller.text;
    final users = firestore.collection('users').doc(auth.currentUser?.uid);

    final labelKey = widget.label.replaceAll(' ', '').toLowerCase();

    try {
      await users
          .update({labelKey: val})
          .then((value) => print('user created'))
          .catchError((onError) => print('Failed to add user'));
      Navigator.pop(context);
      print(val);
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 236, 239, 241),
        appBar: AppBar(
          backgroundColor: Color(0xFF291150),
          title: Text(
            'Edit ' + widget.label,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  'Change ' + widget.label,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  'Type in the input below and click on save to\nchange your' +
                      widget.label,
                  style: TextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 8),
                child: Text(
                  widget.label,
                ),
              ),
              InputsBox(
                placeholder: widget.labelText,
                getValue: _controller,
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      child: CustomButton(
                          buttonText: 'Save',
                          onPress: () {
                            saveChanges();
                          })),
                ],
              ))
            ],
          ),
        )));
  }
}

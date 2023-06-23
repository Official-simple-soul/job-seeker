import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_seeker/pages/mainhome.dart';
import '../components/custom_button.dart';
import '../components/inputs.dart';
import '../components/or_login_with.dart';
import '../components/welcome_info.dart';
import 'home.dart';
import 'welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<String> roles = ['Select Role', 'Employer', 'Job Seeker'];

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerUserName = TextEditingController();
  TextEditingController _controllerRole = TextEditingController();

  @override
  void dispose() {
    _controllerUserName.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerRole.dispose();
    super.dispose();
  }

  // bool flag = false;

  void getValues() async {
    final String email = _controllerEmail.text;
    final String userName = _controllerUserName.text;
    final String password = _controllerPassword.text;
    // final String role = _controllerRole.text;

    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final users = firestore.collection('users').doc(auth.currentUser?.uid);

      Map<String, dynamic> addUser = {
        'username': userName,
        'email': email,
        'role': selectedRole,
      };

      await users
          .set(addUser)
          .then((value) => print('user created'))
          .catchError((onError) => print('Failed to add user'));
      // ignore: use_build_context_synchronously
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MyHomePage(counter: 0, userRole: selectedRole!,)));

      // Navigator.pop(context);

      _controllerEmail.clear();
      _controllerUserName.clear();
      _controllerPassword.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Navigator.pop(context);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('The account already exists for that email.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 239, 241),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Welcome()));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WelcomeInfo(
                    main: 'Create Account',
                    mini: 'Fill your details or continue\nwith social media'),
                InputsBox(
                  icon: Icons.account_box_outlined,
                  placeholder: 'User Name',
                  getValue: _controllerUserName,
                ),
                InputsBox(
                  icon: Icons.email_outlined,
                  placeholder: 'Email Address',
                  getValue: _controllerEmail,
                ),
                InputsBox(
                  icon: Icons.lock_outline,
                  icon2: Icons.remove_red_eye_outlined,
                  icon3: Icons.visibility_off_outlined,
                  placeholder: 'Password',
                  getValue: _controllerPassword,
                ),
                DropDownRole(
                    listValue: roles,
                    dropText: '',
                    dpcl: Colors.white,
                    pd: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: CustomButton(
                      buttonText: 'Sign Up',
                      onPress: () {
                        getValues();
                      }),
                ),
                OrLoginWith(
                    optionText: 'Already have an account? Sign In',
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Welcome()));
                    })
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

String? selectedRole;

class DropDownRole extends StatefulWidget {
  final List<String> listValue;

  const DropDownRole(
      {super.key,
      required this.listValue,
      required this.dropText,
      required this.dpcl,
      required this.pd});

  final String dropText;
  final double pd;
  final Color dpcl;

  @override
  State<DropDownRole> createState() => _DropDownStateRole();
}

class _DropDownStateRole extends State<DropDownRole> {
  @override
  void initState() {
    super.initState();
    selectedRole = widget.listValue.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.dropText,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: widget.dpcl,
          ),
          child: DropdownButton<String>(
            value: selectedRole,
            isExpanded: true,
            menuMaxHeight: 700.0,
            dropdownColor: Colors.white,
            focusColor: Colors.grey,
            padding: EdgeInsets.symmetric(horizontal: widget.pd),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                selectedRole = value!;
              });
            },
            items:
                widget.listValue.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

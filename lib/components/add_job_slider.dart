import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:job_seeker/components/date_time.dart';
import 'package:job_seeker/components/drop_down.dart';
import 'package:job_seeker/components/logo_upload.dart';
import 'package:job_seeker/pages/signup.dart';
import 'package:intl/intl.dart';

const List<String> list = <String>[
  'Full Time',
  'Part Time',
  'Contract',
  'Remote'
];
const List<String> currencyList = <String>[
  '\$',
  '₦',
  '£',
  '€',
];

TextEditingController _getAllValues(int index) {
  if (_controllers.length <= index) {
    _controllers.add(TextEditingController());
  }
  return _controllers[index];
}

List<TextEditingController> _controllers = [];

@override
void dispose() {
  for (var controller in _controllers) {
    controller.dispose();
  }
}

@override
Future<void> uploadFileToFirebaseStorage(
    filePath, Function(String?) onImageUrl) async {
  Reference storageReference =
      FirebaseStorage.instance.ref().child('images/${DateTime.now()}.jpg');

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

Future<void> _getValue() async {
  String? userId = auth.currentUser?.uid;
  String dateUploaded = DateFormat('yyyy-MM-dd').format(DateTime.now());
  Timestamp timestamp = Timestamp.fromDate(DateTime.now());
  List<String> values =
      _controllers.map((controller) => controller.text).toList();

  String? imageUrl;

  await uploadFileToFirebaseStorage(uploadedImage, (url) {
    imageUrl = url;

    if (userId != null && imageUrl != null) {
      firestore.collection('jobs').add({
        'userId': userId,
        'dateUploaded': dateUploaded,
        'timestamp': timestamp,
        'companyName': values[0],
        'jobTitle': values[1],
        'jobType': selectedCountry,
        'jobLink': values[2],
        'currency': selectedCurrency,
        'salary': values[3],
        'location': values[4],
        'expiry': selectedDate,
        'imageUrl': imageUrl, // Add the image URL to Firestore
        // Add other fields as needed
      }).then((_) {
        print('Data stored in Firestore successfully.');
        _controllers.clear();
        // Navigator.pop(context);
      }).catchError((error) {
        print('Error storing data in Firestore: $error');
        // Navigator.pop(context);
      });
    }
  });
}

void openAddJobModal(BuildContext context) {
  bool isPosting = false; // Flag to track if the job is currently being posted

  showModalBottomSheet(
    context: context,
    backgroundColor: Color.fromARGB(255, 236, 239, 241),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    'Add Job',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Center(
                    child: Column(
                      children: [LogoUpload()],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Company Name'),
                    controller: _getAllValues(0),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Job Title'),
                    controller: _getAllValues(1),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  DropDown(
                    listValue: list,
                    dropText: 'Job Type',
                    dpcl: Colors.transparent,
                    pd: 0,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Job Link'),
                    controller: _getAllValues(2),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  DropDownCur(
                    listValue: currencyList,
                    dropText: 'currency',
                    dpcl: Colors.transparent,
                    pd: 0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Salary'),
                    controller: _getAllValues(3),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  DateAndTime(),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Location'),
                    controller: _getAllValues(4),
                  ),
                  SizedBox(height: 5.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (isPosting)
                        return; // Prevent multiple clicks while posting

                      setState(() {
                        isPosting =
                            true; // Set the flag to true to show the loader
                      });

                      // Implement the logic to add/post the job
                      await _getValue();
                      Navigator.pop(context); // Close the bottom sheet
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Job Posted'),
                            content:
                                Text('The job has been posted successfully.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: isPosting
                        ? SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(
                              strokeWidth: 3.0,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ) // Show the loader while posting
                        : Text('Add/Post Job'),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

String? selectedCurrency;

class DropDownCur extends StatefulWidget {
  final List<String> listValue;

  const DropDownCur(
      {super.key,
      required this.listValue,
      required this.dropText,
      required this.dpcl,
      required this.pd});

  final String dropText;
  final double pd;
  final Color dpcl;

  @override
  State<DropDownCur> createState() => _DropDownStateCur();
}

class _DropDownStateCur extends State<DropDownCur> {
  @override
  void initState() {
    super.initState();
    selectedCurrency = widget.listValue.first;
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
            value: selectedCurrency,
            isExpanded: true,
            menuMaxHeight: 700.0,
            dropdownColor: Colors.white,
            focusColor: Colors.grey,
            padding: EdgeInsets.symmetric(horizontal: widget.pd),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                selectedCurrency = value!;
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

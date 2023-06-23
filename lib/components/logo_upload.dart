import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';


File? uploadedImage;

class LogoUpload extends StatefulWidget {
  const LogoUpload({super.key});

  @override
  State<LogoUpload> createState() => _LogoUploadState();
}

class _LogoUploadState extends State<LogoUpload> {
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: uploadedImage != null
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(100)),
                child: IconButton(
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(type: FileType.image);

                    if (result != null) {
                      File file = File(result.files.single.path!);
                      setState(() {
                        uploadedImage = file;
                      });
                    }
                  },
                  icon: Icon(Icons.upload),
                )),
            Text(uploadedImage != null ? 'Change Logo' : 'Upload Logo')
          ],
        ),
        Container(
            child: uploadedImage != null
                ? Image.file(
                    uploadedImage!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  )
                : null)
      ],
    );
    Text('Upload Logo');
  }
}

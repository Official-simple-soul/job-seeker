import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

DateTime? selectedDate;

class DateAndTime extends StatefulWidget {
  const DateAndTime({super.key});

  @override
  State<DateAndTime> createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      initialValue: '',
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      dateLabelText: 'Expiry',
      onChanged: (val) => setState(() => selectedDate = DateTime.parse(val)),
      validator: (val) {
        if (val!.isEmpty) {
          return 'Please select a date';
        }
        return null;
      },
      onSaved: (val) => setState(() => selectedDate = DateTime.parse(val!)),
    );
  }
}

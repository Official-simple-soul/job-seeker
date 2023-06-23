import 'package:flutter/material.dart';


String? selectedCountry;

class DropDown extends StatefulWidget {

  final List<String> listValue;

  const DropDown({super.key, required this.listValue, required this.dropText, required this.dpcl, required this.pd});

final String dropText;
final double pd;
final Color dpcl;


  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  

  @override
  void initState() {
    super.initState();
    selectedCountry = widget.listValue.first;
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
                    value: selectedCountry,
                    isExpanded: true,
                    menuMaxHeight: 700.0,
                    dropdownColor: Colors.white,
                    focusColor: Colors.grey,
                    padding: EdgeInsets.symmetric(horizontal: widget.pd),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        selectedCountry = value!;
                      });
                    },
                    items: widget.listValue
                        .map<DropdownMenuItem<String>>((String value) {
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
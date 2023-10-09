library timezone_dropdown;

import 'package:flutter/cupertino.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

typedef void TimezoneSelectedFunction(String timeZone);

class TimezoneDropdown extends StatefulWidget {

  final TimezoneSelectedFunction onTimezoneSelected;

  TimezoneDropdown({super.key, required this.onTimezoneSelected});

  @override
  TimezoneDropdownState createState() => TimezoneDropdownState();
}

class TimezoneDropdownState extends State<TimezoneDropdown> {

  final List<String> items = [];

  @override
  void initState() {
    super.initState();

    items.add("Asia/Calcutta");
    items.add("Americas/LosAngelis");
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      dropdownDecoratorProps: const DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(hintText: "Search timezones")
      ),
      popupProps: const PopupProps.menu(
          showSearchBox: true
      ),
      onChanged: (String? data) {
        widget.onTimezoneSelected(data!);
      },
      items: items,
    );
  }
}

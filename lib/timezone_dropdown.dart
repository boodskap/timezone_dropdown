library timezone_dropdown;

import 'package:flutter/cupertino.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

typedef void TimezoneSelectedFunction(String timeZone);

class TimezoneDropdown extends StatefulWidget {
  final String hintText;
  final TimezoneSelectedFunction onTimezoneSelected;

  TimezoneDropdown(
      {super.key, required this.hintText, required this.onTimezoneSelected});

  @override
  TimezoneDropdownState createState() => TimezoneDropdownState();
}

class TimezoneDropdownState extends State<TimezoneDropdown> {
  final List<String> timezones = [];
  String? myTz = "";

  @override
  void initState() {
    super.initState();

    tz.initializeTimeZones();

    tz.timeZoneDatabase.locations.keys.forEach((element) {
      timezones.add(element);
    });

    loadTimeZones();
  }

  void loadTimeZones() async {
    myTz = await FlutterNativeTimezone.getLocalTimezone();

    widget.onTimezoneSelected(myTz!);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(hintText: widget.hintText),
      ),
      popupProps: const PopupProps.menu(
        showSearchBox: true,
        showSelectedItems: true,
      ),
      onChanged: (String? data) {
        widget.onTimezoneSelected(data!);
        setState(() {
          myTz = data;
        });
      },
      selectedItem: myTz!,
      items: timezones,
    );
  }
}

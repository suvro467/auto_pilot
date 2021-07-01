import 'package:flutter/material.dart';

class AutoPilotCalendar extends StatefulWidget {
  const AutoPilotCalendar({Key? key}) : super(key: key);

  @override
  _AutoPilotCalendarState createState() => _AutoPilotCalendarState();
}

class _AutoPilotCalendarState extends State<AutoPilotCalendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Dashboard of Calendar')),
    );
  }
}

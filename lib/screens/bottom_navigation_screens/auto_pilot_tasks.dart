import 'package:flutter/material.dart';

class AutoPilotTasks extends StatefulWidget {
  const AutoPilotTasks({Key? key}) : super(key: key);

  @override
  _AutoPilotTasksState createState() => _AutoPilotTasksState();
}

class _AutoPilotTasksState extends State<AutoPilotTasks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Dashboard of Tasks')),
    );
  }
}

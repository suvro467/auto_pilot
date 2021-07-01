import 'package:flutter/material.dart';

class AutoPilotScore extends StatefulWidget {
  const AutoPilotScore({Key? key}) : super(key: key);

  @override
  _AutoPilotScoreState createState() => _AutoPilotScoreState();
}

class _AutoPilotScoreState extends State<AutoPilotScore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Dashboard of Score')),
    );
  }
}

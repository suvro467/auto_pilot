import 'dart:io';

import 'package:auto_pilot/shared/drawer/auto_pilot_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _pageController;

  var myAutoPilotDrawer;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: 4,
    );

// Initialize the drawer

    myAutoPilotDrawer = MyAutoPilotDrawer(
      homeScaffoldKey: _scaffoldKey,
      pageController: _pageController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // Quit the app.
        if (Platform.isAndroid)
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return new Future(() => false);
      },
      child: Scaffold(
        drawer: myAutoPilotDrawer,
        body: Container(
          child: Center(
            child: Text(
              'Dashboard',
            ),
          ),
        ),
      ),
    );
  }
}

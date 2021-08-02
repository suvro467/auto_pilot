import 'dart:async';

import 'package:auto_pilot/shared/globals.dart';
import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:auto_pilot/shared/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class AddUser1 extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController pageController;

  /* final int tabMenuSelected;
  final int taskItemTapped; */
  const AddUser1(
      {required this.scaffoldKey,
      required this.pageController,

      /* required this.tabMenuSelected,
      required this.taskItemTapped, */
      Key? key})
      : super(key: key);

  @override
  _AddUser1State createState() => _AddUser1State();
}

class _AddUser1State extends State<AddUser1>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isDelegatesExpanded = false;
  bool isRepeatExpanded = false;
  bool isSupportExpanded = false;
  bool isPersonalExpanded = false;

  Map<String, double> tasksCompleted = {'Flutter': 90, 'Kotlin': 10};
  Map<String, double> tasksOnTime = {'Flutter': 60, 'Kotlin': 40};
  Map<String, double> approvedBenchaMark = {'Flutter': 80, 'Kotlin': 20};

  bool markHod = false;

  //String baseUrl = Globals.baseUrl;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.sync(onWillPop),
      child: Scaffold(
        body: Container(
          //height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add Users',
                          style: GoogleFonts.notoSerif(
                            color: HexColor('#707070'),
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                        Text('15 users of 50 users remaining',
                            style: GoogleFonts.notoSerif(
                              color: MyAutoPilotStyles.appColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text(
                        'Mark HOD',
                        style: GoogleFonts.notoSerif(
                          color: HexColor('#707070'),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    // FlutterSwitch(
                    //   //toggleColor: HexColor('#C9C9C9'),
                    //   width: 60,
                    //   height: 30,
                    //   //toggleSize: 30,
                    //   activeColor: MyAutoPilotStyles.appColor,
                    //   value: markHod,
                    //   /* borderRadius: 30.0,
                    //   padding: 8.0, */
                    //   borderRadius: 30,
                    //   onToggle: (val) {
                    //     setState(() {
                    //       markHod = val;
                    //     });
                    //   },
                    // ),
                    Switch(
                      value: markHod,
                      onChanged: (value) {
                        setState(() {
                          markHod = value;
                          print(markHod);
                        });
                      },
                      activeTrackColor: MyAutoPilotStyles.appColor,
                      activeColor: HexColor('#669db6'),
                      inactiveThumbColor: HexColor('#C9C9C9'),
                      inactiveTrackColor: HexColor('#707070'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FutureOr<bool> onWillPop() {
    widget.pageController.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
    return false;
  }
}

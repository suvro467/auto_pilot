import 'dart:io';

import 'package:auto_pilot/shared/globals.dart';
import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class MyAutoPilotDrawer extends StatefulWidget {
  GlobalKey<ScaffoldState> homeScaffoldKey;
  /* String productImageurl;
  String productWebsite;
  String productName;
  int productId; */

  // Declaring the page controller here, this would be passed here from the home screen.
  PageController pageController;

  MyAutoPilotDrawer({
    required this.homeScaffoldKey,
    required this.pageController,
  });

  @override
  _MyAutoPilotDrawerState createState() => _MyAutoPilotDrawerState();
}

class _MyAutoPilotDrawerState extends State<MyAutoPilotDrawer> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 70 / 100,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // This is the custom drawer header.
            Container(
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            splashRadius: 22,
                            padding: const EdgeInsets.all(0),
                            icon: Icon(
                              Icons.arrow_left,
                              color: MyAutoPilotStyles.appColor,
                              size: 36,
                            ),
                            onPressed: () {
                              if (widget.homeScaffoldKey.currentState!
                                  .isDrawerOpen) Navigator.pop(context);
                            },
                          ),
                          IconButton(
                            splashRadius: 22,
                            padding: const EdgeInsets.all(0),
                            icon: SvgPicture.asset(
                              'assets/images/exit.svg',
                              color: MyAutoPilotStyles.appColor,
                              height: 22,
                              width: 22,
                            ),
                            onPressed: () {
                              showDialog<void>(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Exit MyAutoPilot',
                                      style: TextStyle(
                                        fontFamily: 'Proxima',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          Text(
                                            'Are you sure?',
                                            style: TextStyle(
                                              fontFamily: 'Proxima',
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text(
                                          ' Yes ',
                                          style: TextStyle(
                                            fontFamily: 'Proxima',
                                            fontSize: 16,
                                            color: Colors.red,
                                          ),
                                        ),
                                        onPressed: () async {
                                          // Show the progress dialogue.

                                          if (Platform.isAndroid)
                                            SystemChannels.platform
                                                .invokeMethod(
                                                    'SystemNavigator.pop');
                                        },
                                      ),
                                      TextButton(
                                        child: Text(
                                          ' No ',
                                          style: TextStyle(
                                            fontFamily: 'Proxima',
                                            fontSize: 16,
                                            color: MyAutoPilotStyles.appColor,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Globals.userFirstName +
                                        ' ' +
                                        Globals.userLastName,
                                    style: GoogleFonts.notoSans(
                                      fontSize: 14,
                                      color: HexColor('#707070'),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    Globals.designation,
                                    style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: HexColor('#707070'),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
            Stack(children: [
              Container(
                height: 45,
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/images/dashboard.svg',
                    color: MyAutoPilotStyles.appColor,
                    height: 22,
                    width: 22,
                  ),
                  title: Text(
                    'Dashboard',
                    style: MyAutoPilotStyles.listTileHeaderTitle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.pageController.jumpToPage(0);
                    });
                  },
                ),
              ),
            ]),
            MyAutoPilotStyles.menuItemDivider,
            Stack(children: [
              Container(
                height: 45,
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/images/task 2.svg',
                    color: MyAutoPilotStyles.appColor,
                    height: 26,
                    width: 26,
                  ),
                  title: Text(
                    'Task List',
                    style: MyAutoPilotStyles.listTileHeaderTitle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.pageController.jumpToPage(0);
                    });
                  },
                ),
              ),
            ]),
            MyAutoPilotStyles.menuItemDivider,
            Stack(children: [
              Container(
                height: 45,
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/images/audit-task.svg',
                    color: MyAutoPilotStyles.appColor,
                    height: 26,
                    width: 26,
                  ),
                  title: Text(
                    'Audit Tasks',
                    style: MyAutoPilotStyles.listTileHeaderTitle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.pageController.jumpToPage(0);
                    });
                  },
                ),
              ),
              // Notification colour is to be shown only if there is unread elements.
              Positioned(
                right: 10,
                top: 5,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: MyAutoPilotStyles.notificationColor,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ]),
            MyAutoPilotStyles.menuItemDivider,
            Stack(children: [
              Container(
                height: 45,
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/images/observer task.svg',
                    color: MyAutoPilotStyles.appColor,
                    height: 26,
                    width: 26,
                  ),
                  title: Text(
                    'Observe Tasks',
                    style: MyAutoPilotStyles.listTileHeaderTitle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.pageController.jumpToPage(0);
                    });
                  },
                ),
              ),
            ]),
            MyAutoPilotStyles.menuItemDivider,
            Stack(children: [
              Container(
                height: 45,
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/images/user outline.svg',
                    color: MyAutoPilotStyles.appColor,
                    height: 26,
                    width: 26,
                  ),
                  title: Text(
                    'Users',
                    style: MyAutoPilotStyles.listTileHeaderTitle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.pageController.jumpToPage(0);
                    });
                  },
                ),
              ),
            ]),
            MyAutoPilotStyles.menuItemDivider,
            Stack(children: [
              Container(
                height: 45,
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/images/team list.svg',
                    color: MyAutoPilotStyles.appColor,
                    height: 22,
                    width: 22,
                  ),
                  title: Text(
                    'Team List',
                    style: MyAutoPilotStyles.listTileHeaderTitle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.pageController.jumpToPage(0);
                    });
                  },
                ),
              ),
            ]),
            MyAutoPilotStyles.menuItemDivider,
            Stack(children: [
              Container(
                height: 45,
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/images/score2.svg',
                    color: MyAutoPilotStyles.appColor,
                    height: 22,
                    width: 22,
                  ),
                  title: Text(
                    'Score Board',
                    style: MyAutoPilotStyles.listTileHeaderTitle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.pageController.jumpToPage(2);
                    });
                  },
                ),
              ),
            ]),
            MyAutoPilotStyles.menuItemDivider,
            Stack(children: [
              Container(
                height: 45,
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/images/calendar.svg',
                    color: MyAutoPilotStyles.appColor,
                    height: 22,
                    width: 22,
                  ),
                  title: Text(
                    'Calendar',
                    style: MyAutoPilotStyles.listTileHeaderTitle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.pageController.jumpToPage(0);
                    });
                  },
                ),
              ),
            ]),
            MyAutoPilotStyles.menuItemDivider,
            Stack(children: [
              Container(
                height: 45,
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/images/support.svg',
                    color: MyAutoPilotStyles.appColor,
                    height: 26,
                    width: 26,
                  ),
                  title: Text(
                    'Support',
                    style: MyAutoPilotStyles.listTileHeaderTitle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.pageController.jumpToPage(0);
                    });
                  },
                ),
              ),
            ]),
            MyAutoPilotStyles.menuItemDivider,
            Stack(children: [
              Container(
                height: 45,
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/images/kra update.svg',
                    color: MyAutoPilotStyles.appColor,
                    height: 26,
                    width: 26,
                  ),
                  title: Text(
                    'KRA Update',
                    style: MyAutoPilotStyles.listTileHeaderTitle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.pageController.jumpToPage(0);
                    });
                  },
                ),
              ),
            ]),
            MyAutoPilotStyles.menuItemDivider,
          ],
        ),
      ),
    );
  }
}

/* Future<int> deleteLoginChecker() {
  DatabaseHelper helper = DatabaseHelper.instance;
  var deletedData = helper.deleteFromDineOrderCCLoginCheckerTable();
  return deletedData;
} */

buildExitButton(BuildContext context) {
  return Container(
    color: Colors.indigo[50],
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            height: 50.0,
            minWidth: 50.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Icon(
              Icons.clear,
              color: Colors.grey[800],
            ),
          ),
        )
      ],
    ),
  );
}

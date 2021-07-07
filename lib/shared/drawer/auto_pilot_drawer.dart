import 'dart:io';

import 'package:auto_pilot/shared/globals.dart';
import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                              color: Globals.appColor,
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
                              color: Globals.appColor,
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
                                            color: Globals.appColor,
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
                      )
                    ]),
              ),
            ),
            MyAutoPilotStyles.menuItemDivider,
            ListTile(
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

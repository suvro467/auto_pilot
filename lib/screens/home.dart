import 'dart:io';

import 'package:auto_pilot/screens/bottom_navigation_screens/auto_pilot_calendar.dart';
import 'package:auto_pilot/screens/bottom_navigation_screens/auto_pilot_score.dart';
import 'package:auto_pilot/screens/bottom_navigation_screens/auto_pilot_tasks.dart';
import 'package:auto_pilot/screens/menu_screens/task_list/task_list.dart';
import 'package:auto_pilot/shared/drawer/auto_pilot_drawer.dart';
import 'package:auto_pilot/shared/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _pageController;
  late int _currentIndex;
  bool isDrawerClicked = true;

  // PageView object
  late PageView pageView;

  var myAutoPilotAppBar;
  var myAutoPilotDrawer;
  var myAutoPilotBottomNavigationBar;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: 0,
    );

    isDrawerClicked = true;
    _currentIndex = 0;

    // Initialize the appbar
    myAutoPilotAppBar = AppBar(
      elevation: 0,
      automaticallyImplyLeading: true,
      toolbarHeight: 90,
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.only(
          top: 0.0,
          //bottom: 20.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              iconSize: 45,
              onPressed: null,
              icon: Image(
                image: AssetImage(
                  'assets/icons/logopng.png',
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/user outline.svg',
                color: Globals.appColor,
                //semanticsLabel: 'Email Mobile',
                height: 40,
                width: 40,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/bell.svg',
                color: Globals.appColor,
                //semanticsLabel: 'Email Mobile',
                height: 40,
                width: 40,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/search thin.svg',
                color: Globals.appColor,
                //semanticsLabel: 'Email Mobile',
                height: 40,
                width: 40,
              ),
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Globals.appColor,
                size: 42,
              ),
            ),
          ],
        ),
      ),
    );

    // Initialize the drawer
    myAutoPilotDrawer = MyAutoPilotDrawer(
      homeScaffoldKey: _scaffoldKey,
      pageController: _pageController,
    );

    // Initialize the bottom navigation bar

    myAutoPilotBottomNavigationBar = BottomNavigationBar(
      onTap: (value) {
        isDrawerClicked = false;
        setState(() => _currentIndex = value);

        if (_pageController.hasClients) {
          /* if (value == 2) {
                if (!_scaffoldKey.currentState!.isDrawerOpen) {
                  _scaffoldKey.currentState!.openDrawer();
                }
              } else {
                /* _pageController.animateToPage(index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn); */
                _pageController.jumpToPage(value);
              } */
          if (value == 0) _pageController.jumpToPage(0);
          if (value == 1) _pageController.jumpToPage(2);
          if (value == 2) _pageController.jumpToPage(3);
        }
      },
      elevation: 0,
      currentIndex: _currentIndex, // this will be set when a new tab is tapped

      selectedLabelStyle: GoogleFonts.alegreyaSc(
        fontSize: 14,
        color: HexColor('#416271'),
        fontWeight: FontWeight.normal,
      ),
      unselectedLabelStyle: GoogleFonts.alegreyaSc(
        fontSize: 14,
        color: Colors.grey,
        fontWeight: FontWeight.normal,
      ),
      selectedItemColor: HexColor('#416271'),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/task 2.svg',
            color: Globals.appColor,
            height: 30,
            width: 30,
          ),
          label: 'TASK',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/score2.svg',
            color: Globals.appColor,
            height: 30,
            width: 30,
          ),
          label: 'SCORE',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/calendar.svg',
            color: Globals.appColor,
            height: 30,
            width: 30,
          ),
          label: 'CALENDAR',
        )
      ],
    );

    // Initialize the pageview
    pageView = PageView(
      physics: NeverScrollableScrollPhysics(),
      allowImplicitScrolling: true,
      controller: _pageController,
      onPageChanged: (index) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild?.unfocus();
        }
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

        setState(() {
          _currentIndex = index;
        });
      },
      children: [
        // Page 0
        Container(
          color: Colors.transparent,
          child: FutureBuilder(
            builder: (context, snapshot) {
              return Container(
                // Task
                child: AutoPilotTasks(
                  scaffoldKey: _scaffoldKey,
                  pageController: _pageController,
                  myAutoPilotAppBar: myAutoPilotAppBar,
                  myAutoPilotBottomNavigationAppBar:
                      myAutoPilotBottomNavigationBar,
                ),
              );
            },
          ),
        ),
        // Page 1
        Container(
          color: Colors.transparent,
          child: Center(
            child: FutureBuilder(
              builder: (context, snapshot) {
                return Container(
                  // TaskList
                  child: TaskList(
                    scaffoldKey: _scaffoldKey,
                    pageController: _pageController,
                  ),
                );
              },
            ),
          ),
        ),
        // Page 2
        Container(
          color: Colors.transparent,
          child: Center(
            child: FutureBuilder(
              builder: (context, snapshot) {
                return Container(
                  // Score
                  child: AutoPilotScore(),
                );
              },
            ),
          ),
        ),
        // Page 3
        Container(
          color: Colors.transparent,
          child: Center(
            child: FutureBuilder(
              builder: (context, snapshot) {
                return Container(
                  // Calendar
                  child: AutoPilotCalendar(),
                );
              },
            ),
          ),
        ),
      ],
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
        key: _scaffoldKey,
        //drawer: myAutoPilotDrawer,
        endDrawerEnableOpenDragGesture: false,
        appBar: myAutoPilotAppBar,
        body: SafeArea(
          child: SizedBox.expand(
            child: pageView,
          ),
        ),
        bottomNavigationBar: myAutoPilotBottomNavigationBar,
      ),
    );
  }
}

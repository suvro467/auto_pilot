import 'dart:io';

import 'package:auto_pilot/shared/drawer/auto_pilot_drawer.dart';
import 'package:auto_pilot/shared/globals.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
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
  int _currentIndex = 0;
  bool isDrawerClicked = true;

  // PageView object
  late PageView pageView;

  var myAutoPilotDrawer;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: 4,
    );

    isDrawerClicked = true;

    // Initialize the drawer

    myAutoPilotDrawer = MyAutoPilotDrawer(
      homeScaffoldKey: _scaffoldKey,
      pageController: _pageController,
    );

    BottomNavyBar bottomNavyBar;

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
        appBar: AppBar(
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
        ),
        body: SizedBox.expand(
          child: pageView,
        ),
        /* bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(
            10,
          ),
          child: BottomNavyBar(
            containerHeight: 70,
            backgroundColor: Colors.transparent,
            showElevation: false,
            selectedIndex: _currentIndex,
            curve: Curves.easeIn,
            onItemSelected: (index) {
              isDrawerClicked = false;
              setState(() => _currentIndex = index);

              if (_pageController.hasClients) {
                if (index == 2) {
                  if (!_scaffoldKey.currentState!.isDrawerOpen) {
                    _scaffoldKey.currentState!.openDrawer();
                  }
                } else {
                  /* _pageController.animateToPage(index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn); */
                  _pageController.jumpToPage(index);
                }
              }
            },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                activeColor: Color.fromRGBO(252, 128, 25, 1),
                title: Text(
                  'TASK',
                  style: TextStyle(
                    fontFamily: 'Proxima',
                    fontSize: 10,
                    color: Color.fromRGBO(252, 128, 25, 1),
                  ),
                ),
                icon: SvgPicture.asset(
                  'assets/images/task 2.svg',
                  color: Globals.appColor,
                  height: 30,
                  width: 30,
                ),
                inactiveColor: Colors.grey,
              ),
              BottomNavyBarItem(
                activeColor: Color.fromRGBO(252, 128, 25, 1),
                title: Text(
                  'SCORE',
                  style: TextStyle(
                    fontFamily: 'Proxima',
                    fontSize: 10,
                    color: Color.fromRGBO(252, 128, 25, 1),
                  ),
                ),
                icon: SvgPicture.asset(
                  'assets/images/score2.svg',
                  color: Globals.appColor,
                  height: 30,
                  width: 30,
                ),
                inactiveColor: Colors.grey,
              ),
              BottomNavyBarItem(
                textAlign: TextAlign.justify,
                activeColor: Color.fromRGBO(252, 128, 25, 1),
                title: Text(
                  'SCORE',
                  style: TextStyle(
                    fontFamily: 'Proxima',
                    fontSize: 10,
                    color: Color.fromRGBO(252, 128, 25, 1),
                  ),
                ),
                icon: SvgPicture.asset(
                  'assets/images/calendar.svg',
                  color: Globals.appColor,
                  height: 30,
                  width: 30,
                ),
                inactiveColor: Colors.grey,
              ),
            ],
          ),
        ), */
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            isDrawerClicked = false;
            setState(() => _currentIndex = value);

            if (_pageController.hasClients) {
              if (value == 2) {
                if (!_scaffoldKey.currentState!.isDrawerOpen) {
                  _scaffoldKey.currentState!.openDrawer();
                }
              } else {
                /* _pageController.animateToPage(index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn); */
                _pageController.jumpToPage(value);
              }
            }
          },
          elevation: 0,
          currentIndex: 0, // this will be set when a new tab is tapped

          selectedLabelStyle: GoogleFonts.alegreyaSc(
            fontSize: 14,
            color: HexColor('#416271'),
            fontWeight: FontWeight.normal,
          ),
          unselectedLabelStyle: GoogleFonts.alegreyaSc(
            fontSize: 14,
            color: HexColor('#416271'),
            fontWeight: FontWeight.normal,
          ),
          selectedItemColor: HexColor('#416271'),
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
        ),
      ),
    );
  }
}

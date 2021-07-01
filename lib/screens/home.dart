import 'dart:io';

import 'package:auto_pilot/shared/drawer/auto_pilot_drawer.dart';
import 'package:auto_pilot/shared/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _pageController;

  // PageView object
  late PageView pageView;

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

    // Initialize the pageview
    pageView = PageView(
      physics: NeverScrollableScrollPhysics(),
      allowImplicitScrolling: true,
      controller: _pageController,
      onPageChanged: (index) {},
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
          /* leading: Builder(
            builder: (context) => Container(
              padding: const EdgeInsets.fromLTRB(4.0, 4.0, 0.0, 4.0),
              width: 30.0,
              child: IconButton(
                icon: new Icon(
                  Icons.menu,
                  color: Color.fromRGBO(252, 128, 25, 1),
                  size: 30.0,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ), */

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
      ),
    );
  }
}

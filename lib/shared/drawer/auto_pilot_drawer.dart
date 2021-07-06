import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:flutter/material.dart';

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
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: Container(
                color: Colors.transparent,
                child: Stack(children: <Widget>[]),
              ),
            ),
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

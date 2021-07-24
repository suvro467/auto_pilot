import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class UserListScreen1 extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController pageController;

  /* final int tabMenuSelected;
  final int taskItemTapped; */
  const UserListScreen1(
      {required this.scaffoldKey,
      required this.pageController,

      /* required this.tabMenuSelected,
      required this.taskItemTapped, */
      Key? key})
      : super(key: key);

  @override
  _UserListScreen1State createState() => _UserListScreen1State();
}

class _UserListScreen1State extends State<UserListScreen1>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isDelegatesExpanded = false;
  bool isRepeatExpanded = false;
  bool isSupportExpanded = false;
  bool isPersonalExpanded = false;

  Map<String, double> tasksCompleted = {'Flutter': 90, 'Kotlin': 10};
  Map<String, double> tasksOnTime = {'Flutter': 60, 'Kotlin': 40};
  Map<String, double> approvedBenchaMark = {'Flutter': 80, 'Kotlin': 20};

  late Widget editIcon;
  late Widget deleteIcon;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);

    editIcon = SvgPicture.asset(
      'assets/images/edit.svg',
      color: HexColor('#C9C9C9'),
      height: 40,
      width: 40,
    );

    deleteIcon = SvgPicture.asset(
      'assets/images/delete.svg',
      color: HexColor('#C9C9C9'),
      height: 40,
      width: 40,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'Your Users',
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
                  InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/images/plus.svg',
                      color: MyAutoPilotStyles.appColor,
                      //semanticsLabel: 'Email Mobile',
                      height: 40,
                      width: 40,
                    ),
                  )
                ],
              ),
            ),
            // Custom Tab Bar
            Container(
              width: MediaQuery.of(context).size.width * 90 / 100,
              margin: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    border: Border.all(
                        width: 2, color: MyAutoPilotStyles.appColor)),
                child: TabBar(
                  onTap: (value) {
                    setState(() {});
                  },
                  labelPadding: EdgeInsets.zero,
                  labelStyle: GoogleFonts.notoSerif(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: MyAutoPilotStyles.appColor,
                  ),
                  unselectedLabelStyle: GoogleFonts.notoSerif(
                    color: HexColor('#707070'),
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),

                  unselectedLabelColor: HexColor('#707070'),
                  tabs: [
                    Container(
                      width: 65,
                      child: Tab(
                        text: 'All',
                      ),
                    ),
                    Container(
                      width: 65,
                      child: Tab(
                        text: 'Active',
                      ),
                    ),
                    Container(
                      width: 65,
                      child: Tab(
                        text: 'Inactive',
                      ),
                    ),
                    Container(
                      //width: 65,
                      child: Tab(
                        text: 'Deleted',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Custom TabBarView
            Flexible(
              fit: FlexFit.loose,
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Today
                  ListView(children: [
                    Card(
                      elevation: 5,
                      shadowColor: Colors.black,
                      //color: Colors.amber[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.elliptical(2, 2),
                          bottomRight: Radius.elliptical(2, 2),
                          topLeft: Radius.elliptical(2, 2),
                          bottomLeft: Radius.elliptical(2, 2),
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        height: 70,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Transform.scale(
                                    scale: 2.5,
                                    child: SvgPicture.asset(
                                      'assets/images/delegate task.svg',
                                      color: MyAutoPilotStyles.appColor,
                                      //semanticsLabel: 'Email Mobile',
                                      height: 10,
                                      width: 10,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Text(
                                      'Test',
                                      style: GoogleFonts.notoSerif(
                                        color: HexColor('#707070'),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      'Delegated Tasks',
                                      style: GoogleFonts.notoSerif(
                                        color: HexColor('#707070'),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ]),
                  // Weekly
                  ListView(children: [
                    Card(
                      elevation: 5,
                      shadowColor: Colors.black,
                      //color: Colors.amber[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.elliptical(2, 2),
                          bottomRight: Radius.elliptical(2, 2),
                          topLeft: Radius.elliptical(2, 2),
                          bottomLeft: Radius.elliptical(2, 2),
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        height: 70,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Transform.scale(
                                    scale: 2.5,
                                    child: SvgPicture.asset(
                                      'assets/images/delegate task.svg',
                                      color: MyAutoPilotStyles.appColor,
                                      //semanticsLabel: 'Email Mobile',
                                      height: 10,
                                      width: 10,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Text(
                                      'Test',
                                      style: GoogleFonts.notoSerif(
                                        color: HexColor('#707070'),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      'Delegated Tasks',
                                      style: GoogleFonts.notoSerif(
                                        color: HexColor('#707070'),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ]),

                  // Inactive
                  ListView(children: [
                    Card(
                      elevation: 5,
                      shadowColor: Colors.black,
                      //color: Colors.amber[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.elliptical(2, 2),
                          bottomRight: Radius.elliptical(2, 2),
                          topLeft: Radius.elliptical(2, 2),
                          bottomLeft: Radius.elliptical(2, 2),
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        height: 70,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Transform.scale(
                                    scale: 2.5,
                                    child: SvgPicture.asset(
                                      'assets/images/delegate task.svg',
                                      color: MyAutoPilotStyles.appColor,
                                      //semanticsLabel: 'Email Mobile',
                                      height: 10,
                                      width: 10,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Text(
                                      'Test',
                                      style: GoogleFonts.notoSerif(
                                        color: HexColor('#707070'),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      'Delegated Tasks',
                                      style: GoogleFonts.notoSerif(
                                        color: HexColor('#707070'),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ]),

                  // Deleted
                  ListView(children: [
                    Card(
                      elevation: 5,
                      shadowColor: Colors.black,
                      //color: Colors.amber[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.elliptical(2, 2),
                          bottomRight: Radius.elliptical(2, 2),
                          topLeft: Radius.elliptical(2, 2),
                          bottomLeft: Radius.elliptical(2, 2),
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        height: 70,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Transform.scale(
                                    scale: 2.5,
                                    child: SvgPicture.asset(
                                      'assets/images/delegate task.svg',
                                      color: MyAutoPilotStyles.appColor,
                                      //semanticsLabel: 'Email Mobile',
                                      height: 10,
                                      width: 10,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Text(
                                      'Test',
                                      style: GoogleFonts.notoSerif(
                                        color: HexColor('#707070'),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      'Delegated Tasks',
                                      style: GoogleFonts.notoSerif(
                                        color: HexColor('#707070'),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:auto_pilot/shared/globals.dart';
import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:auto_pilot/shared/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                    // All
                    FutureBuilder(
                      future: fetchUsers(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          //UsersDataModel responseModel = snapshot.data;
                          var responseModel = snapshot.data;
                          return AnimationLimiter(
                            child: ListView.builder(
                              itemCount: responseModel['users'].length,
                              itemBuilder: (BuildContext context, int index) {
                                var data = responseModel['users'][index];

                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  child: SlideAnimation(
                                    verticalOffset: 50,
                                    child: FadeInAnimation(
                                      child: InkWell(
                                        splashColor:
                                            Colors.orange.withAlpha(30),
                                        onTap: () {},
                                        child: Card(
                                          elevation: 5,
                                          shadowColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.elliptical(2, 2),
                                              bottomRight:
                                                  Radius.elliptical(2, 2),
                                              topLeft: Radius.elliptical(2, 2),
                                              bottomLeft:
                                                  Radius.elliptical(2, 2),
                                            ),
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: Container(
                                            height: 80,
                                            color: Colors.white,
                                            /* padding: const EdgeInsets.fromLTRB(
                                                4.0, 5.0, 0, 5.0), */
                                            padding: EdgeInsets.only(
                                              right: 10,
                                              left: 10,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 40.0,
                                                      width: 40.0,
                                                      margin: const EdgeInsets
                                                              .only(
                                                          bottom:
                                                              6.0), //Same as `blurRadius` i guess
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                            'assets/images/selfpic.jpg',
                                                          ),
                                                        ),
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(0.0,
                                                                1.0), //(x,y)
                                                            blurRadius: 6.0,
                                                          ),
                                                        ],
                                                      ),
                                                      /* child: Image(
                                                    image: AssetImage(
                                                      'assets/images/selfpic.jpg',
                                                    ),
                                                  ), */
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 10,
                                                        bottom: 10,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${data['firstName']}",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: GoogleFonts
                                                                .notoSerif(
                                                              color: HexColor(
                                                                  '#707070'),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "${data['teamName']}",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: GoogleFonts
                                                                .notoSans(
                                                              color: HexColor(
                                                                  '#707070'),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: IconButton(
                                                      icon: SvgPicture.asset(
                                                        'assets/images/edit.svg',
                                                        color:
                                                            HexColor('#C9C9C9'),
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: IconButton(
                                                      icon: SvgPicture.asset(
                                                        'assets/images/delete.svg',
                                                        color:
                                                            HexColor('#C9C9C9'),
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ]),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return LoadingDialog();
                        }
                      },
                    ),

                    // Weekly
                    FutureBuilder(
                      future: fetchUsers(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          //UsersDataModel responseModel = snapshot.data;
                          var responseModel = snapshot.data;
                          return AnimationLimiter(
                            child: ListView.builder(
                              itemCount: responseModel['users'].length,
                              itemBuilder: (BuildContext context, int index) {
                                var data = responseModel['users'][index];

                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  child: SlideAnimation(
                                    verticalOffset: 50,
                                    child: FadeInAnimation(
                                      child: InkWell(
                                        splashColor:
                                            Colors.orange.withAlpha(30),
                                        onTap: () {},
                                        child: Card(
                                          elevation: 5,
                                          shadowColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.elliptical(2, 2),
                                              bottomRight:
                                                  Radius.elliptical(2, 2),
                                              topLeft: Radius.elliptical(2, 2),
                                              bottomLeft:
                                                  Radius.elliptical(2, 2),
                                            ),
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: Container(
                                            height: 80,
                                            color: Colors.white,
                                            /* padding: const EdgeInsets.fromLTRB(
                                                4.0, 5.0, 0, 5.0), */
                                            padding: EdgeInsets.only(
                                              right: 10,
                                              left: 10,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 40.0,
                                                      width: 40.0,
                                                      margin: const EdgeInsets
                                                              .only(
                                                          bottom:
                                                              6.0), //Same as `blurRadius` i guess
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                            'assets/images/selfpic.jpg',
                                                          ),
                                                        ),
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(0.0,
                                                                1.0), //(x,y)
                                                            blurRadius: 6.0,
                                                          ),
                                                        ],
                                                      ),
                                                      /* child: Image(
                                                    image: AssetImage(
                                                      'assets/images/selfpic.jpg',
                                                    ),
                                                  ), */
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 10,
                                                        bottom: 10,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${data['firstName']}",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: GoogleFonts
                                                                .notoSerif(
                                                              color: HexColor(
                                                                  '#707070'),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "${data['teamName']}",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: GoogleFonts
                                                                .notoSans(
                                                              color: HexColor(
                                                                  '#707070'),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: IconButton(
                                                      icon: SvgPicture.asset(
                                                        'assets/images/edit.svg',
                                                        color:
                                                            HexColor('#C9C9C9'),
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: IconButton(
                                                      icon: SvgPicture.asset(
                                                        'assets/images/delete.svg',
                                                        color:
                                                            HexColor('#C9C9C9'),
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ]),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return LoadingDialog();
                        }
                      },
                    ),

                    // Inactive
                    FutureBuilder(
                      future: fetchUsers(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          //UsersDataModel responseModel = snapshot.data;
                          var responseModel = snapshot.data;
                          return AnimationLimiter(
                            child: ListView.builder(
                              itemCount: responseModel['users'].length,
                              itemBuilder: (BuildContext context, int index) {
                                var data = responseModel['users'][index];

                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  child: SlideAnimation(
                                    verticalOffset: 50,
                                    child: FadeInAnimation(
                                      child: InkWell(
                                        splashColor:
                                            Colors.orange.withAlpha(30),
                                        onTap: () {},
                                        child: Card(
                                          elevation: 5,
                                          shadowColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.elliptical(2, 2),
                                              bottomRight:
                                                  Radius.elliptical(2, 2),
                                              topLeft: Radius.elliptical(2, 2),
                                              bottomLeft:
                                                  Radius.elliptical(2, 2),
                                            ),
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: Container(
                                            height: 80,
                                            color: Colors.white,
                                            /* padding: const EdgeInsets.fromLTRB(
                                                4.0, 5.0, 0, 5.0), */
                                            padding: EdgeInsets.only(
                                              right: 10,
                                              left: 10,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 40.0,
                                                      width: 40.0,
                                                      margin: const EdgeInsets
                                                              .only(
                                                          bottom:
                                                              6.0), //Same as `blurRadius` i guess
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                            'assets/images/selfpic.jpg',
                                                          ),
                                                        ),
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(0.0,
                                                                1.0), //(x,y)
                                                            blurRadius: 6.0,
                                                          ),
                                                        ],
                                                      ),
                                                      /* child: Image(
                                                    image: AssetImage(
                                                      'assets/images/selfpic.jpg',
                                                    ),
                                                  ), */
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 10,
                                                        bottom: 10,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${data['firstName']}",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: GoogleFonts
                                                                .notoSerif(
                                                              color: HexColor(
                                                                  '#707070'),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "${data['teamName']}",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: GoogleFonts
                                                                .notoSans(
                                                              color: HexColor(
                                                                  '#707070'),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: IconButton(
                                                      icon: SvgPicture.asset(
                                                        'assets/images/edit.svg',
                                                        color:
                                                            HexColor('#C9C9C9'),
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: IconButton(
                                                      icon: SvgPicture.asset(
                                                        'assets/images/delete.svg',
                                                        color:
                                                            HexColor('#C9C9C9'),
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ]),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return LoadingDialog();
                        }
                      },
                    ),

                    // Deleted
                    FutureBuilder(
                      future: fetchUsers(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          //UsersDataModel responseModel = snapshot.data;
                          var responseModel = snapshot.data;
                          return AnimationLimiter(
                            child: ListView.builder(
                              itemCount: responseModel['users'].length,
                              itemBuilder: (BuildContext context, int index) {
                                var data = responseModel['users'][index];

                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  child: SlideAnimation(
                                    verticalOffset: 50,
                                    child: FadeInAnimation(
                                      child: InkWell(
                                        splashColor:
                                            Colors.orange.withAlpha(30),
                                        onTap: () {},
                                        child: Card(
                                          elevation: 5,
                                          shadowColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.elliptical(2, 2),
                                              bottomRight:
                                                  Radius.elliptical(2, 2),
                                              topLeft: Radius.elliptical(2, 2),
                                              bottomLeft:
                                                  Radius.elliptical(2, 2),
                                            ),
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: Container(
                                            height: 80,
                                            color: Colors.white,
                                            /* padding: const EdgeInsets.fromLTRB(
                                                4.0, 5.0, 0, 5.0), */
                                            padding: EdgeInsets.only(
                                              right: 10,
                                              left: 10,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 40.0,
                                                      width: 40.0,
                                                      margin: const EdgeInsets
                                                              .only(
                                                          bottom:
                                                              6.0), //Same as `blurRadius` i guess
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                            'assets/images/selfpic.jpg',
                                                          ),
                                                        ),
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(0.0,
                                                                1.0), //(x,y)
                                                            blurRadius: 6.0,
                                                          ),
                                                        ],
                                                      ),
                                                      /* child: Image(
                                                    image: AssetImage(
                                                      'assets/images/selfpic.jpg',
                                                    ),
                                                  ), */
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 10,
                                                        bottom: 10,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${data['firstName']}",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: GoogleFonts
                                                                .notoSerif(
                                                              color: HexColor(
                                                                  '#707070'),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "${data['teamName']}",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: GoogleFonts
                                                                .notoSans(
                                                              color: HexColor(
                                                                  '#707070'),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: IconButton(
                                                      icon: SvgPicture.asset(
                                                        'assets/images/edit.svg',
                                                        color:
                                                            HexColor('#C9C9C9'),
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: IconButton(
                                                      icon: SvgPicture.asset(
                                                        'assets/images/delete.svg',
                                                        color:
                                                            HexColor('#C9C9C9'),
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ]),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return LoadingDialog();
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //fetchUsers() {}
  Future<Map<String, dynamic>> fetchUsers() async {
    /* print('baseUrl for InnerMenu: $baseUrl');
    print('apiUrl for InnerMenu: $getApiUrlComplementary');

    final response = await http.get(
      Uri.http(baseUrl, getApiUrlComplementary),
      //headers: {HttpHeaders.authorizationHeader: ''},
      headers: Globals.apiHeaders,
    );

    if (response.statusCode == 200) {
      print('Response body : ${response.body}. End of response body.');
      final responseJson = jsonDecode(response.body);
      complementaryDataModel = ComplementaryDataModel.fromJson(responseJson);

      return complementaryDataModel;
    } else {
      throw Exception('Failed to load data.');
    } */

    return {
      'users': [
        {'firstName': 'Suvradip Roy', 'teamName': 'Team 01'},
        {'firstName': 'Suvradip Roy', 'teamName': 'Team 02'},
        {'firstName': 'Suvradip Roy', 'teamName': 'Team 03'},
        {'firstName': 'Suvradip Roy', 'teamName': 'Team 04'},
      ]
    };
  }

  FutureOr<bool> onWillPop() {
    widget.pageController.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
    //widget.pageController.animateToPage(page, duration: duration, curve: curve);
    return false;
  }
}

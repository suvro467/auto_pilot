import 'package:auto_pilot/shared/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pie_chart/pie_chart.dart';

class TaskList extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController pageController;

  /* final int tabMenuSelected;
  final int taskItemTapped; */
  const TaskList(
      {required this.scaffoldKey,
      required this.pageController,

      /* required this.tabMenuSelected,
      required this.taskItemTapped, */
      Key? key})
      : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isDelegatesExpanded = false;
  bool isRepeatExpanded = false;
  bool isSupportExpanded = false;
  bool isPersonalExpanded = false;

  Map<String, double> tasksCompleted = {'Flutter': 90, 'Kotlin': 10};
  Map<String, double> tasksOnTime = {'Flutter': 60, 'Kotlin': 40};
  Map<String, double> approvedBenchaMark = {'Flutter': 80, 'Kotlin': 20};

  late int totalDelegatedTasks;
  late int totalDelegatedTasksWeekly;
  late int totalDelegatedTasksMonthly;
  late int totalDelegatedTasksOverDue;

  late int totalRepeatTasks;
  late int totalRepeatTasksWeekly;
  late int totalRepeatTasksMonthly;
  late int totalRepeatTasksOverDue;

  late int totalSupportTasks;
  late int totalSupportTasksWeekly;
  late int totalSupportTasksMonthly;
  late int totalSupportTasksOverDue;

  late int totalPersonalTasks;
  late int totalPersonalTasksWeekly;
  late int totalPersonalTasksMonthly;
  late int totalPersonalTasksOverDue;

  late Icon trailingIconDelegatedTask;
  late Icon trailingIconDelegatedTaskWeekly;
  late Icon trailingIconDelegatedTaskMonthly;
  late Icon trailingIconDelegatedTaskOverDue;

  late Icon trailingIconRepeatTask;
  late Icon trailingIconRepeatTaskWeekly;
  late Icon trailingIconRepeatTaskMonthly;
  late Icon trailingIconRepeatTaskOverDue;

  late Icon trailingIconSupportTask;
  late Icon trailingIconSupportTaskWeekly;
  late Icon trailingIconSupportTaskMonthly;
  late Icon trailingIconSupportTaskOverDue;

  late Icon trailingIconPersonalTask;
  late Icon trailingIconPersonalTaskWeekly;
  late Icon trailingIconPersonalTaskMonthly;
  late Icon trailingIconPersonalTaskOverDue;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);

    totalDelegatedTasks = 11;
    totalDelegatedTasksWeekly = 20;
    totalDelegatedTasksMonthly = 56;
    totalDelegatedTasksOverDue = 5;

    totalRepeatTasks = 2;
    totalRepeatTasksWeekly = 15;
    totalRepeatTasksMonthly = 20;
    totalRepeatTasksOverDue = 1;

    totalSupportTasks = 7;
    totalSupportTasksWeekly = 10;
    totalSupportTasksMonthly = 16;
    totalSupportTasksOverDue = 4;

    totalPersonalTasks = 1;
    totalPersonalTasksWeekly = 6;
    totalPersonalTasksMonthly = 22;
    totalPersonalTasksOverDue = 3;

    trailingIconDelegatedTask = Icon(
      Icons.arrow_drop_down,
      color: Globals.appColor,
      size: 36,
    );
    trailingIconRepeatTask = Icon(
      Icons.arrow_drop_down,
      color: Globals.appColor,
      size: 36,
    );
    trailingIconSupportTask = Icon(
      Icons.arrow_drop_down,
      color: Globals.appColor,
      size: 36,
    );
    trailingIconPersonalTask = Icon(
      Icons.arrow_drop_down,
      color: Globals.appColor,
      size: 36,
    );

    trailingIconDelegatedTaskWeekly = Icon(
      Icons.arrow_drop_down,
      color: Globals.appColor,
      size: 36,
    );
    trailingIconRepeatTaskWeekly = Icon(
      Icons.arrow_drop_down,
      color: Globals.appColor,
      size: 36,
    );
    trailingIconSupportTaskWeekly = Icon(
      Icons.arrow_drop_down,
      color: Globals.appColor,
      size: 36,
    );
    trailingIconPersonalTaskWeekly = Icon(
      Icons.arrow_drop_down,
      color: Globals.appColor,
      size: 36,
    );

    trailingIconDelegatedTaskMonthly = Icon(
      Icons.arrow_drop_down,
      color: Globals.appColor,
      size: 36,
    );
    trailingIconRepeatTaskMonthly = Icon(
      Icons.arrow_drop_down,
      color: Globals.appColor,
      size: 36,
    );
    trailingIconSupportTaskMonthly = Icon(
      Icons.arrow_drop_down,
      color: Globals.appColor,
      size: 36,
    );
    trailingIconPersonalTaskMonthly = Icon(
      Icons.arrow_drop_down,
      color: Globals.appColor,
      size: 36,
    );

    trailingIconDelegatedTaskOverDue = Icon(
      Icons.arrow_drop_down,
      color: Globals.appColor,
      size: 36,
    );
    trailingIconRepeatTaskOverDue = Icon(
      Icons.arrow_drop_down,
      color: Globals.appColor,
      size: 36,
    );
    trailingIconSupportTaskOverDue = Icon(
      Icons.arrow_drop_down,
      color: Globals.appColor,
      size: 36,
    );
    trailingIconPersonalTaskOverDue = Icon(
      Icons.arrow_drop_down,
      color: Globals.appColor,
      size: 36,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [],
                ),
              ],
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
                    border: Border.all(width: 2, color: Globals.appColor)),
                child: TabBar(
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
                    color: Globals.appColor,
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
                        text: 'Today',
                      ),
                    ),
                    Container(
                      width: 65,
                      child: Tab(
                        text: 'Weekly',
                      ),
                    ),
                    Container(
                      width: 65,
                      child: Tab(
                        text: 'Monthly',
                      ),
                    ),
                    Container(
                      //width: 65,
                      child: Tab(
                        text: 'Over Due',
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
                      child: ExpansionTile(
                        maintainState: true,
                        title: Container(
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
                                          color: Globals.appColor,
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
                                          totalDelegatedTasks.toString(),
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
                            )),
                        onExpansionChanged: (value) {
                          if (value) {
                            trailingIconDelegatedTask = Icon(
                              Icons.arrow_right,
                              color: Globals.appColor,
                              size: 36,
                            );
                          } else {
                            trailingIconDelegatedTask = Icon(
                              Icons.arrow_drop_down,
                              color: Globals.appColor,
                              size: 36,
                            );
                          }

                          setState(() {});
                        },
                        trailing: Container(
                          color: Colors.white,
                          child: trailingIconDelegatedTask,
                        ),
                        children: _getDelegatedTasks(0),
                      ),
                    ),
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
                      child: ExpansionTile(
                        maintainState: true,
                        title: Container(
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
                                          'assets/images/repeat.svg',
                                          color: Globals.appColor,
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
                                          totalRepeatTasks.toString(),
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
                                          'Repeat Tasks',
                                          style: GoogleFonts.notoSerif(
                                            color: HexColor('#707070'),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ],
                            )),
                        onExpansionChanged: (value) {
                          if (value) {
                            trailingIconRepeatTask = Icon(
                              Icons.arrow_right,
                              color: Globals.appColor,
                              size: 36,
                            );
                          } else {
                            trailingIconRepeatTask = Icon(
                              Icons.arrow_drop_down,
                              color: Globals.appColor,
                              size: 36,
                            );
                          }

                          setState(() {});
                        },
                        trailing: Container(
                          color: Colors.white,
                          child: trailingIconRepeatTask,
                        ),
                        children: _getRepeatTasks(0),
                      ),
                    ),
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
                      child: ExpansionTile(
                        maintainState: true,
                        title: Container(
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
                                          'assets/images/support.svg',
                                          color: Globals.appColor,
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
                                          totalSupportTasks.toString(),
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
                                          'Support Tasks',
                                          style: GoogleFonts.notoSerif(
                                            color: HexColor('#707070'),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ],
                            )),
                        onExpansionChanged: (value) {
                          if (value) {
                            trailingIconSupportTask = Icon(
                              Icons.arrow_right,
                              color: Globals.appColor,
                              size: 36,
                            );
                          } else {
                            trailingIconSupportTask = Icon(
                              Icons.arrow_drop_down,
                              color: Globals.appColor,
                              size: 36,
                            );
                          }

                          setState(() {});
                        },
                        trailing: Container(
                          color: Colors.white,
                          child: trailingIconSupportTask,
                        ),
                        children: _getSupportTasks(0),
                      ),
                    ),
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
                      child: ExpansionTile(
                        maintainState: true,
                        title: Container(
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
                                          'assets/images/personal tasks.svg',
                                          color: Globals.appColor,
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
                                          totalPersonalTasks.toString(),
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
                                          'Personal Tasks',
                                          style: GoogleFonts.notoSerif(
                                            color: HexColor('#707070'),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ],
                            )),
                        onExpansionChanged: (value) {
                          if (value) {
                            trailingIconPersonalTask = Icon(
                              Icons.arrow_right,
                              color: Globals.appColor,
                              size: 36,
                            );
                          } else {
                            trailingIconPersonalTask = Icon(
                              Icons.arrow_drop_down,
                              color: Globals.appColor,
                              size: 36,
                            );
                          }

                          setState(() {});
                        },
                        trailing: Container(
                          color: Colors.white,
                          child: trailingIconPersonalTask,
                        ),
                        children: _getPersonalTasks(0),
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
                      child: ExpansionTile(
                        maintainState: true,
                        title: Container(
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
                                          color: Globals.appColor,
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
                                          totalDelegatedTasksWeekly.toString(),
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
                            )),
                        onExpansionChanged: (value) {
                          if (value) {
                            trailingIconDelegatedTask = Icon(
                              Icons.arrow_right,
                              color: Globals.appColor,
                              size: 36,
                            );
                          } else {
                            trailingIconDelegatedTask = Icon(
                              Icons.arrow_drop_down,
                              color: Globals.appColor,
                              size: 36,
                            );
                          }

                          setState(() {});
                        },
                        trailing: Container(
                          color: Colors.white,
                          child: trailingIconDelegatedTask,
                        ),
                        children: _getDelegatedTasks(1),
                      ),
                    ),
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
                      child: ExpansionTile(
                        maintainState: true,
                        title: Container(
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
                                          'assets/images/repeat.svg',
                                          color: Globals.appColor,
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
                                          totalRepeatTasksWeekly.toString(),
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
                                          'Repeat Tasks',
                                          style: GoogleFonts.notoSerif(
                                            color: HexColor('#707070'),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ],
                            )),
                        onExpansionChanged: (value) {
                          if (value) {
                            trailingIconRepeatTask = Icon(
                              Icons.arrow_right,
                              color: Globals.appColor,
                              size: 36,
                            );
                          } else {
                            trailingIconRepeatTask = Icon(
                              Icons.arrow_drop_down,
                              color: Globals.appColor,
                              size: 36,
                            );
                          }

                          setState(() {});
                        },
                        trailing: Container(
                          color: Colors.white,
                          child: trailingIconRepeatTask,
                        ),
                        children: _getRepeatTasks(1),
                      ),
                    ),
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
                      child: ExpansionTile(
                        maintainState: true,
                        title: Container(
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
                                          'assets/images/support.svg',
                                          color: Globals.appColor,
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
                                          totalSupportTasksWeekly.toString(),
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
                                          'Support Tasks',
                                          style: GoogleFonts.notoSerif(
                                            color: HexColor('#707070'),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ],
                            )),
                        onExpansionChanged: (value) {
                          if (value) {
                            trailingIconSupportTask = Icon(
                              Icons.arrow_right,
                              color: Globals.appColor,
                              size: 36,
                            );
                          } else {
                            trailingIconSupportTask = Icon(
                              Icons.arrow_drop_down,
                              color: Globals.appColor,
                              size: 36,
                            );
                          }

                          setState(() {});
                        },
                        trailing: Container(
                          color: Colors.white,
                          child: trailingIconSupportTask,
                        ),
                        children: _getSupportTasks(1),
                      ),
                    ),
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
                      child: ExpansionTile(
                        maintainState: true,
                        title: Container(
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
                                          'assets/images/personal tasks.svg',
                                          color: Globals.appColor,
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
                                          totalPersonalTasksWeekly.toString(),
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
                                          'Personal Tasks',
                                          style: GoogleFonts.notoSerif(
                                            color: HexColor('#707070'),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ],
                            )),
                        onExpansionChanged: (value) {
                          if (value) {
                            trailingIconPersonalTask = Icon(
                              Icons.arrow_right,
                              color: Globals.appColor,
                              size: 36,
                            );
                          } else {
                            trailingIconPersonalTask = Icon(
                              Icons.arrow_drop_down,
                              color: Globals.appColor,
                              size: 36,
                            );
                          }

                          setState(() {});
                        },
                        trailing: Container(
                          color: Colors.white,
                          child: trailingIconPersonalTask,
                        ),
                        children: _getPersonalTasks(1),
                      ),
                    ),
                  ]),

                  // Monthly
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
                      child: ExpansionTile(
                        maintainState: true,
                        title: Container(
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
                                          color: Globals.appColor,
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
                                          totalDelegatedTasksMonthly.toString(),
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
                            )),
                        onExpansionChanged: (value) {
                          if (value) {
                            trailingIconDelegatedTask = Icon(
                              Icons.arrow_right,
                              color: Globals.appColor,
                              size: 36,
                            );
                          } else {
                            trailingIconDelegatedTask = Icon(
                              Icons.arrow_drop_down,
                              color: Globals.appColor,
                              size: 36,
                            );
                          }

                          setState(() {});
                        },
                        trailing: Container(
                          color: Colors.white,
                          child: trailingIconDelegatedTask,
                        ),
                        children: _getDelegatedTasks(2),
                      ),
                    ),
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
                      child: ExpansionTile(
                        maintainState: true,
                        title: Container(
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
                                          'assets/images/repeat.svg',
                                          color: Globals.appColor,
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
                                          totalRepeatTasksMonthly.toString(),
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
                                          'Repeat Tasks',
                                          style: GoogleFonts.notoSerif(
                                            color: HexColor('#707070'),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ],
                            )),
                        onExpansionChanged: (value) {
                          if (value) {
                            trailingIconRepeatTask = Icon(
                              Icons.arrow_right,
                              color: Globals.appColor,
                              size: 36,
                            );
                          } else {
                            trailingIconRepeatTask = Icon(
                              Icons.arrow_drop_down,
                              color: Globals.appColor,
                              size: 36,
                            );
                          }

                          setState(() {});
                        },
                        trailing: Container(
                          color: Colors.white,
                          child: trailingIconRepeatTask,
                        ),
                        children: _getRepeatTasks(2),
                      ),
                    ),
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
                      child: ExpansionTile(
                        maintainState: true,
                        title: Container(
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
                                          'assets/images/support.svg',
                                          color: Globals.appColor,
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
                                          totalSupportTasksMonthly.toString(),
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
                                          'Support Tasks',
                                          style: GoogleFonts.notoSerif(
                                            color: HexColor('#707070'),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ],
                            )),
                        onExpansionChanged: (value) {
                          if (value) {
                            trailingIconSupportTask = Icon(
                              Icons.arrow_right,
                              color: Globals.appColor,
                              size: 36,
                            );
                          } else {
                            trailingIconSupportTask = Icon(
                              Icons.arrow_drop_down,
                              color: Globals.appColor,
                              size: 36,
                            );
                          }

                          setState(() {});
                        },
                        trailing: Container(
                          color: Colors.white,
                          child: trailingIconSupportTask,
                        ),
                        children: _getSupportTasks(2),
                      ),
                    ),
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
                      child: ExpansionTile(
                        maintainState: true,
                        title: Container(
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
                                          'assets/images/personal tasks.svg',
                                          color: Globals.appColor,
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
                                          totalPersonalTasksMonthly.toString(),
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
                                          'Personal Tasks',
                                          style: GoogleFonts.notoSerif(
                                            color: HexColor('#707070'),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ],
                            )),
                        onExpansionChanged: (value) {
                          if (value) {
                            trailingIconPersonalTask = Icon(
                              Icons.arrow_right,
                              color: Globals.appColor,
                              size: 36,
                            );
                          } else {
                            trailingIconPersonalTask = Icon(
                              Icons.arrow_drop_down,
                              color: Globals.appColor,
                              size: 36,
                            );
                          }

                          setState(() {});
                        },
                        trailing: Container(
                          color: Colors.white,
                          child: trailingIconPersonalTask,
                        ),
                        children: _getPersonalTasks(2),
                      ),
                    ),
                  ]),

                  // Over Due
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
                      child: ExpansionTile(
                        maintainState: true,
                        title: Container(
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
                                          color: Globals.appColor,
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
                                          totalDelegatedTasksOverDue.toString(),
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
                            )),
                        onExpansionChanged: (value) {
                          if (value) {
                            trailingIconDelegatedTask = Icon(
                              Icons.arrow_right,
                              color: Globals.appColor,
                              size: 36,
                            );
                          } else {
                            trailingIconDelegatedTask = Icon(
                              Icons.arrow_drop_down,
                              color: Globals.appColor,
                              size: 36,
                            );
                          }

                          setState(() {});
                        },
                        trailing: Container(
                          color: Colors.white,
                          child: trailingIconDelegatedTask,
                        ),
                        children: _getDelegatedTasks(3),
                      ),
                    ),
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
                      child: ExpansionTile(
                        maintainState: true,
                        title: Container(
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
                                          'assets/images/repeat.svg',
                                          color: Globals.appColor,
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
                                          totalRepeatTasksOverDue.toString(),
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
                                          'Repeat Tasks',
                                          style: GoogleFonts.notoSerif(
                                            color: HexColor('#707070'),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ],
                            )),
                        onExpansionChanged: (value) {
                          if (value) {
                            trailingIconRepeatTask = Icon(
                              Icons.arrow_right,
                              color: Globals.appColor,
                              size: 36,
                            );
                          } else {
                            trailingIconRepeatTask = Icon(
                              Icons.arrow_drop_down,
                              color: Globals.appColor,
                              size: 36,
                            );
                          }

                          setState(() {});
                        },
                        trailing: Container(
                          color: Colors.white,
                          child: trailingIconRepeatTask,
                        ),
                        children: _getRepeatTasks(3),
                      ),
                    ),
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
                      child: ExpansionTile(
                        maintainState: true,
                        title: Container(
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
                                          'assets/images/support.svg',
                                          color: Globals.appColor,
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
                                          totalSupportTasksOverDue.toString(),
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
                                          'Support Tasks',
                                          style: GoogleFonts.notoSerif(
                                            color: HexColor('#707070'),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ],
                            )),
                        onExpansionChanged: (value) {
                          if (value) {
                            trailingIconSupportTask = Icon(
                              Icons.arrow_right,
                              color: Globals.appColor,
                              size: 36,
                            );
                          } else {
                            trailingIconSupportTask = Icon(
                              Icons.arrow_drop_down,
                              color: Globals.appColor,
                              size: 36,
                            );
                          }

                          setState(() {});
                        },
                        trailing: Container(
                          color: Colors.white,
                          child: trailingIconSupportTask,
                        ),
                        children: _getSupportTasks(3),
                      ),
                    ),
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
                      child: ExpansionTile(
                        maintainState: true,
                        title: Container(
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
                                          'assets/images/personal tasks.svg',
                                          color: Globals.appColor,
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
                                          totalPersonalTasksOverDue.toString(),
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
                                          'Personal Tasks',
                                          style: GoogleFonts.notoSerif(
                                            color: HexColor('#707070'),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ],
                            )),
                        onExpansionChanged: (value) {
                          if (value) {
                            trailingIconPersonalTask = Icon(
                              Icons.arrow_right,
                              color: Globals.appColor,
                              size: 36,
                            );
                          } else {
                            trailingIconPersonalTask = Icon(
                              Icons.arrow_drop_down,
                              color: Globals.appColor,
                              size: 36,
                            );
                          }

                          setState(() {});
                        },
                        trailing: Container(
                          color: Colors.white,
                          child: trailingIconPersonalTask,
                        ),
                        children: _getPersonalTasks(3),
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

  List<Widget> _getDelegatedTasks(int tabIndex) {
    List<Card> returnedWidgets = [];

    for (int i = 0;
        i <
            (tabIndex == 0
                ? totalDelegatedTasks
                : (tabIndex == 1
                    ? totalDelegatedTasksWeekly
                    : (tabIndex == 2
                        ? totalDelegatedTasksMonthly
                        : totalDelegatedTasksOverDue)));
        i++) {
      returnedWidgets.add(Card(
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
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This is a small description of the ...',
                      style: GoogleFonts.notoSerif(
                          color: HexColor('#707070'),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          decoration:
                              i.isEven ? null : TextDecoration.lineThrough),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              'By: Suvradip Roy',
                              style: GoogleFonts.notoSerif(
                                color: HexColor('#707070'),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            'Due: 4 Jul 2021',
                            style: GoogleFonts.notoSerif(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SvgPicture.asset(
                  i.isEven
                      ? 'assets/images/check-mark.svg'
                      : 'assets/images/x-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
        ),
      ));
    }
    return returnedWidgets;
  }

  List<Widget> _getRepeatTasks(int cupertinoTabBarIIIValue) {
    List<Card> returnedWidgets = [];

    for (int i = 0;
        i <
            (cupertinoTabBarIIIValue == 0
                ? totalRepeatTasks
                : (cupertinoTabBarIIIValue == 1
                    ? totalRepeatTasksWeekly
                    : (cupertinoTabBarIIIValue == 2
                        ? totalRepeatTasksMonthly
                        : totalRepeatTasksOverDue)));
        i++) {
      returnedWidgets.add(Card(
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
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This is a small description of the ...',
                      style: GoogleFonts.notoSerif(
                          color: HexColor('#707070'),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          decoration:
                              i.isEven ? null : TextDecoration.lineThrough),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              'By: Suvradip Roy',
                              style: GoogleFonts.notoSerif(
                                color: HexColor('#707070'),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            'Due: 4 Jul 2021',
                            style: GoogleFonts.notoSerif(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SvgPicture.asset(
                  i.isEven
                      ? 'assets/images/check-mark.svg'
                      : 'assets/images/x-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
        ),
      ));
    }
    return returnedWidgets;
  }

  List<Widget> _getSupportTasks(int cupertinoTabBarIIIValue) {
    List<Card> returnedWidgets = [];

    for (int i = 0;
        i <
            (cupertinoTabBarIIIValue == 0
                ? totalSupportTasks
                : (cupertinoTabBarIIIValue == 1
                    ? totalSupportTasksWeekly
                    : (cupertinoTabBarIIIValue == 2
                        ? totalSupportTasksMonthly
                        : totalSupportTasksOverDue)));
        i++) {
      returnedWidgets.add(Card(
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
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This is a small description of the ...',
                      style: GoogleFonts.notoSerif(
                          color: HexColor('#707070'),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          decoration:
                              i.isEven ? null : TextDecoration.lineThrough),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              'By: Suvradip Roy',
                              style: GoogleFonts.notoSerif(
                                color: HexColor('#707070'),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            'Due: 4 Jul 2021',
                            style: GoogleFonts.notoSerif(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SvgPicture.asset(
                  i.isEven
                      ? 'assets/images/check-mark.svg'
                      : 'assets/images/x-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
        ),
      ));
    }
    return returnedWidgets;
  }

  List<Widget> _getPersonalTasks(int cupertinoTabBarIIIValue) {
    List<Card> returnedWidgets = [];

    for (int i = 0;
        i <
            (cupertinoTabBarIIIValue == 0
                ? totalPersonalTasks
                : (cupertinoTabBarIIIValue == 1
                    ? totalPersonalTasksWeekly
                    : (cupertinoTabBarIIIValue == 2
                        ? totalPersonalTasksMonthly
                        : totalPersonalTasksOverDue)));
        i++) {
      returnedWidgets.add(Card(
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
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This is a small description of the ...',
                      style: GoogleFonts.notoSerif(
                          color: HexColor('#707070'),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          decoration:
                              i.isEven ? null : TextDecoration.lineThrough),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              'By: Suvradip Roy',
                              style: GoogleFonts.notoSerif(
                                color: HexColor('#707070'),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            'Due: 4 Jul 2021',
                            style: GoogleFonts.notoSerif(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SvgPicture.asset(
                  i.isEven
                      ? 'assets/images/check-mark.svg'
                      : 'assets/images/x-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
        ),
      ));
    }
    return returnedWidgets;
  }
}

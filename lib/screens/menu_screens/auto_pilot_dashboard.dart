import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pie_chart/pie_chart.dart';

class Dashboard extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController pageController;
  final AppBar myAutoPilotAppBar;
  final BottomNavigationBar myAutoPilotBottomNavigationAppBar;
  Dashboard(
      {required this.scaffoldKey,
      required this.pageController,
      required this.myAutoPilotAppBar,
      required this.myAutoPilotBottomNavigationAppBar,
      Key? key})
      : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
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
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconRepeatTask = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconSupportTask = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconPersonalTask = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );

    trailingIconDelegatedTaskWeekly = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconRepeatTaskWeekly = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconSupportTaskWeekly = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconPersonalTaskWeekly = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );

    trailingIconDelegatedTaskMonthly = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconRepeatTaskMonthly = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconSupportTaskMonthly = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconPersonalTaskMonthly = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );

    trailingIconDelegatedTaskOverDue = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconRepeatTaskOverDue = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconSupportTaskOverDue = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconPersonalTaskOverDue = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
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
    return Container(
      //height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //mainAxisSize: MainAxisSize.min,
        children: [
          // This is the top card showing the total number of tasks completed, tasks ontime, approved benchmark.
          Transform.scale(
            scale: 0.9,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Card(
                elevation: 5,
                shadowColor: Colors.black,
                //color: Colors.amber[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(15, 15),
                    bottomRight: Radius.elliptical(15, 15),
                    topLeft: Radius.elliptical(15, 15),
                    bottomLeft: Radius.elliptical(15, 15),
                  ),
                ),
                clipBehavior: Clip.antiAlias,

                child: Container(
                  //width: MediaQuery.of(context).size.width * 80 / 100,
                  height: 125,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 130,
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(children: [
                              PieChart(
                                dataMap: tasksCompleted,
                                animationDuration: Duration(milliseconds: 800),
                                chartLegendSpacing: 0,
                                chartRadius: 50,
                                colorList: [
                                  HexColor('#416271'),
                                  Colors.transparent
                                ],
                                initialAngleInDegree: 270,
                                chartType: ChartType.disc,
                                //ringStrokeWidth: 32,
                                //centerText: "HYBRID",
                                legendOptions: LegendOptions(
                                  showLegendsInRow: true,
                                  legendPosition: LegendPosition.right,
                                  showLegends: false,
                                  legendShape: BoxShape.circle,
                                  legendTextStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                chartValuesOptions: ChartValuesOptions(
                                  showChartValueBackground: true,
                                  showChartValues: false,
                                  showChartValuesInPercentage: false,
                                  showChartValuesOutside: true,
                                  decimalPlaces: 1,
                                ),
                              ),
                              Positioned(
                                left: 95,
                                top: 35,
                                child: Text(
                                  tasksCompleted['Flutter']!
                                      .toStringAsFixed(0)
                                      .toString(),
                                  style: GoogleFonts.notoSerif(
                                    color: HexColor('#707070'),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 113,
                                top: 38,
                                child: Text(
                                  '%',
                                  style: GoogleFonts.notoSerif(
                                    color: HexColor('#707070'),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                            ]),
                            Container(
                              //margin: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                children: [
                                  Text(
                                    'TASKS',
                                    style: GoogleFonts.notoSerif(
                                      fontSize: 10,
                                      color: HexColor('#075A80'),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    'COMPLETED',
                                    style: GoogleFonts.notoSerif(
                                      fontSize: 10,
                                      color: HexColor('#075A80'),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        color: Colors.grey.withOpacity(0.4),
                        width: 1,
                      ),
                      Container(
                        width: 130,
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(children: [
                              PieChart(
                                dataMap: tasksOnTime,
                                animationDuration: Duration(milliseconds: 800),
                                chartLegendSpacing: 0,
                                chartRadius: 50,
                                colorList: [
                                  HexColor('#075A80'),
                                  Colors.transparent
                                ],
                                initialAngleInDegree: 270,
                                chartType: ChartType.disc,
                                //ringStrokeWidth: 32,
                                //centerText: "HYBRID",
                                legendOptions: LegendOptions(
                                  showLegendsInRow: true,
                                  legendPosition: LegendPosition.right,
                                  showLegends: false,
                                  legendShape: BoxShape.circle,
                                  legendTextStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                chartValuesOptions: ChartValuesOptions(
                                  showChartValueBackground: true,
                                  showChartValues: false,
                                  showChartValuesInPercentage: false,
                                  showChartValuesOutside: true,
                                  decimalPlaces: 1,
                                ),
                              ),
                              Positioned(
                                left: 95,
                                top: 35,
                                child: Text(
                                  tasksOnTime['Flutter']!
                                      .toStringAsFixed(0)
                                      .toString(),
                                  style: GoogleFonts.notoSerif(
                                    color: HexColor('#707070'),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 113,
                                top: 38,
                                child: Text(
                                  '%',
                                  style: GoogleFonts.notoSerif(
                                    color: HexColor('#707070'),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                            ]),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    'TASKS',
                                    style: GoogleFonts.notoSerif(
                                      fontSize: 10,
                                      color: HexColor('#075A80'),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    'ON TIME',
                                    style: GoogleFonts.notoSerif(
                                      fontSize: 10,
                                      color: HexColor('#075A80'),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        color: Colors.grey.withOpacity(0.4),
                        width: 1,
                      ),
                      Container(
                        width: 130,
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(children: [
                              PieChart(
                                dataMap: approvedBenchaMark,
                                animationDuration: Duration(milliseconds: 800),
                                chartLegendSpacing: 0,
                                chartRadius: 50,
                                colorList: [
                                  HexColor('#82C4E2'),
                                  Colors.transparent
                                ],
                                initialAngleInDegree: 270,
                                chartType: ChartType.disc,
                                //ringStrokeWidth: 32,
                                //centerText: "HYBRID",
                                legendOptions: LegendOptions(
                                  showLegendsInRow: true,
                                  legendPosition: LegendPosition.right,
                                  showLegends: false,
                                  legendShape: BoxShape.circle,
                                  legendTextStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                chartValuesOptions: ChartValuesOptions(
                                  showChartValueBackground: true,
                                  showChartValues: false,
                                  showChartValuesInPercentage: false,
                                  showChartValuesOutside: true,
                                  decimalPlaces: 1,
                                ),
                              ),
                              Positioned(
                                left: 95,
                                top: 35,
                                child: Text(
                                  approvedBenchaMark['Flutter']!
                                      .toStringAsFixed(0)
                                      .toString(),
                                  style: GoogleFonts.notoSerif(
                                    color: HexColor('#707070'),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 113,
                                top: 38,
                                child: Text(
                                  '%',
                                  style: GoogleFonts.notoSerif(
                                    color: HexColor('#707070'),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                            ]),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    'APPROVED',
                                    style: GoogleFonts.notoSerif(
                                      fontSize: 10,
                                      color: HexColor('#075A80'),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    'BENCHMARK',
                                    style: GoogleFonts.notoSerif(
                                      fontSize: 10,
                                      color: HexColor('#075A80'),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // CuprtinoTabBars Example

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
                  border:
                      Border.all(width: 2, color: MyAutoPilotStyles.appColor)),
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
                  InkWell(
                    onTap: () async {
                      await goToTaskList(_tabController.index, 0);
                    },
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.black,
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
                        padding: EdgeInsets.only(left: 20, right: 20),
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
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      goToTaskList(_tabController.index, 1);
                    },
                    child: Card(
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
                          padding: EdgeInsets.only(left: 20, right: 20),
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
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      goToTaskList(_tabController.index, 2);
                    },
                    child: Card(
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
                        padding: EdgeInsets.only(left: 20, right: 20),
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
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      goToTaskList(_tabController.index, 3);
                    },
                    child: Card(
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
                          padding: EdgeInsets.only(left: 20, right: 20),
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
                    ),
                  ),
                ]),
                // Weekly
                ListView(children: [
                  InkWell(
                    onTap: () {},
                    child: Card(
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
                        padding: EdgeInsets.only(left: 20, right: 20),
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
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Card(
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
                          padding: EdgeInsets.only(left: 20, right: 20),
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
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Card(
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
                          padding: EdgeInsets.only(left: 20, right: 20),
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
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Card(
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
                        padding: EdgeInsets.only(left: 20, right: 20),
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
                        ),
                      ),
                    ),
                  ),
                ]),

                // Monthly
                ListView(children: [
                  InkWell(
                    onTap: () {},
                    child: Card(
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
                        padding: EdgeInsets.only(left: 20, right: 20),
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
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Card(
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
                        padding: EdgeInsets.only(left: 20, right: 20),
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
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Card(
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
                        padding: EdgeInsets.only(left: 20, right: 20),
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
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Card(
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
                        padding: EdgeInsets.only(left: 20, right: 20),
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
                        ),
                      ),
                    ),
                  ),
                ]),

                // Over Due
                ListView(children: [
                  InkWell(
                    onTap: () {},
                    child: Card(
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
                        padding: EdgeInsets.only(left: 20, right: 20),
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
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Card(
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
                        padding: EdgeInsets.only(left: 20, right: 20),
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
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Card(
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
                        padding: EdgeInsets.only(left: 20, right: 20),
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
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Card(
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
                        padding: EdgeInsets.only(left: 20, right: 20),
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
                        ),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          )
        ],
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

  goToTaskList(int tabMenuSelected, int taskItemTapped) async {
    /* await Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return TaskList(
              scaffoldKey: widget.scaffoldKey,
              pageController: widget.pageController,
              myAutoPilotAppBar: widget.myAutoPilotAppBar,
              myAutoPilotBottomNavigationAppBar:
                  widget.myAutoPilotBottomNavigationAppBar,
              tabMenuSelected: tabMenuSelected,
              taskItemTapped: taskItemTapped);
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return Align(
            child: SlideTransition(
              position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                  .animate(animation),
              child: child,
            ),
          );
        },
      ),
    ); */

    setState(() {
      if (widget.pageController.hasClients)
        widget.pageController.animateToPage(1,
            duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }
}

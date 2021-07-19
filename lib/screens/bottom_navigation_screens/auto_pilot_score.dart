import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pie_chart/pie_chart.dart';

class AutoPilotScore extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController pageController;
  final AppBar myAutoPilotAppBar;
  final BottomNavigationBar myAutoPilotBottomNavigationAppBar;
  const AutoPilotScore(
      {required this.scaffoldKey,
      required this.pageController,
      required this.myAutoPilotAppBar,
      required this.myAutoPilotBottomNavigationAppBar,
      Key? key})
      : super(key: key);

  @override
  _AutoPilotScoreState createState() => _AutoPilotScoreState();
}

class _AutoPilotScoreState extends State<AutoPilotScore>
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

    _tabController = TabController(length: 3, vsync: this);

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
                    width: 65,
                    child: Tab(
                      text: 'Custom',
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Pie Chart
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

          // Header values for before showing the list.
          // This is fixed.
          SizedBox(
            height: 30,
          ),
          Divider(
            height: 0,
            thickness: 1,
            color: HexColor('#C9C9C9'),
            indent: 20,
            endIndent: 20,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  child: Text(
                    'KRA',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.notoSerif(
                      color: HexColor('#707070'),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'P',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.notoSerif(
                      color: HexColor('#707070'),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'A',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.notoSerif(
                      color: HexColor('#707070'),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    '%A',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.notoSerif(
                      color: HexColor('#707070'),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 0,
            thickness: 1,
            color: HexColor('#C9C9C9'),
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(
            height: 10,
          ),
          // Custom TabBarView
          Flexible(
            fit: FlexFit.loose,
            child: TabBarView(
              controller: _tabController,
              children: [
                // Weekly

                ListView(children: [
                  // List View values are here.
                  Container(
                    height: 80,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            'Delegation task done',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '415',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '252',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '-40%',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 0.5,
                    color: HexColor('#C9C9C9'),
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    height: 80,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            'Delegation task done on time',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '415',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '252',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '-40%',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 0.5,
                    color: HexColor('#C9C9C9'),
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    height: 80,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            'Delegation task done correctly on time',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '415',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '252',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '-40%',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 0.5,
                    color: HexColor('#C9C9C9'),
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    height: 80,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            'Repeat task done',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '415',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '252',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '-40%',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 0.5,
                    color: HexColor('#C9C9C9'),
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    height: 80,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            'Repeat task done on time',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '415',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '252',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '-40%',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 0.5,
                    color: HexColor('#C9C9C9'),
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    height: 80,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            'Support task done on time',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '415',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '252',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '-40%',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 0.5,
                    color: HexColor('#C9C9C9'),
                    indent: 20,
                    endIndent: 20,
                  ),
                ]),
                // Monthly
                ListView(children: [
                  // List View values are here.
                  Container(
                    height: 80,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            'Delegation task done',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '415',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '252',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '-40%',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 0.5,
                    color: HexColor('#C9C9C9'),
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    height: 80,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            'Delegation task done on time',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '415',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '252',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '-40%',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 0.5,
                    color: HexColor('#C9C9C9'),
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    height: 80,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            'Delegation task done correctly on time',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '415',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '252',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '-40%',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 0.5,
                    color: HexColor('#C9C9C9'),
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    height: 80,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            'Repeat task done',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '415',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '252',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '-40%',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 0.5,
                    color: HexColor('#C9C9C9'),
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    height: 80,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            'Repeat task done on time',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '415',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '252',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '-40%',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 0.5,
                    color: HexColor('#C9C9C9'),
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    height: 80,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            'Support task done on time',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '415',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '252',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '-40%',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: HexColor('#707070'),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 0.5,
                    color: HexColor('#C9C9C9'),
                    indent: 20,
                    endIndent: 20,
                  ),
                ]),

                // Custom
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
              ],
            ),
          )
        ],
      ),
    );
  }
}

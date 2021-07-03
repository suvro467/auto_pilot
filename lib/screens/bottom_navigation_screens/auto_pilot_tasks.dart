import 'package:auto_pilot/shared/globals.dart';
import 'package:auto_pilot/shared/widgets/auto_pilot_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pie_chart/pie_chart.dart';

class AutoPilotTasks extends StatefulWidget {
  const AutoPilotTasks({Key? key}) : super(key: key);

  @override
  _AutoPilotTasksState createState() => _AutoPilotTasksState();
}

class _AutoPilotTasksState extends State<AutoPilotTasks> {
  Map<String, double> tasksCompleted = {'Flutter': 90, 'Kotlin': 10};
  Map<String, double> tasksOnTime = {'Flutter': 60, 'Kotlin': 40};
  Map<String, double> approvedBenchaMark = {'Flutter': 80, 'Kotlin': 20};

  int cupertinoTabBarIValue = 0;
  int cupertinoTabBarIValueGetter() => cupertinoTabBarIValue;
  int cupertinoTabBarIIValue = 1;
  int cupertinoTabBarIIValueGetter() => cupertinoTabBarIIValue;
  int cupertinoTabBarIIIValue = 3;
  int cupertinoTabBarIIIValueGetter() => cupertinoTabBarIIIValue;
  int cupertinoTabBarIVValue = 0;
  int cupertinoTabBarIVValueGetter() => cupertinoTabBarIVValue;
  int cupertinoTabBarVValue = 0;
  int cupertinoTabBarVValueGetter() => cupertinoTabBarVValue;
  int cupertinoTabBarVIValue = 0;
  int cupertinoTabBarVIValueGetter() => cupertinoTabBarVIValue;
  int cupertinoTabBarVIIValue = 2;
  int cupertinoTabBarVIIValueGetter() => cupertinoTabBarVIIValue;
  int cupertinoTabBarVIIIValue = 2;
  int cupertinoTabBarVIIIValueGetter() => cupertinoTabBarVIIIValue;

  int totalDelegatedTasks = 11;
  int totalRepeatTasks = 12;
  int totalSupportTasks = 5;
  int totalPersonalTasks = 2;
  late Icon trailingIconDelegatedTask;
  late Icon trailingIconRepeatTask;
  late Icon trailingIconSupportTask;
  late Icon trailingIconPersonalTask;

  @override
  void initState() {
    super.initState();

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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
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

          Container(
            constraints: const BoxConstraints.expand(height: 30.0),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: CupertinoTabBar(
              Colors.white,
              Globals.appColor,
              [
                Text(
                  "Today",
                  style: GoogleFonts.notoSerif(
                    color: cupertinoTabBarIIIValue == 0
                        ? Colors.white
                        : HexColor('#707070'),
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Weekly",
                  style: GoogleFonts.notoSerif(
                    color: cupertinoTabBarIIIValue == 1
                        ? Colors.white
                        : HexColor('#707070'),
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Monthly",
                  style: GoogleFonts.notoSerif(
                    color: cupertinoTabBarIIIValue == 2
                        ? Colors.white
                        : HexColor('#707070'),
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Over Due",
                  style: GoogleFonts.notoSerif(
                    color: cupertinoTabBarIIIValue == 3
                        ? Colors.white
                        : HexColor('#707070'),
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              cupertinoTabBarIIIValueGetter,
              (int index) {
                setState(() {
                  cupertinoTabBarIIIValue = index;
                });
              },
              useShadow: false,
              //innerHorizontalPadding: 20,
              //outerHorizontalPadding: 5,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          Container(
            constraints: const BoxConstraints.expand(height: 20.0),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              //height: 200,
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  /* CustomExpansionTile(
                    title: Text('List-A'),
                    children: _getChildren(4, 'A-'),
                  ), */
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
                      key: Key('1'),
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
                      children: _getDelegatedTasks(),
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
                      key: Key('2'),
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
                      children: _getRepeatTasks(),
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
                      key: Key('3'),
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
                      children: _getSupportTasks(),
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
                      key: Key('4'),
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
                      children: _getPersonalTasks(),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _getDelegatedTasks() {
    return [
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
                      ),
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
                  'assets/images/check-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
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
                      ),
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
                  'assets/images/check-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
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
                      ),
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
                  'assets/images/check-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
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
                          decoration: TextDecoration.lineThrough),
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
                  'assets/images/x-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
        ),
      )
    ];
  }

  List<Widget> _getRepeatTasks() {
    return [
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
                      ),
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
                  'assets/images/check-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
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
                      ),
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
                  'assets/images/check-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
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
                      ),
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
                  'assets/images/check-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
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
                          decoration: TextDecoration.lineThrough),
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
                  'assets/images/x-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
        ),
      )
    ];
  }

  List<Widget> _getSupportTasks() {
    return [
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
                      ),
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
                  'assets/images/check-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
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
                      ),
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
                  'assets/images/check-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
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
                      ),
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
                  'assets/images/check-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
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
                          decoration: TextDecoration.lineThrough),
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
                  'assets/images/x-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
        ),
      )
    ];
  }

  List<Widget> _getPersonalTasks() {
    return [
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
                      ),
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
                  'assets/images/check-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
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
                      ),
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
                  'assets/images/check-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
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
                      ),
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
                  'assets/images/check-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
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
                          decoration: TextDecoration.lineThrough),
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
                  'assets/images/x-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
        ),
      )
    ];
  }
}

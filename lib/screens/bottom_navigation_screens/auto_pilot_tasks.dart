import 'package:auto_pilot/shared/globals.dart';
import 'package:auto_pilot/shared/widgets/auto_pilot_tabbar.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                                  animationDuration:
                                      Duration(milliseconds: 800),
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
                                  animationDuration:
                                      Duration(milliseconds: 800),
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
                                  animationDuration:
                                      Duration(milliseconds: 800),
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
                    "Yearly",
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
          ],
        ),
      ),
    );
  }
}

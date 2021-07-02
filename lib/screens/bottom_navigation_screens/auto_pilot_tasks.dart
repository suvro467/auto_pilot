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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Card(
                elevation: 2,
                shadowColor: Colors.white30,
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
          ],
        ),
      ),
    );
  }
}

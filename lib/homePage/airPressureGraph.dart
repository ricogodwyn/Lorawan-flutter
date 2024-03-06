import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class airPressuregraph extends StatelessWidget {
  const airPressuregraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('database')
          .orderBy('timestamp', descending: true)
          .limit(5)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          List<double> valueList = [];
          List<DateTime> timestampList = [];
          snapshot.data!.docs.forEach((element) {
            valueList.add(element.get('air_pressure').toDouble());
          });
          snapshot.data!.docs.forEach((element) {
            timestampList.add(element.get('timestamp').toDate());
          });
          timestampList = timestampList.reversed.toList();
          valueList = valueList.reversed.toList();
          return Padding(
            padding: const EdgeInsets.only(top: 18.0, right: 10),
            child: AspectRatio(
                aspectRatio: 1.50,
                child: Center(
                  child: Container(
                    width: 330.w, // Set the width
                    height: 210.h, // Set the height
                    child: LineChart(LineChartData(
                      lineTouchData: LineTouchData(
                        touchTooltipData: LineTouchTooltipData(
                          tooltipBgColor: Colors.grey.shade200,
                        ),
                        handleBuiltInTouches: true,
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, valueList[0]),
                            FlSpot(1, valueList[1]),
                            FlSpot(2, valueList[2]),
                            FlSpot(3, valueList[3]),
                            FlSpot(4, valueList[4]),
                          ],
                          isCurved: true,
                          barWidth: 4,
                          isStrokeCapRound: true,
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF576CBC).withOpacity(0.5),
                                Color(0xFF8B98B1).withOpacity(0.0)
                              ],
                              stops: [0.0, 1.0],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          color: Color(0xFF576CBC),
                        ),
                      ],
                      minY: valueList.reduce((a, b) => a < b ? a : b) - 2,
                      maxY: valueList.reduce((a, b) => a > b ? a : b) + 2,
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                          reservedSize: 30,
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            TextStyle style = TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 12.sp,
                              fontFamily: 'Satoshi-Regular',
                            );
                            if (value % 1 == 0 &&
                                value >= 0 &&
                                value <
                                    valueList.reduce((a, b) => a > b ? a : b) +
                                        1) {
                              return Text(
                                '${value.toInt()} hPa ',
                                textAlign: TextAlign.left,
                                style: style,
                              );
                            } else {
                              return Text('');
                            }
                          },
                        )),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                TextStyle style = TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                  fontFamily: 'Satoshi-Regular',
                                );
                                if (value % 1 == 0 &&
                                    value >= 0 &&
                                    value < timestampList.length) {
                                  return Text(
                                    '${timestampList[value.toInt()].hour}:${timestampList[value.toInt()].minute.toString().padLeft(2, '0')}',
                                    style: style,
                                  );
                                } else {
                                  return Text('');
                                }
                              }),
                        ),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                    )),
                  ),
                )),
          );
        } else {
          return Text('No temperature data found');
        }
      },
    );
  }
}

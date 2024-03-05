import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'containerAirPressure.dart';
import '../style.dart';
import 'container_temperature.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';

import 'airPressureGraph.dart';
import 'temp_graph.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'R720C Data',
            style: kTitleTextStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: containerTemperature(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: ContainerAirPressure(),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 18.w, top: 15.h),
                  child: Text(
                    'Temperature by Hour',
                    style: kTitleTextStyle,
                  ),
                ),
              ),
              tempgraph(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 18.w, top: 15.h),
                  child: Text(
                    'Air Pressure by Hour',
                    style: kTitleTextStyle,
                  ),
                ),
              ),
              airPressuregraph(),
            ],
          ),
        ));
  }
}

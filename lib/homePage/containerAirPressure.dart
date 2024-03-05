import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../style.dart';

class ContainerAirPressure extends StatelessWidget {
  const ContainerAirPressure({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 150.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.lightBlue[200],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 0.w, top: 3.h),
            child: Text(
              'Air Pressure (hPA)',
              style: kSubtitleTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.w, top: 10.h),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('database')
                  .orderBy('timestamp', descending: true)
                  .limit(1)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  double latestAirpressure =
                      snapshot.data!.docs.first.get('air_pressure').toDouble();
                  return Text(
                    '$latestAirpressure',
                    style: kBodyTextStyle,
                  );
                } else {
                  return Text('No air pressure data found');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

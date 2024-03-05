import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lorawan_antares/style.dart';

class containerTemperature extends StatelessWidget {
  const containerTemperature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 150.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green[200],
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
            padding: EdgeInsets.only(right: 2.w, top: 3.h),
            child: Text(
              'Temperature (°C)',
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
                    double latestTemperature =
                        snapshot.data!.docs.first.get('temperature').toDouble();
                    return Text(
                      '$latestTemperature',
                      style: kBodyTextStyle,
                    );
                  } else {
                    return Text('No temperature data found');
                  }
                },
              )),
        ],
      ),
    );
  }
}

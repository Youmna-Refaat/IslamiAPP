import 'package:flutter/material.dart';

import '../../../models/prayer_time_model.dart';
import 'prayer_time_card.dart';

class PrayerTimeList extends StatelessWidget {
  PrayerTimeList({super.key});
  final List<PrayerTimeModel> prayerTimeList = [
    PrayerTimeModel("Fajr", "5:17", "AM"),
    PrayerTimeModel("Sunrise", "6:48", "AM"),
    PrayerTimeModel("Duhr", "12:01", "PM"),
    PrayerTimeModel("Asr", "2:54", "PM"),
    PrayerTimeModel("Maghrib", "5:14", "PM"),
    PrayerTimeModel("Isha", "6:36", "PM"),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return PrayerTimeCard(prayerTimeModel: prayerTimeList[index]);
        },
        itemCount: prayerTimeList.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../core/theme/color_class.dart';
import '../../../data/models/prayer_time_model.dart';

class PrayerTimeCard extends StatelessWidget {
  final PrayerTimes prayerTimeModel;
  const PrayerTimeCard({
    super.key,
    required this.prayerTimeModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.only(right: 10),
      width: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.black],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              prayerTimeModel.name,
              style: TextStyle(
                  fontFamily: 'Janna',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white),
            ),
            Text(
              prayerTimeModel.time,
              style: TextStyle(
                  fontFamily: 'Janna',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}

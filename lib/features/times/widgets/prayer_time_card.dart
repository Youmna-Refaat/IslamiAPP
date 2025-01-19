import 'package:flutter/material.dart';

import '../../../core/theme/color_class.dart';
import '../../../models/prayer_time_model.dart';

class PrayerTimeCard extends StatelessWidget {
  final PrayerTimeModel prayerTimeModel;
  const PrayerTimeCard({
    super.key,
    required this.prayerTimeModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.black],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              prayerTimeModel.prayer,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white),
            ),
            Text(
              prayerTimeModel.time,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white),
            ),
            Text(
              prayerTimeModel.meridiem,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white),
            )
          ],
        ),
      ),
    );
  }
}

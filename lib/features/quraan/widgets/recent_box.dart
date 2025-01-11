import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/color_class.dart';
import '../../../models/recent_data.dart';

class RecentBox extends StatelessWidget {
  final RecentData recentData;

  const RecentBox({
    super.key,
    required this.recentData,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  recentData.suraNameEN,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
                Text(
                  recentData.suraNameAR,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
                Text(
                  recentData.suraVerses,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
              ],
            ),
            Image.asset(AppAssets.quraanImg),
          ],
        ),
      ),
    );
  }
}

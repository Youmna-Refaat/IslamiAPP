import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/color_class.dart';
import '../../../data/models/sura_data.dart';

class RecentBox extends StatelessWidget {
  final SuraData suraData;

  const RecentBox({
    super.key,
    required this.suraData,
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
                  suraData.suraNameEN,
                  style: TextStyle(
                      fontFamily: 'Janna',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
                Text(
                  suraData.suraNameAR,
                  style: TextStyle(
                      fontFamily: 'Janna',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
                Text(
                  suraData.suraVerses,
                  style: TextStyle(
                      fontFamily: 'Janna',
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

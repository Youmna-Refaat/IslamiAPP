import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/color_class.dart';
import '../../../models/sura_data.dart';

class SuraCard extends StatelessWidget {
  final SuraData suraData;
  const SuraCard({
    super.key,
    required this.suraData,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.suraNumberIcn),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    suraData.suraID.toString(),
                    style: TextStyle(
                        fontFamily: 'Janna',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  suraData.suraNameEN,
                  style: TextStyle(
                    fontFamily: 'Janna',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  suraData.suraVerses,
                  style: TextStyle(
                    fontFamily: 'Janna',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              suraData.suraNameAR,
              style: TextStyle(
                fontFamily: 'Janna',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

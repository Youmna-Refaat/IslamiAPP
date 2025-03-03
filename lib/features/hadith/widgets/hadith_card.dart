import 'package:flutter/material.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/theme/color_class.dart';
import '../../../data/models/hadith_data.dart';

class HadithCard extends StatelessWidget {
  final HadithData hadithData;
  const HadithCard({super.key, required this.hadithData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage(AppAssets.hadithCardBG), fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            hadithData.hadithTitle,
            style: TextStyle(
              fontFamily: 'Janna',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  textAlign: TextAlign.center,
                  hadithData.hadithContent,
                  style: TextStyle(
                    fontFamily: 'Janna',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/constants/app_assets.dart';
import '../../core/theme/color_class.dart';
import 'widgets/azkar_card.dart';
import 'widgets/prayer_time_list.dart';

class TimesLayout extends StatelessWidget {
  static String routeName = "Times Layout";

  const TimesLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.timesBG),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Image.asset(AppAssets.logoBG),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.33,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppAssets.timesBoxBG),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "16 Jul,\n2024",
                            style: TextStyle(
                              fontFamily: 'Janna',
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            "Pray Time\n Tuesday",
                            style: TextStyle(
                              fontFamily: 'Janna',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            "09 Muh,\n 1446",
                            style: TextStyle(
                              fontFamily: 'Janna',
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    PrayerTimeList(),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Next Pray - 02:32',
                          style: TextStyle(
                              fontFamily: 'Janna',
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.volume_off,
                            ))
                      ],
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Azkar",
                style: TextStyle(
                  fontFamily: 'Janna',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.titleTextColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AzkarCard(
                      image: AppAssets.eveningAzkarImg, title: "Evening Azkar"),
                  AzkarCard(
                      image: AppAssets.morningAzkarImg, title: "Morning Azkar")
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AzkarCard(
                      image: AppAssets.wakingAzkarImg, title: "Waking Azkar"),
                  AzkarCard(
                      image: AppAssets.sleepingAzkarImg,
                      title: "Sleeping Azkar")
                ],
              ),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}

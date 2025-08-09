import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/color_class.dart';

class SebhaLayout extends StatefulWidget {
  static String routeName = "Sebha Layout";

  const SebhaLayout({super.key});

  @override
  State<SebhaLayout> createState() => _SebhaLayoutState();
}

class _SebhaLayoutState extends State<SebhaLayout> {
  int counter = 0;
  double rotationAngle = 0;
  int currentIndex = 0;
  List<String> sebha = ["سبحان الله", "الحمد لله", "لا اله الا الله"];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.sibhaBG),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Image.asset(AppAssets.logoBG),
            ),
            Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
              style: TextStyle(
                fontFamily: 'Janna',
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.15,
              ),
              child: Image.asset(
                AppAssets.sebhaHead,
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.11,
              ),
              child: GestureDetector(
                onTap: () => onPressed(),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: rotationAngle * 3.14 / 180,
                      child: Image.asset(
                        AppAssets.sebhaBody,
                        width: MediaQuery.of(context).size.width * 0.74,
                        height: MediaQuery.of(context).size.height * 0.35,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          sebha[currentIndex],
                          style: TextStyle(
                            fontFamily: 'Janna',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        GestureDetector(
                          onDoubleTap: () {
                            setState(() {});
                            rotationAngle = 0;
                            counter = 0;
                          },
                          child: Text(
                            textAlign: TextAlign.center,
                            "$counter",
                            style: TextStyle(
                              fontFamily: 'Janna',
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onPressed() {
    counter++;
    rotationAngle += 5;
    if (counter == 33) {
      counter = 0;
      rotationAngle = 0;
      currentIndex++;
      if (currentIndex == sebha.length) {
        currentIndex = 0;
      }
    }
    setState(() {});
  }
}

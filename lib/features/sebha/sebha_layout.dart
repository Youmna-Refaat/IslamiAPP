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

  void onPressed() {
    setState(() {
      counter++;
      rotationAngle += 12;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.sibhaBG),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Image.asset(AppAssets.logoBG),
          ),
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: rotationAngle * 3.14159 / 180,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              AppAssets.sebhaBody,
                            ),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 4,
                    ),
                    GestureDetector(
                      onTap: () => onPressed(),
                      child: Text(
                        textAlign: TextAlign.center,
                        "سبحان الله",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
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
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

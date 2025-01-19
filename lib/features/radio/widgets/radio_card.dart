import 'package:flutter/material.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/theme/color_class.dart';

class RadioCard extends StatelessWidget {
  final int index;
  final String title;
  const RadioCard({super.key, required this.index, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: index == 1
              ? DecorationImage(
                  image: AssetImage(AppAssets.radioCardPlayedBG),
                  fit: BoxFit.fill)
              : DecorationImage(
                  image: AssetImage(AppAssets.radioCardUnplayedBG),
                  fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                textAlign: TextAlign.center,
                title,
                style: TextStyle(
                    fontFamily: 'Janna',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      index == 1 ? Icons.pause : Icons.play_arrow,
                      color: AppColors.black,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.volume_up,
                      color: AppColors.black,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

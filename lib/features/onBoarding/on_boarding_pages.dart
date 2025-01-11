import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/color_class.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String? subtitle;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Image.asset(AppAssets.logoBG),
        ),
        Expanded(
          child: Image.asset(image, fit: BoxFit.contain),
        ),
        Text(
          title,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              subtitle!,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}

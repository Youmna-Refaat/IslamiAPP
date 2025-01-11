import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';

class TimesLayout extends StatelessWidget {
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
    );
  }
}

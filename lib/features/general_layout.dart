import 'package:flutter/material.dart';

import '../core/constants/app_assets.dart';
import '../core/theme/color_class.dart';
import '../widgets/custom_nav_bar_item.dart';
import 'hadith/hadith_layout.dart';
import 'quraan/quraan_layout.dart';
import 'radio/radio_layout.dart';
import 'sebha/sebha_layout.dart';
import 'times/times_layout.dart';

class GeneralLayout extends StatefulWidget {
  static String routeName = "/quraan";
  const GeneralLayout({super.key});

  @override
  State<GeneralLayout> createState() => _GeneralLayoutState();
}

class _GeneralLayoutState extends State<GeneralLayout> {
  int selectedIndex = 0;
  List<Widget> layouts = [
    QuraanLayout(),
    HadithLayout(),
    SebhaLayout(),
    RadioLayout(),
    TimesLayout(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: layouts[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: AppColors.white,
        backgroundColor: AppColors.primaryColor,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: (int index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
              selectedIndex: selectedIndex,
              navBarItem: 0,
              iconPath: AppAssets.quraanIcn,
            ),
            label: "Quraan",
          ),
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
                selectedIndex: selectedIndex,
                navBarItem: 1,
                iconPath: AppAssets.hadithIcn),
            label: "Hadith",
          ),
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
                selectedIndex: selectedIndex,
                navBarItem: 2,
                iconPath: AppAssets.sibhaIcn),
            label: "Sibha",
          ),
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
                selectedIndex: selectedIndex,
                navBarItem: 3,
                iconPath: AppAssets.radioIcn),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
                selectedIndex: selectedIndex,
                navBarItem: 4,
                iconPath: AppAssets.timesIcn),
            label: "Times",
          ),
        ],
      ),
    );
  }
}

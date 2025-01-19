import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/color_class.dart';
import '../quraan/quraan_layout.dart';
import 'on_boarding_pages.dart';

class OnboardingLayout extends StatefulWidget {
  static String routeName = "OnBoarding Layout";

  const OnboardingLayout({super.key});

  @override
  _OnboardingLayoutState createState() => _OnboardingLayoutState();
}

class _OnboardingLayoutState extends State<OnboardingLayout> {
  final PageController pageController = PageController();
  int currentPage = 0;

  final List<Widget> onBoardingPages = [
    OnboardingPage(
      image: AppAssets.onBoardingWelcomeImg,
      title: "Welcome To Islami App",
    ),
    OnboardingPage(
      image: AppAssets.onBoardingIslamiImg,
      title: "Welcome To Islami",
      subtitle: "We Are Very Excited To Have You In Our Community",
    ),
    OnboardingPage(
      image: AppAssets.onBoardingQuraanImg,
      title: "Reading the Quran",
      subtitle: "Read, and your Lord is the Most Generous",
    ),
    OnboardingPage(
      image: AppAssets.onBoardingBearishImg,
      title: "Bearish",
      subtitle: "Praise the name of your Lord, the Most High",
    ),
    OnboardingPage(
      image: AppAssets.onBoardingRadioImg,
      title: "Holy Quran Radio",
      subtitle:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemCount: onBoardingPages.length,
              itemBuilder: (context, index) {
                return onBoardingPages[index];
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onBoardingPages.length,
              (index) => buildIndicator(index),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentPage > 0)
                  TextButton(
                    onPressed: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                          fontFamily: 'Janna',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor),
                    ),
                  ),
                if (currentPage < onBoardingPages.length - 1)
                  TextButton(
                    onPressed: () {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontFamily: 'Janna',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                if (currentPage == onBoardingPages.length - 1)
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, QuraanLayout.routeName);
                    },
                    child: Text(
                      'Finish',
                      style: TextStyle(
                        fontFamily: 'Janna',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildIndicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: currentPage == index ? 18 : 7,
      decoration: BoxDecoration(
        color: currentPage == index ? AppColors.primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

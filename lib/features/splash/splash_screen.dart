import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animate_do/animate_do.dart';

import '../../core/constants/app_assets.dart';
import '../general_layout.dart';
import '../onBoarding/on_boarding_layout.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "splash";
  static final Duration _duration = Duration(milliseconds: 1750);
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstRun = prefs.getBool('isFirstRun');

    await Future.delayed(const Duration(seconds: 2));

    if (isFirstRun == null || isFirstRun) {
      await prefs.setBool('isFirstRun', false);
      Navigator.pushReplacementNamed(context, OnboardingLayout.routeName);
    } else {
      Navigator.pushReplacementNamed(context, GeneralLayout.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.splashBG), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FadeInLeft(
                  duration: SplashScreen._duration,
                  child: Image.asset(
                    AppAssets.splashImageLeft,
                    height: 187,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.25),
              child: Align(
                alignment: Alignment.centerRight,
                child: FadeInRight(
                  duration: SplashScreen._duration,
                  child: Image.asset(
                    AppAssets.splashImageRight,
                    height: 187,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ZoomIn(
                duration: SplashScreen._duration,
                child: Image.asset(
                  AppAssets.logo,
                  height: 200,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.60),
              child: Align(
                alignment: Alignment.topRight,
                child: FadeInDown(
                  duration: SplashScreen._duration,
                  child: Image.asset(
                    AppAssets.glowImg,
                    height: 300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'core/services/local_storage_service.dart';
import 'features/general_layout.dart';
import 'features/hadith/hadith_details.dart';
import 'features/onBoarding/on_boarding_layout.dart';
import 'features/quraan/quraan_layout.dart';
import 'features/quraan/sura_details.dart';
import 'features/radio/radio_layout.dart';
import 'features/sebha/sebha_layout.dart';
import 'features/splash/splash_screen.dart';
import 'features/times/times_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();
  runApp(
      DevicePreview(enabled: false, builder: (context) => const IslamiApp()));
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) {
          return SplashScreen();
        },
        GeneralLayout.routeName: (context) {
          return GeneralLayout();
        },
        QuraanLayout.routeName: (context) {
          return QuraanLayout();
        },
        SuraDetailsScreen.routeName: (context) {
          return SuraDetailsScreen();
        },
        SebhaLayout.routeName: (context) {
          return SebhaLayout();
        },
        OnboardingLayout.routeName: (context) {
          return OnboardingLayout();
        },
        HadithDetailsScreen.routeName: (context) {
          return HadithDetailsScreen();
        },
        RadioLayout.routeName: (context) {
          return RadioLayout();
        },
        TimesLayout.routeName: (context) {
          return TimesLayout();
        }
      },
    );
  }
}

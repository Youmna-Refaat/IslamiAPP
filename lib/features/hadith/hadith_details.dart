import 'package:flutter/material.dart';
import '../../core/constants/app_assets.dart';
import '../../core/theme/color_class.dart';
import '../../data/models/hadith_data.dart';

class HadithDetailsScreen extends StatefulWidget {
  static String routeName = "Hadith Details";

  const HadithDetailsScreen({
    super.key,
  });

  @override
  State<HadithDetailsScreen> createState() => _HadithDetailsScreenState();
}

class _HadithDetailsScreenState extends State<HadithDetailsScreen> {
  List<String> hadithList = [];

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments as Map;
    var hadithData = arguments['hadithData'] as HadithData;
    var index = arguments['index'] as int;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Hadith ${index + 1}",
            style: TextStyle(
                fontFamily: 'Janna',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor),
          ),
          backgroundColor: AppColors.black,
          elevation: 0,
          scrolledUnderElevation: 0,
          iconTheme: IconThemeData(
            color: AppColors.primaryColor,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.detailsShapeLeft,
                    height: 92,
                  ),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      hadithData.hadithTitle,
                      style: TextStyle(
                          fontFamily: 'Janna',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor),
                    ),
                  ),
                  Image.asset(
                    AppAssets.detailsShapeRight,
                    height: 92,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    textAlign: TextAlign.center,
                    hadithData.hadithContent,
                    style: TextStyle(
                        fontFamily: 'Janna',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                ),
                itemCount: 1,
              ),
            ),
            Image.asset(AppAssets.detailsShapeBottom),
          ],
        ),
      ),
    );
  }
}

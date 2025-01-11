import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_4/models/hadith_data.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/color_class.dart';

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
    //var arguments = ModalRoute.of(context)?.settings.arguments as HadithData;
    var arguments = ModalRoute.of(context)?.settings.arguments as Map;
    var hadithData = arguments['hadithData'] as HadithData;
    var index = arguments['index'] as int;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Hadith ${index + 1}",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor),
        ),
        backgroundColor: Colors.transparent,
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
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  textAlign: TextAlign.center,
                  hadithData.hadithContent,
                  style: TextStyle(
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
    );
  }
}

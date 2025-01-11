import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/color_class.dart';
import '../../models/sura_data.dart';

class SuraDetailsScreen extends StatefulWidget {
  static String routeName = "Sura Details";

  const SuraDetailsScreen({
    super.key,
  });

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> versesList = [];

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments as SuraData;
    if (versesList.isEmpty) loadSuraData(arguments.suraID);
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          arguments.suraNameEN,
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
                    arguments.suraNameAR,
                    style: TextStyle(
                        fontSize: 24,
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
                  "${versesList[index]} \n [${index + 1}]", // the number on next line just to be more organized
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
              ),
              itemCount: versesList.length,
            ),
          ),
          //Spacer(),
          Image.asset(AppAssets.detailsShapeBottom),
        ],
      ),
    );
  }

  loadSuraData(int suraID) async {
    String suraAyat =
        await rootBundle.loadString("assets/files/Suras/$suraID.txt");
    setState(() {});
    versesList = suraAyat.split("\n");
  }
}

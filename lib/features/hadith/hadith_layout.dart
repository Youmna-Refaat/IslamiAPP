import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants/app_assets.dart';
import '../../data/models/hadith_data.dart';
import 'hadith_details.dart';
import 'widgets/hadith_card.dart';

class HadithLayout extends StatefulWidget {
  const HadithLayout({super.key});

  @override
  State<HadithLayout> createState() => _HadithLayoutState();
}

class _HadithLayoutState extends State<HadithLayout> {
  List<HadithData> hadithDataList = [];

  @override
  Widget build(BuildContext context) {
    if (hadithDataList.isEmpty) loadHadithData();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.hadithBG),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.1, vertical: height * 0.02),
              // padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Image.asset(AppAssets.logoBG),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: LayoutBuilder(builder: (context, constraints) {
                // double viewportFraction = width < 400 ? 0.8 : 0.68;

                return CarouselSlider(
                    items: hadithDataList.map((e) {
                      return GestureDetector(
                        onDoubleTap: () => Navigator.pushNamed(
                          context,
                          HadithDetailsScreen.routeName,
                          arguments: {
                            'hadithData': e,
                            'index': hadithDataList.indexOf(e),
                          },
                        ),
                        child: HadithCard(
                          hadithData: e,
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      aspectRatio: 0.95,
                      viewportFraction: width < 400 ? 0.68 : 0.71,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ));
              }),
            ),
          ],
        ),
      ),
    );
  }

  loadHadithData() async {
    for (int i = 1; i <= 50; i++) {
      String hadithContent =
          await rootBundle.loadString("assets/files/Hadeeth/h$i.txt");
      List<String> allHadithList = hadithContent.split("#");
      for (var element in allHadithList) {
        int hadithTitleLetters = element.indexOf("\n");
        String hadithTitle = element.substring(0, hadithTitleLetters);
        String hadithContent = element.substring(hadithTitleLetters + 1);
        var hadithData =
            HadithData(hadithTitle: hadithTitle, hadithContent: hadithContent);
        hadithDataList.add(hadithData);
      }
    }
    setState(() {});
  }
}

import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/local_storage_key.dart';
import '../../core/services/local_storage_service.dart';
import '../../core/theme/color_class.dart';
import '../../models/sura_data.dart';
import 'sura_details.dart';
import 'widgets/recent_box.dart';
import 'widgets/sura_card.dart';

class QuraanLayout extends StatefulWidget {
  static String routeName = "Quraan Layout";
  QuraanLayout({super.key});

  @override
  State<QuraanLayout> createState() => _QuraanLayoutState();
}

class _QuraanLayoutState extends State<QuraanLayout> {
  @override
  void initState() {
    super.initState();
    _loadRecenetSura();
  }

  String searchQuery = "";
  List<String> recentSuraIndexList = [];
  List<SuraData> recentSuraList = [];
  List<SuraData> searchSuraList = [];

  final List<SuraData> suraDataList = [
    SuraData(
        suraID: 1,
        suraNameAR: "الفاتحه",
        suraNameEN: "Al-Fatiha",
        suraVerses: "7 verses"),
    SuraData(
        suraID: 2,
        suraNameAR: "البقرة",
        suraNameEN: "Al-Baqarah",
        suraVerses: "286 verses"),
    SuraData(
        suraID: 3,
        suraNameAR: "آل عمران",
        suraNameEN: "Aal-E-Imran",
        suraVerses: "200 verses"),
    SuraData(
        suraID: 4,
        suraNameAR: "النساء",
        suraNameEN: "An-Nisa'",
        suraVerses: "176 verses"),
    SuraData(
        suraID: 5,
        suraNameAR: "المائدة",
        suraNameEN: "Al-Ma'idah",
        suraVerses: "120 verses"),
    SuraData(
        suraID: 6,
        suraNameAR: "الأنعام",
        suraNameEN: "Al-An'am",
        suraVerses: "165 verses"),
    SuraData(
        suraID: 7,
        suraNameAR: "الأعراف",
        suraNameEN: "Al-A'raf",
        suraVerses: "206 verses"),
    SuraData(
        suraID: 8,
        suraNameAR: "الأنفال",
        suraNameEN: "Al-Anfal",
        suraVerses: "75 verses"),
    SuraData(
        suraID: 9,
        suraNameAR: "التوبة",
        suraNameEN: "At-Tawbah",
        suraVerses: "129 verses"),
    SuraData(
        suraID: 10,
        suraNameAR: "يونس",
        suraNameEN: "Yunus",
        suraVerses: "109 verses"),
    SuraData(
        suraID: 11,
        suraNameAR: "هود",
        suraNameEN: "Hud",
        suraVerses: "123 verses"),
    SuraData(
        suraID: 12,
        suraNameAR: "يوسف",
        suraNameEN: "Yusuf",
        suraVerses: "111 verses"),
    SuraData(
        suraID: 13,
        suraNameAR: "الرعد",
        suraNameEN: "Ar-Ra'd",
        suraVerses: "43 verses"),
    SuraData(
        suraID: 14,
        suraNameAR: "إبراهيم",
        suraNameEN: "Ibrahim",
        suraVerses: "52 verses"),
    SuraData(
        suraID: 15,
        suraNameAR: "الحجر",
        suraNameEN: "Al-Hijr",
        suraVerses: "99 verses"),
    SuraData(
        suraID: 16,
        suraNameAR: "النحل",
        suraNameEN: "An-Nahl",
        suraVerses: "128 verses"),
    SuraData(
        suraID: 17,
        suraNameAR: "الإسراء",
        suraNameEN: "Al-Isra",
        suraVerses: "111 verses"),
    SuraData(
        suraID: 18,
        suraNameAR: "الكهف",
        suraNameEN: "Al-Kahf",
        suraVerses: "110 verses"),
    SuraData(
        suraID: 19,
        suraNameAR: "مريم",
        suraNameEN: "Maryam",
        suraVerses: "98 verses"),
    SuraData(
        suraID: 20,
        suraNameAR: "طه",
        suraNameEN: "Ta-Ha",
        suraVerses: "135 verses"),
    SuraData(
        suraID: 21,
        suraNameAR: "الأنبياء",
        suraNameEN: "Al-Anbiya",
        suraVerses: "112 verses"),
    SuraData(
        suraID: 22,
        suraNameAR: "الحج",
        suraNameEN: "Al-Hajj",
        suraVerses: "78 verses"),
    SuraData(
        suraID: 23,
        suraNameAR: "المؤمنون",
        suraNameEN: "Al-Mu'minun",
        suraVerses: "118 verses"),
    SuraData(
        suraID: 24,
        suraNameAR: "النّور",
        suraNameEN: "An-Nur",
        suraVerses: "64 verses"),
    SuraData(
        suraID: 25,
        suraNameAR: "الفرقان",
        suraNameEN: "Al-Furqan",
        suraVerses: "77 verses"),
    SuraData(
        suraID: 26,
        suraNameAR: "الشعراء",
        suraNameEN: "Ash-Shu'ara",
        suraVerses: "227 verses"),
    SuraData(
        suraID: 27,
        suraNameAR: "النّمل",
        suraNameEN: "An-Naml",
        suraVerses: "93 verses"),
    SuraData(
        suraID: 28,
        suraNameAR: "القصص",
        suraNameEN: "Al-Qasas",
        suraVerses: "88 verses"),
    SuraData(
        suraID: 29,
        suraNameAR: "العنكبوت",
        suraNameEN: "Al-Ankabut",
        suraVerses: "69 verses"),
    SuraData(
        suraID: 30,
        suraNameAR: "الرّوم",
        suraNameEN: "Ar-Rum",
        suraVerses: "60 verses"),
    SuraData(
        suraID: 31,
        suraNameAR: "لقمان",
        suraNameEN: "Luqman",
        suraVerses: "34 verses"),
    SuraData(
        suraID: 32,
        suraNameAR: "السجدة",
        suraNameEN: "As-Sajda",
        suraVerses: "30 verses"),
    SuraData(
        suraID: 33,
        suraNameAR: "الأحزاب",
        suraNameEN: "Al-Ahzab",
        suraVerses: "73 verses"),
    SuraData(
        suraID: 34,
        suraNameAR: "سبأ",
        suraNameEN: "Saba",
        suraVerses: "54 verses"),
    SuraData(
        suraID: 35,
        suraNameAR: "فاطر",
        suraNameEN: "Fatir",
        suraVerses: "45 verses"),
    SuraData(
        suraID: 36,
        suraNameAR: "يس",
        suraNameEN: "Ya-Sin",
        suraVerses: "83 verses"),
    SuraData(
        suraID: 37,
        suraNameAR: "الصافات",
        suraNameEN: "As-Saffat",
        suraVerses: "182 verses"),
    SuraData(
        suraID: 38,
        suraNameAR: "ص",
        suraNameEN: "Sad",
        suraVerses: "88 verses"),
    SuraData(
        suraID: 39,
        suraNameAR: "الزمر",
        suraNameEN: "Az-Zumar",
        suraVerses: "75 verses"),
    SuraData(
        suraID: 40,
        suraNameAR: "غافر",
        suraNameEN: "Ghafir",
        suraVerses: "85 verses"),
    SuraData(
        suraID: 41,
        suraNameAR: "فصّلت",
        suraNameEN: "Fussilat",
        suraVerses: "54 verses"),
    SuraData(
        suraID: 42,
        suraNameAR: "الشورى",
        suraNameEN: "Ash-Shura",
        suraVerses: "53 verses"),
    SuraData(
        suraID: 43,
        suraNameAR: "الزخرف",
        suraNameEN: "Az-Zukhruf",
        suraVerses: "89 verses"),
    SuraData(
        suraID: 44,
        suraNameAR: "الدّخان",
        suraNameEN: "Ad-Dukhan",
        suraVerses: "59 verses"),
    SuraData(
        suraID: 45,
        suraNameAR: "الجاثية",
        suraNameEN: "Al-Jathiya",
        suraVerses: "37 verses"),
    SuraData(
        suraID: 46,
        suraNameAR: "الأحقاف",
        suraNameEN: "Al-Ahqaf",
        suraVerses: "35 verses"),
    SuraData(
        suraID: 47,
        suraNameAR: "محمد",
        suraNameEN: "Muhammad",
        suraVerses: "38 verses"),
    SuraData(
        suraID: 48,
        suraNameAR: "الفتح",
        suraNameEN: "Al-Fath",
        suraVerses: "29 verses"),
    SuraData(
        suraID: 49,
        suraNameAR: "الحجرات",
        suraNameEN: "Al-Hujurat",
        suraVerses: "18 verses"),
    SuraData(
        suraID: 50,
        suraNameAR: "ق",
        suraNameEN: "Qaf",
        suraVerses: "45 verses"),
    SuraData(
        suraID: 51,
        suraNameAR: "الذاريات",
        suraNameEN: "Adh-Dhariyat",
        suraVerses: "60 verses"),
    SuraData(
        suraID: 52,
        suraNameAR: "الطور",
        suraNameEN: "At-Tur",
        suraVerses: "49 verses"),
    SuraData(
        suraID: 53,
        suraNameAR: "النجم",
        suraNameEN: "An-Najm",
        suraVerses: "62 verses"),
    SuraData(
        suraID: 54,
        suraNameAR: "القمر",
        suraNameEN: "Al-Qamar",
        suraVerses: "55 verses"),
    SuraData(
        suraID: 55,
        suraNameAR: "الرحمن",
        suraNameEN: "Ar-Rahman",
        suraVerses: "78 verses"),
    SuraData(
        suraID: 56,
        suraNameAR: "الواقعة",
        suraNameEN: "Al-Waqia",
        suraVerses: "96 verses"),
    SuraData(
        suraID: 57,
        suraNameAR: "الحديد",
        suraNameEN: "Al-Hadid",
        suraVerses: "29 verses"),
    SuraData(
        suraID: 58,
        suraNameAR: "المجادلة",
        suraNameEN: "Al-Mujadila",
        suraVerses: "22 verses"),
    SuraData(
        suraID: 59,
        suraNameAR: "الحشر",
        suraNameEN: "Al-Hashr",
        suraVerses: "24 verses"),
    SuraData(
        suraID: 60,
        suraNameAR: "الممتحنة",
        suraNameEN: "Al-Mumtahina",
        suraVerses: "13 verses"),
    SuraData(
        suraID: 61,
        suraNameAR: "الصف",
        suraNameEN: "As-Saff",
        suraVerses: "14 verses"),
    SuraData(
        suraID: 62,
        suraNameAR: "الجمعة",
        suraNameEN: "Al-Jumu'a",
        suraVerses: "11 verses"),
    SuraData(
        suraID: 63,
        suraNameAR: "المنافقون",
        suraNameEN: "Al-Munafiqun",
        suraVerses: "11 verses"),
    SuraData(
        suraID: 64,
        suraNameAR: "التغابن",
        suraNameEN: "At-Taghabun",
        suraVerses: "18 verses"),
    SuraData(
        suraID: 65,
        suraNameAR: "الطلاق",
        suraNameEN: "At-Talaq",
        suraVerses: "12 verses"),
    SuraData(
        suraID: 66,
        suraNameAR: "التحريم",
        suraNameEN: "At-Tahrim",
        suraVerses: "12 verses"),
    SuraData(
        suraID: 67,
        suraNameAR: "الملك",
        suraNameEN: "Al-Mulk",
        suraVerses: "30 verses"),
    SuraData(
        suraID: 68,
        suraNameAR: "القلم",
        suraNameEN: "Al-Qalam",
        suraVerses: "52 verses"),
    SuraData(
        suraID: 69,
        suraNameAR: "الحاقة",
        suraNameEN: "Al-Haaqqa",
        suraVerses: "52 verses"),
    SuraData(
        suraID: 70,
        suraNameAR: "المعارج",
        suraNameEN: "Al-Ma'arij",
        suraVerses: "44 verses"),
    SuraData(
        suraID: 71,
        suraNameAR: "نوح",
        suraNameEN: "Nuh",
        suraVerses: "28 verses"),
    SuraData(
        suraID: 72,
        suraNameAR: "الجن",
        suraNameEN: "Al-Jinn",
        suraVerses: "28 verses"),
    SuraData(
        suraID: 73,
        suraNameAR: "المزمل",
        suraNameEN: "Al-Muzzammil",
        suraVerses: "20 verses"),
    SuraData(
        suraID: 74,
        suraNameAR: "المدثر",
        suraNameEN: "Al-Muddathir",
        suraVerses: "56 verses"),
    SuraData(
        suraID: 75,
        suraNameAR: "القيامة",
        suraNameEN: "Al-Qiyama",
        suraVerses: "40 verses"),
    SuraData(
        suraID: 76,
        suraNameAR: "الإنسان",
        suraNameEN: "Al-Insan",
        suraVerses: "31 verses"),
    SuraData(
        suraID: 77,
        suraNameAR: "المرسلات",
        suraNameEN: "Al-Mursalat",
        suraVerses: "50 verses"),
    SuraData(
        suraID: 78,
        suraNameAR: "النبأ",
        suraNameEN: "An-Naba",
        suraVerses: "40 verses"),
    SuraData(
        suraID: 79,
        suraNameAR: "النازعات",
        suraNameEN: "An-Nazi'at",
        suraVerses: "46 verses"),
    SuraData(
        suraID: 80,
        suraNameAR: "عبس",
        suraNameEN: "Abasa",
        suraVerses: "42 verses"),
    SuraData(
        suraID: 81,
        suraNameAR: "التكوير",
        suraNameEN: "At-Takwir",
        suraVerses: "29 verses"),
    SuraData(
        suraID: 82,
        suraNameAR: "الإنفطار",
        suraNameEN: "Al-Infitar",
        suraVerses: "19 verses"),
    SuraData(
        suraID: 83,
        suraNameAR: "المطففين",
        suraNameEN: "Al-Mutaffifin",
        suraVerses: "36 verses"),
    SuraData(
        suraID: 84,
        suraNameAR: "الإنشقاق",
        suraNameEN: "Al-Inshiqaq",
        suraVerses: "25 verses"),
    SuraData(
        suraID: 85,
        suraNameAR: "البروج",
        suraNameEN: "Al-Buruj",
        suraVerses: "22 verses"),
    SuraData(
        suraID: 86,
        suraNameAR: "الطارق",
        suraNameEN: "At-Tariq",
        suraVerses: "17 verses"),
    SuraData(
        suraID: 87,
        suraNameAR: "الأعلى",
        suraNameEN: "Al-Ala",
        suraVerses: "19 verses"),
    SuraData(
        suraID: 88,
        suraNameAR: "الغاشية",
        suraNameEN: "Al-Ghashiya",
        suraVerses: "26 verses"),
    SuraData(
        suraID: 89,
        suraNameAR: "الفجر",
        suraNameEN: "Al-Fajr",
        suraVerses: "30 verses"),
    SuraData(
        suraID: 90,
        suraNameAR: "البلد",
        suraNameEN: "Al-Balad",
        suraVerses: "20 verses"),
    SuraData(
        suraID: 91,
        suraNameAR: "الشمس",
        suraNameEN: "Ash-Shams",
        suraVerses: "15 verses"),
    SuraData(
        suraID: 92,
        suraNameAR: "الليل",
        suraNameEN: "Al-Lail",
        suraVerses: "21 verses"),
    SuraData(
        suraID: 93,
        suraNameAR: "الضحى",
        suraNameEN: "Ad-Duha",
        suraVerses: "11 verses"),
    SuraData(
        suraID: 94,
        suraNameAR: "الشرح",
        suraNameEN: "Ash-Sharh",
        suraVerses: "8 verses"),
    SuraData(
        suraID: 95,
        suraNameAR: "التين",
        suraNameEN: "At-Tin",
        suraVerses: "8 verses"),
    SuraData(
        suraID: 96,
        suraNameAR: "العلق",
        suraNameEN: "Al-Alaq",
        suraVerses: "19 verses"),
    SuraData(
        suraID: 97,
        suraNameAR: "القدر",
        suraNameEN: "Al-Qadr",
        suraVerses: "5 verses"),
    SuraData(
        suraID: 98,
        suraNameAR: "البينة",
        suraNameEN: "Al-Bayyina",
        suraVerses: "8 verses"),
    SuraData(
        suraID: 99,
        suraNameAR: "الزلزلة",
        suraNameEN: "Az-Zalzala",
        suraVerses: "8 verses"),
    SuraData(
        suraID: 100,
        suraNameAR: "العاديات",
        suraNameEN: "Al-Adiyat",
        suraVerses: "11 verses"),
    SuraData(
        suraID: 101,
        suraNameAR: "القارعة",
        suraNameEN: "Al-Qaria",
        suraVerses: "11 verses"),
    SuraData(
        suraID: 102,
        suraNameAR: "التكاثر",
        suraNameEN: "At-Takathur",
        suraVerses: "8 verses"),
    SuraData(
        suraID: 103,
        suraNameAR: "العصر",
        suraNameEN: "Al-Asr",
        suraVerses: "3 verses"),
    SuraData(
        suraID: 104,
        suraNameAR: "الهمزة",
        suraNameEN: "Al-Humaza",
        suraVerses: "9 verses"),
    SuraData(
        suraID: 105,
        suraNameAR: "الفيل",
        suraNameEN: "Al-Fil",
        suraVerses: "5 verses"),
    SuraData(
        suraID: 106,
        suraNameAR: "قريش",
        suraNameEN: "Quraish",
        suraVerses: "4 verses"),
    SuraData(
        suraID: 107,
        suraNameAR: "الماعون",
        suraNameEN: "Al-Ma'un",
        suraVerses: "7 verses"),
    SuraData(
        suraID: 108,
        suraNameAR: "الكوثر",
        suraNameEN: "Al-Kawthar",
        suraVerses: "3 verses"),
    SuraData(
        suraID: 109,
        suraNameAR: "الكافرون",
        suraNameEN: "Al-Kafiroon",
        suraVerses: "6 verses"),
    SuraData(
        suraID: 110,
        suraNameAR: "النصر",
        suraNameEN: "An-Nasr",
        suraVerses: "3 verses"),
    SuraData(
        suraID: 111,
        suraNameAR: "المسد",
        suraNameEN: "Al-Masad",
        suraVerses: "5 verses"),
    SuraData(
        suraID: 112,
        suraNameAR: "الإخلاص",
        suraNameEN: "Al-Ikhlas",
        suraVerses: "4 verses"),
    SuraData(
        suraID: 113,
        suraNameAR: "الفلق",
        suraNameEN: "Al-Falaq",
        suraVerses: "5 verses"),
    SuraData(
        suraID: 114,
        suraNameAR: "الناس",
        suraNameEN: "An-Nas",
        suraVerses: "6 verses"),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.quraanBG), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Image.asset(AppAssets.logoBG),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onChanged: (value) {
                    searchQuery = value;
                    search();
                    setState(() {});
                  },
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.titleTextColor,
                  ),
                  cursorColor: AppColors.primaryColor,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.secondaryColor.withValues(alpha: 0.5),
                    hintText: "Sura Name",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.titleTextColor,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        AppAssets.searchField,
                        height: 28,
                        width: 28,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: searchQuery.isEmpty,
                replacement: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () =>
                              _onSuraTab(searchSuraList[index].suraID - 1),
                          child: SuraCard(
                            suraData: searchSuraList[index],
                          ),
                        ),
                    separatorBuilder: (context, index) => Divider(
                          endIndent: 60,
                          indent: 60,
                        ),
                    itemCount: searchSuraList.length),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        "Most Recently",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.titleTextColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: Visibility(
                        visible: recentSuraList.isNotEmpty,
                        replacement: Center(
                          child: Text(
                            "No Recent Sura",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor),
                          ),
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                SuraDetailsScreen.routeName,
                                arguments: recentSuraList[index],
                              );
                            },
                            child: RecentBox(
                              suraData: recentSuraList[index],
                            ),
                          ),
                          itemCount: recentSuraList.length,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        "Sura List",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.titleTextColor),
                      ),
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () =>
                                  _onSuraTab(suraDataList[index].suraID - 1),
                              child: SuraCard(
                                suraData: suraDataList[index],
                              ),
                            ),
                        separatorBuilder: (context, index) => Divider(
                              endIndent: 60,
                              indent: 60,
                            ),
                        itemCount: suraDataList.length),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onSuraTab(int index) {
    _casheSuraIndex(index);
    Navigator.pushNamed(context, SuraDetailsScreen.routeName,
        arguments: suraDataList[index]);
    setState(() {});
  }

  _casheSuraIndex(int index) async {
    var indexString = index.toString();
    if (recentSuraIndexList.contains(indexString)) return;
    if (recentSuraIndexList.length == 5) {
      recentSuraIndexList.removeLast();
    }
    recentSuraIndexList.insert(0, indexString);
    await LocalStorageService.setList(
        LocalStorageKeys.recentSuras, recentSuraIndexList);
    _loadRecenetSura();
    setState(() {});
  }

  _loadRecenetSura() {
    recentSuraIndexList = [];
    recentSuraList = [];
    recentSuraIndexList =
        LocalStorageService.getStringList(LocalStorageKeys.recentSuras) ?? [];
    for (var index in recentSuraIndexList) {
      var indexInt = int.parse(index);
      recentSuraList.add(suraDataList[indexInt]);
    }
  }

  void search() {
    searchSuraList = [];
    for (var sura in suraDataList) {
      if (sura.suraNameAR.toLowerCase().contains(searchQuery.toLowerCase()) ||
          sura.suraNameEN.toLowerCase().contains(searchQuery.toLowerCase())) {
        searchSuraList.add(sura);
      }
    }
  }
}

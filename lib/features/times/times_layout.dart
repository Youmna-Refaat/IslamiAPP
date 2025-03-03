import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_assets.dart';
import '../../core/theme/color_class.dart';
import 'widgets/azkar_card.dart';
import 'widgets/prayer_time_list.dart';
import '../../data/network/prayer_times_api.dart'; // API Service
import '../../data/models/prayer_time_model.dart';

class TimesLayout extends StatefulWidget {
  static String routeName = "Times Layout";

  const TimesLayout({super.key});

  @override
  _TimesLayoutState createState() => _TimesLayoutState();
}

class _TimesLayoutState extends State<TimesLayout> {
  late String todayDate;
  late String hijriDate = "Loading...";
  late String dayName;
  String nextPrayer = "Loading...";
  String nextPrayerTime = "--:--";
  List<PrayerTimes>? prayerTimes;

  @override
  void initState() {
    super.initState();
    _getDates();
    _fetchPrayerTimes();
  }

  void _getDates() {
    DateTime now = DateTime.now();
    todayDate = DateFormat("dd MMM,\n yyyy").format(now);
    dayName = DateFormat("EEEE").format(now);
    setState(() {});
  }

  Future<void> _fetchPrayerTimes() async {
    PrayerTimeService service = PrayerTimeService();
    final prayerTimesData =
        await service.fetchPrayerTimes("Cairo", "Egypt", todayDate);

    setState(() {
      hijriDate =
          "${prayerTimesData.hijriDay} ${prayerTimesData.hijriMonth}, \n ${prayerTimesData.hijriYear}";
    });

    prayerTimes = [
      PrayerTimes(name: "Fajr", time: prayerTimesData.fajr),
      PrayerTimes(name: "Sunrise", time: prayerTimesData.sunrise),
      PrayerTimes(name: "Dhuhr", time: prayerTimesData.dhuhr),
      PrayerTimes(name: "Asr", time: prayerTimesData.asr),
      PrayerTimes(name: "Maghrib", time: prayerTimesData.maghrib),
      PrayerTimes(name: "Isha", time: prayerTimesData.isha),
    ];

    _calculateNextPrayer();
  }

  void _calculateNextPrayer() {
    if (prayerTimes == null) return;

    DateTime now = DateTime.now();
    DateFormat timeFormat = DateFormat("HH:mm");

    for (var prayer in prayerTimes!) {
      try {
        DateTime prayerTime = timeFormat.parse(prayer.time);
        DateTime fullPrayerTime = DateTime(
          now.year,
          now.month,
          now.day,
          prayerTime.hour,
          prayerTime.minute,
        );

        if (fullPrayerTime.isAfter(now)) {
          setState(() {
            nextPrayer = prayer.name;
            nextPrayerTime = prayer.time;
          });
          return;
        }
      } catch (e) {
        print("Error parsing prayer time: ${prayer.time}");
      }
    }

    setState(() {
      nextPrayer = "Fajr";
      nextPrayerTime = prayerTimes!.first.time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.timesBG),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Image.asset(AppAssets.logoBG),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppAssets.timesBoxBG),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            todayDate,
                            style: TextStyle(
                              fontFamily: 'Janna',
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            "Pray Time\n$dayName",
                            style: TextStyle(
                              fontFamily: 'Janna',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            hijriDate,
                            style: TextStyle(
                              fontFamily: 'Janna',
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        PrayerTimeList(),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Next Prayer - $nextPrayer at $nextPrayerTime',
                              style: TextStyle(
                                  fontFamily: 'Janna',
                                  color: AppColors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 40),
                            GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.volume_off,
                                ))
                          ],
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Azkar",
                style: TextStyle(
                  fontFamily: 'Janna',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.titleTextColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AzkarCard(
                      image: AppAssets.eveningAzkarImg, title: "Evening Azkar"),
                  AzkarCard(
                      image: AppAssets.morningAzkarImg, title: "Morning Azkar")
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AzkarCard(
                      image: AppAssets.wakingAzkarImg, title: "Waking Azkar"),
                  AzkarCard(
                      image: AppAssets.sleepingAzkarImg,
                      title: "Sleeping Azkar")
                ],
              ),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/color_class.dart';
import '../../../data/models/prayer_time_model.dart';
import '../../../data/network/prayer_times_api.dart';
import 'prayer_time_card.dart';
import 'search_text_field.dart';

class PrayerTimeList extends StatefulWidget {
  const PrayerTimeList({super.key});

  @override
  _PrayerTimeListState createState() => _PrayerTimeListState();
}

class _PrayerTimeListState extends State<PrayerTimeList> {
  late Future<List<PrayerTimes>> _prayerTimes;
  final TextEditingController _cityController = TextEditingController();
  String _selectedCity = "Cairo"; // Default city
  final String _country = "Egypt"; // Default country

  @override
  void initState() {
    super.initState();
    _cityController.text = _selectedCity;
    _fetchPrayerTimes();
  }

  void _fetchPrayerTimes() {
    String todayDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    setState(() {
      _prayerTimes = fetchPrayerTimes(_selectedCity, _country, todayDate);
    });
  }

  Future<List<PrayerTimes>> fetchPrayerTimes(
      String city, String country, String date) async {
    PrayerTimeService service = PrayerTimeService();
    final prayerTimes = await service.fetchPrayerTimes(city, country, date);
    return [
      PrayerTimes(name: "Fajr", time: prayerTimes.fajr),
      PrayerTimes(name: "Sunrise", time: prayerTimes.sunrise),
      PrayerTimes(name: "Dhuhr", time: prayerTimes.dhuhr),
      PrayerTimes(name: "Asr", time: prayerTimes.asr),
      PrayerTimes(name: "Maghrib", time: prayerTimes.maghrib),
      PrayerTimes(name: "Isha", time: prayerTimes.isha),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: SearchCityTextField(cityController: _cityController),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.secondaryColor.withValues(alpha: 0.7)),
                onPressed: () {
                  setState(() {
                    _selectedCity = _cityController.text;
                  });
                  _fetchPrayerTimes();
                },
                child: Text(
                  "Get Times",
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: FutureBuilder<List<PrayerTimes>>(
            future: _prayerTimes,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Failed to load prayer times"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text("No prayer times available"));
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return PrayerTimeCard(prayerTimeModel: snapshot.data![index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

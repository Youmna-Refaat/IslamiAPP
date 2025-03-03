import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/prayer_time_model.dart';

class PrayerTimeService {
  Future<PrayerTimeModel> fetchPrayerTimes(
      String city, String country, String date) async {
    final url =
        "http://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=2";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return PrayerTimeModel.fromJson(jsonData);
    } else {
      throw Exception("Failed to load prayer times");
    }
  }
}

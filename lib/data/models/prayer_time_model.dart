class PrayerTimes {
  final String name;
  final String time;

  PrayerTimes({required this.name, required this.time});

  factory PrayerTimes.fromJson(Map<String, dynamic> json) {
    return PrayerTimes(
      name: "",
      time: json['time'] ?? "",
    );
  }
}

class PrayerTimeModel {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final String hijriDay;
  final String hijriMonth;
  final String hijriYear;

  PrayerTimeModel({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.hijriDay,
    required this.hijriMonth,
    required this.hijriYear,
  });

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimeModel(
      fajr: json['data']['timings']['Fajr'],
      sunrise: json['data']['timings']['Sunrise'],
      dhuhr: json['data']['timings']['Dhuhr'],
      asr: json['data']['timings']['Asr'],
      maghrib: json['data']['timings']['Maghrib'],
      isha: json['data']['timings']['Isha'],
      hijriDay: json['data']['date']['hijri']['day'],
      hijriMonth: json['data']['date']['hijri']['month']
          ['en'], // Example: Muharram
      hijriYear: json['data']['date']['hijri']['year'],
    );
  }
}

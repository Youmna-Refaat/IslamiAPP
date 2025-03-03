import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/radio_station_model.dart';

class RadiosService {
  static const String _baseUrl =
      "https://mp3quran.net/api/v3/radios?language=ar";

  Future<List<RadioStationModel>> fetchRadios() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> radiosJson = json.decode(response.body)['radios'];
      return radiosJson
          .map((json) => RadioStationModel.fromJson(json))
          .toList();
    } else {
      throw Exception("Failed to load radio stations");
    }
  }
}

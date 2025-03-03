import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/reciters_model.dart';

class RecitersService {
  static const String _baseUrl =
      "https://www.mp3quran.net/api/v3/reciters?language=ar";

  Future<List<ReciterModel>> fetchReciters() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> recitersJson = json.decode(response.body)['reciters'];
      return recitersJson.map((json) => ReciterModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load reciters");
    }
  }
}

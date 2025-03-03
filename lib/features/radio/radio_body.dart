import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'widgets/radio_card.dart';

class RadioBody extends StatefulWidget {
  const RadioBody({super.key});

  @override
  _RadioBodyState createState() => _RadioBodyState();
}

class _RadioBodyState extends State<RadioBody> {
  List<dynamic> radioStations = [];

  @override
  void initState() {
    super.initState();
    fetchRadios();
  }

  Future<void> fetchRadios() async {
    final url = Uri.parse("https://mp3quran.net/api/v3/radios?language=ar");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        radioStations = data["radios"];
      });
    } else {
      print("Failed to load radios");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: radioStations.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              itemCount: radioStations.length,
              itemBuilder: (context, index) {
                return RadioCard(
                  title: radioStations[index]["name"],
                  radioUrl: radioStations[index]["url"],
                );
              },
            ),
    );
  }
}

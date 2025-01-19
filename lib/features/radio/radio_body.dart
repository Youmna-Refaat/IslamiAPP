import 'package:flutter/material.dart';

import 'widgets/radio_card.dart';

class RadioBody extends StatelessWidget {
  RadioBody({super.key});
  final List<String> radioCardTitles = [
    'Radio Ibrahim Al-Akdar',
    'Radio Al-Qaria Yassen',
    'Radio Ahmed Al-Trabulsi',
    'Radio Addokali Mohammad Alalim',
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return RadioCard(index: index, title: radioCardTitles[index]);
        },
        itemCount: radioCardTitles.length,
      ),
    );
  }
}

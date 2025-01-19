import 'package:flutter/material.dart';

import 'widgets/radio_card.dart';

class RecitersBody extends StatelessWidget {
  RecitersBody({super.key});
  final List<String> recitersCardTitle = [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Malik Shaibat Alhamed',
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return RadioCard(index: index, title: recitersCardTitle[index]);
        },
        itemCount: recitersCardTitle.length,
      ),
    );
  }
}

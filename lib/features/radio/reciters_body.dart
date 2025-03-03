import 'package:flutter/material.dart';
import '../../data/models/reciters_model.dart';
import '../../data/network/reciters_api.dart';
import 'widgets/radio_card.dart';

class RecitersBody extends StatefulWidget {
  const RecitersBody({super.key});

  @override
  _RecitersBodyState createState() => _RecitersBodyState();
}

class _RecitersBodyState extends State<RecitersBody> {
  List<ReciterModel> reciters = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchReciters();
  }

  Future<void> fetchReciters() async {
    final service = RecitersService();
    try {
      final fetchedReciters = await service.fetchReciters();
      setState(() {
        reciters = fetchedReciters;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemCount: reciters.length,
                  itemBuilder: (context, index) {
                    final reciter = reciters[index];
                    final radioUrl = reciter.moshaf.isNotEmpty
                        ? reciter.moshaf[0]["server"]
                        : null;
                    return RadioCard(
                      title: reciter.name,
                      radioUrl: radioUrl ?? '', // Handle null URL
                    );
                  },
                ),
    );
  }
}

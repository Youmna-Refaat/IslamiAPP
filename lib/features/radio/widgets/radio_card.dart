import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/theme/color_class.dart';

class RadioCard extends StatefulWidget {
  final String title;
  final String radioUrl; // Streaming URL
  const RadioCard({super.key, required this.title, required this.radioUrl});

  @override
  _RadioCardState createState() => _RadioCardState();
}

class _RadioCardState extends State<RadioCard> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  void _togglePlayPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      if (widget.radioUrl.isNotEmpty &&
          Uri.tryParse(widget.radioUrl)?.hasAbsolutePath == true) {
        try {
          await _audioPlayer.play(UrlSource(widget.radioUrl));
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to play audio}')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid audio URL')),
        );
      }
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.radioCardUnplayedBG),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Janna',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: AppColors.black,
                    ),
                    onPressed: _togglePlayPause,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

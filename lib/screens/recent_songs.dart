import 'package:flutter/material.dart';
import 'package:music_player/utils/colors.dart';

class RecentSongs extends StatelessWidget {
  const RecentSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: themeColor,
      body: Center(
        child: Text("Recent Songs", style: TextStyle(color: Colors.white),),
      ),
     
    );
  }
}
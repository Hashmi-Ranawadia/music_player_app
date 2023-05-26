import 'package:flutter/material.dart';
import 'package:music_player/utils/colors.dart';

class NewSongs extends StatelessWidget {
  const NewSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: themeColor,
      body: Center(
        child: Text("New Songs", style: TextStyle(color: Colors.white),),
      ),
     
    );
  }
}
import 'package:flutter/material.dart';
import 'package:music_player/utils/colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: themeColor,
      body: Center(
        child: Text("Profile", style: TextStyle(color: Colors.white),),
      ),
     
    );
  }
}
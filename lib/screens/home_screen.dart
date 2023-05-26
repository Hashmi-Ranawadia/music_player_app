import 'package:flutter/material.dart';
import 'package:music_player/screens/new_songs.dart';
import 'package:music_player/screens/profile.dart';
import 'package:music_player/screens/recent_songs.dart';
import 'package:music_player/screens/trending_songs.dart';
import 'package:music_player/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> myList = [TrendingSongs(), RecentSongs(), NewSongs(), Profile()];
  int _currentIndex = 0;

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      body: myList[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: BottomNavigationBar(
              elevation: 3,
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white38,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: bottomNavColor.withOpacity(0.5),
              onTap: (value) {
                onTapped(value);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home, size: 30,), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.search, size: 30,), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.library_music_outlined, size: 30,), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.person, size: 30,), label: ""),
              ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:music_player/utils/colors.dart';
import 'package:audioplayers/audioplayers.dart';

class TrendingSongs extends StatefulWidget {
  const TrendingSongs({super.key});

  @override
  State<TrendingSongs> createState() => _TrendingSongsState();
}

class _TrendingSongsState extends State<TrendingSongs> {
  final player = AudioPlayer();

  List<bool> list = [false, false, false];

  List<dynamic> musiccardColor = [
    musicCardColor,
    musicCardColor2,
    musicCardColor3
  ];

  List<String> mySongs = ["sorry.mp3", "Trampoline.mp3", "alone.mp3"];

  List<String> songTitle = [
    "I'm Good (Blue)",
    "Under the influence",
    "Forget Me"
  ];
  List<String> songSubTitle = [
    "David & Babe Rexha",
    "Chris Brown",
    "Lewis Capaldi"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: themeColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                // menu bar and search bar
                Row(
                  children: [
                    // menu bar
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: bottomNavColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),

                    // search bar
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: bottomNavColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)),
                          child: const TextField(
                            cursorColor: Colors.white,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white38,
                                ),
                                hintText: "Search",
                                hintStyle: TextStyle(color: Colors.white38)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 30,
                ),

                // Trending Text Title
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Trending right now",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // Horizontal listview card for songs
                Container(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mySongs.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 220,
                        child: Card(
                          color: cardColor.withOpacity(0.01),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 10, right: 20),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    Icons.more_horiz,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Card(
                                      color: musiccardColor[index],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: ListTile(
                                        title: const Text(
                                          "The Dard Side",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        subtitle: Row(
                                          children: const [
                                            Icon(
                                              Icons.music_note,
                                              color: Colors.white,
                                              size: 12,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                                child: Text(
                                              "Muse - simulation theory",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                          ],
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {
                                            if (list[index] == false) {
                                              player.play(AssetSource(
                                                  mySongs[index].toString()));

                                              setState(() {
                                                for (int i = 0;
                                                    i < list.length;
                                                    i++) {
                                                  if(list[index] != list[i]){
                                                    list[i] = false;
                                                  }
                                                }
                                              });
                                            } else {
                                              player.pause();
                                            }
                                            setState(() {
                                              list[index] = !list[index];
                                            });
                                          },
                                          icon: list[index] == true
                                              ? const Icon(
                                                  Icons.pause_circle_filled,
                                                  color: Colors.white,
                                                  size: 35,
                                                )
                                              : const Icon(
                                                  Icons.play_circle_fill,
                                                  color: Colors.white,
                                                  size: 35,
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Tab bar
                Container(
                  height: 35,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: TabBar(
                    isScrollable: true,
                    indicator: BoxDecoration(
                        color: tabColor,
                        borderRadius: BorderRadius.circular(10)),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    tabs: [
                      Tab(text: 'Trending right now'),
                      Tab(text: 'Rock'),
                      Tab(text: 'Hip hop'),
                      Tab(text: 'Electro'),
                    ],
                  ),
                ),

                // Tab screens
                Expanded(
                  child: TabBarView(
                    children: [
                      // List of songs
                      Container(
                        child: ListView.builder(
                          itemCount: songTitle.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                player.play(
                                    AssetSource(mySongs[index].toString()));

                                setState(() {
                                  for (int i = 0; i < list.length; i++) {
                                    list[i] = false;
                                  }
                                });
                              },
                              child: ListTile(
                                leading: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                            "assets/images/songs.jpg",
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                                title: Text(
                                  songTitle[index].toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                subtitle: Row(
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      color: Colors.white38,
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      songSubTitle[index].toString(),
                                      style: const TextStyle(
                                        color: Colors.white38,
                                      ),
                                    )
                                  ],
                                ),
                                trailing: const Icon(
                                  Icons.favorite_outline_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // no data
                      Container(
                        child: const Center(
                            child: Text(
                          'Tab 2 Content',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),

                      // no data
                      Container(
                        child: const Center(
                            child: Text(
                          'Tab 3 Content',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),

                      // no data
                      Container(
                        child: const Center(
                            child: Text(
                          'Tab 4 Content',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:music_player/neu_box.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  bool play = false;
  bool pref = false;
  bool next = false;
  bool shuffle = false;
  bool repeat = false;
  bool favorite = false;

  pressPLay() {
    play = true;
    setState(() {});
    Future.delayed(
      Duration(milliseconds: 300),
      () {
        play = false;
        setState(() {});
      },
    );

    log('Play');
  }

  pressPref() {
    pref = true;
    setState(() {});
    Future.delayed(
      Duration(milliseconds: 300),
      () {
        pref = false;
        setState(() {});
      },
    );
  }

  pressNext() {
    next = true;
    setState(() {});
    Future.delayed(
      Duration(milliseconds: 300),
      () {
        next = false;
        setState(() {});
      },
    );
  }

  pressShuffle() {
    if (shuffle != true) {
      setState(() {
        shuffle = true;
      });
    } else {
      setState(() {
        shuffle = false;
      });
    }

    log('shuffle $shuffle');
  }

  pressRepeat() {
    if (repeat != true) {
      setState(() {
        repeat = true;
      });
    } else {
      setState(() {
        repeat = false;
      });
    }

    log('repeat $repeat');
  }

  pressFavorite() {
    if (favorite != true) {
      setState(() {
        favorite = true;
      });
    } else {
      setState(() {
        favorite = false;
      });
    }

    log('favorite $favorite');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              //back button and menu button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: NeuBox(child: Icon(Icons.arrow_back)),
                        ),
                      ),
                      Text('P L A Y L I S T'),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: NeuBox(child: Icon(Icons.menu_rounded)),
                      ),
                    ]),
              ),

              const SizedBox(
                height: 15,
              ),

              //cover art, artist name , song name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: NeuBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.50,
                          width: double.infinity,
                          child: Image.asset(
                            'lib/images/cover-art.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Crash Song',
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Hamm_',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: pressFavorite,
                              child: Icon(
                                Icons.favorite,
                                color: favorite
                                    ? Colors.red
                                    : Colors.grey.shade400,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // const SizedBox(
              //   height: 25,
              // ),

              // // start time , shuffle button dll

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: const [
              //       Text('0:00'),
              //       Icon(Icons.shuffle),
              //       Icon(Icons.repeat),
              //       Text('4:22'),
              //     ],
              //   ),
              // ),

              const SizedBox(
                height: 25,
              ),

              //linear bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: NeuBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('0:00'),
                      SizedBox(
                        width: 2,
                      ),
                      Expanded(
                        child: LinearPercentIndicator(
                          // linearStrokeCap: LinearStrokeCap.roundAll,
                          animation: true,
                          lineHeight: 10,
                          percent: 0.5,
                          progressColor: Colors.black,
                          backgroundColor: Colors.grey.shade400,
                          barRadius: Radius.circular(8),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text('4:22'),
                    ],
                  ),
                ),
              ),

              // const SizedBox(
              //   height: 20,
              // ),

              // // start time , shuffle button dll

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: const [
              //       Text('0:00'),
              //       Icon(Icons.shuffle),
              //       Icon(Icons.repeat),
              //       Text('4:22'),
              //     ],
              //   ),
              // ),

              const SizedBox(
                height: 30,
              ),
              //previous song, pause play, skip next song

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: pressRepeat,
                        icon: Icon(
                          Icons.repeat,
                          color: repeat ? Colors.blue.shade400 : Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: NeuButton(
                              onPressed: pressPref,
                              tap: pref,
                              child: Icon(
                                Icons.skip_previous,
                                size: 32,
                              ))),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: NeuButton(
                                tap: play,
                                onPressed: () {
                                  pressPLay();
                                },
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 32,
                                )),
                          )),
                      Expanded(
                          child: NeuButton(
                              onPressed: pressNext,
                              tap: next,
                              child: Icon(
                                Icons.skip_next,
                                size: 32,
                              ))),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: pressShuffle,
                        icon: Icon(
                          Icons.shuffle,
                          color: shuffle ? Colors.blue.shade400 : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: NeuBox(
                    child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.70,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Lyric',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ));
  }
}

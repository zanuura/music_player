import 'package:flutter/material.dart';
import 'package:music_player/neu_box.dart';
import 'package:music_player/pages/song_page.dart';
import 'package:music_player/style/theme_color.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  tapToPlay() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SongPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: ColorPalette.backgroundColor,
      //   title: Text('V L A Y I T'),
      //   centerTitle: true,
      // ),
      backgroundColor: ColorPalette.backgroundColor,
      body: SafeArea(
          child: ListView(
        children: [
          // SizedBox(
          //   height: 20,
          // ),
          // Center(child: Text('V L A Y I T')),
          // SizedBox(
          //   height: 20,
          // ),
          SizedBox(
            height: 8,
          ),
          searchBar(),
          // SizedBox(
          //   height: 15,
          // ),
          horizonList(),
          verList(),
        ],
      )),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: NeuBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 's e a r c h',
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(10, 3, 10, 3)),
              ),
            ),
            Icon(Icons.search_sharp),
          ],
        ),
      ),
    );
  }

  Widget horizonList() {
    return Container(
      height: 280,
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 7),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              tapToPlay();
            },
            child: Container(
              width: 200,
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 25),
              child: NeuBox(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    // height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade400,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'music title',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    'artist',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              )),
            ),
          );
        },
      ),
    );
  }

  Widget verList() {
    return ListView.builder(
      itemCount: 15,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 15),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: NeuBox(
              child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade400,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'music title',
                      maxLines: 2,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      'artist',
                      maxLines: 2,
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {},
                child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Center(child: Icon(Icons.more_vert_rounded))),
              ),
              SizedBox(
                width: 5,
              )
            ],
          )),
        );
      },
    );
  }
}

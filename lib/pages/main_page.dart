import 'package:flutter/material.dart';
import 'package:music_player/neu_box.dart';
import 'package:music_player/pages/song_page.dart';
import 'package:music_player/style/theme_color.dart';
import 'package:music_player/widgets/list_box.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  TabController? tabController;
  bool tapTab = false;

  tapToPlay() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SongPage(),
        ));
  }

  onTapSlideTab() {
    tapTab = true;
    setState(() {});
    Future.delayed(
      Duration(milliseconds: 400),
      () {
        tapTab = false;
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 6, vsync: this);
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
      floatingActionButton: playBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
          child: Column(
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
          SizedBox(
            height: 5,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 350),
            height: 65,
            color: Colors.transparent,
            child: TabBar(
                padding: EdgeInsets.fromLTRB(8, 10, 8, 15),
                controller: tabController,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 5,
                labelColor: Colors.grey.shade600,
                unselectedLabelColor: Colors.white,
                isScrollable: true,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: (value) {
                  onTapSlideTab();
                },
                indicator: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                    border: tapTab == true
                        ? Border.all(color: Colors.grey.shade200, width: 1)
                        : null,
                    boxShadow: [
                      BoxShadow(
                        color: tapTab == true
                            ? ColorPalette.backgroundColor
                            : Colors.grey.shade500,
                        blurRadius: tapTab == true ? 10 : 10,
                        offset: tapTab == true ? Offset(2, 2) : Offset(4, 4),
                      ),
                      BoxShadow(
                        color: tapTab == true
                            ? ColorPalette.backgroundColor
                            : Colors.white,
                        blurRadius: tapTab == true ? 10 : 10,
                        offset:
                            tapTab == true ? Offset(-2, -2) : Offset(-4, -4),
                      )
                    ]),
                tabs: [
                  //favorit, daftar putar, trek, album, artist, folder
                  Tab(
                    text: '   Favorit   ',
                  ),
                  Tab(
                    text: '   Daftar putar   ',
                  ),
                  Tab(
                    text: '   Trek   ',
                  ),
                  Tab(
                    text: '   Album   ',
                  ),
                  Tab(
                    text: '   Artist   ',
                  ),
                  Tab(
                    text: '   Folder   ',
                  ),
                ]),
          ),
          Flexible(
            child: TabBarView(controller: tabController, children: [
              allList(),
              allList(),
              allList(),
              allList(),
              allList(),
              allList(),
            ]),
          )
        ],
      )),
    );
  }

  // Widget customLoadIndicator(){
  //   return Container(

  //   )
  // }

  Widget allList() {
    return ListView(
      children: [
        horizonList(),
        verList(),
      ],
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
                autofocus: false,
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
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
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
        return ListBox(
          title: 'Music',
          artist: 'artist',
          onTap: () {},
        );
      },
    );
  }

  Widget playBar() {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.95,
      // padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return SongPage();
            },
          ));
        },
        child: NeuBox(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade400,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Music',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text('Artist'),
                  ],
                ),
              ],
            )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(Icons.skip_previous_rounded),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(Icons.play_arrow_rounded),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(Icons.skip_next_rounded),
                ),
              ],
            ))
          ],
        )),
      ),
    );
  }
}

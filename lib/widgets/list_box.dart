import 'package:flutter/material.dart';

import '../neu_box.dart';

class ListBox extends StatefulWidget {
  ListBox({super.key, required this.title, required this.artist, this.onTap});

  var image;
  String title = '';
  String artist = '';
  String album = '';
  Function()? onTap;

  @override
  State<ListBox> createState() => _ListBoxState();
}

class _ListBoxState extends State<ListBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: widget.onTap,
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
              child: widget.image,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    widget.artist,
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:music_player/style/theme_color.dart';

class NeuBox extends StatelessWidget {
  final child;
  const NeuBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Center(child: child),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 15,
              offset: const Offset(5, 5),
            ),
            const BoxShadow(
              color: Colors.white,
              blurRadius: 15,
              offset: Offset(-5, -5),
            )
          ]),
    );
  }
}

Widget NeuButton(
    {Widget? child, required Function() onPressed, double? radius, bool? tap}) {
  return InkWell(
    onTap: onPressed,
    borderRadius: BorderRadius.circular(15),
    child: AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.all(8),
      child: Center(child: child),
      curve: Curves.fastOutSlowIn,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
          border: tap == true
              ? Border.all(color: Colors.grey.shade200, width: 1)
              : null,
          boxShadow: [
            BoxShadow(
              color: tap == true
                  ? ColorPalette.backgroundColor
                  : Colors.grey.shade500,
              blurRadius: tap == true ? 17 : 15,
              offset: tap == true ? Offset(2, 2) : Offset(5, 5),
            ),
            BoxShadow(
              color: tap == true ? ColorPalette.backgroundColor : Colors.white,
              blurRadius: tap == true ? 17 : 15,
              offset: tap == true ? Offset(-2, -2) : Offset(-5, -5),
            )
          ]),
    ),
  );
}

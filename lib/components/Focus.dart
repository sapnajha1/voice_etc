import 'package:flutter/material.dart';
import '../const/color.dart';
import '../constWidget/textwidget.dart';

class Focas_container extends StatelessWidget {
  const Focas_container({
    Key? key,
    required this.fontsize,
    required this.focustext,
  });

  final double fontsize;
  final String focustext;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: focusmode, borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Adjust this line
        children: [
          Icon(Icons.visibility),
          SizedBox(width: 8.0), // Add some spacing between the icon and text
          textwidget(focustext, fontsize, FontWeight.bold, textcolor),
        ],
      ),
    );
  }
}

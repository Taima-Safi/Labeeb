import 'package:flutter/material.dart';
import 'package:labbeb/core/const_data/app_colors.dart';

class Greenbutton extends StatelessWidget {
  const Greenbutton(
      {super.key,
      required this.buttontext,
      required this.buttoncolor,
      required this.textstyle});
  final String buttontext;
  final Color buttoncolor;
  final TextStyle textstyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 90,
      decoration: BoxDecoration(
        color: buttoncolor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        splashColor: Mycolor.grey,
        highlightColor: Mycolor.grey,
        onTap: () {},
        child: Center(
          child: Text(
            buttontext,
            style: textstyle,
          ),
        ),
      ),
    );
  }
}

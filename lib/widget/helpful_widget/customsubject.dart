import 'package:flutter/material.dart';
import 'package:labbeb/core/const_data/app_colors.dart';
import 'package:labbeb/core/const_data/text_style.dart';

class Customsubject extends StatelessWidget {
  const Customsubject(
      {super.key, required this.subjectname, required this.pagename});
  final String subjectname;
  final VoidCallback pagename;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 190,
      decoration: BoxDecoration(
          color: Mycolor.primarycolor, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: pagename,
              icon: Icon(
                Icons.arrow_back_ios,
                color: Mycolor.white,
                size: 15,
              )),
          TextButton(
              onPressed: pagename,
              child: Text(
                subjectname,
                style: FontStyles.subject,
              )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:labbeb/core/const_data/app_colors.dart';

import 'package:labbeb/view/exam/ask_page.dart';

class nameExam_widget extends StatelessWidget {
  nameExam_widget({
    required this.name,
  });
  final name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AskExamPage()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        margin: EdgeInsets.only(top: 8),
        width: 350,
        height: 50,
        decoration: BoxDecoration(
          color: Mycolor.lightgrey,
          // border: Border.all(),
          borderRadius: BorderRadius.circular(13.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.arrow_back_ios_rounded,
              size: 16,
            ),
            Text(
              name,
              style: TextStyle(
                fontFamily: "NotoKufiArabic",
                color: Mycolor.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}

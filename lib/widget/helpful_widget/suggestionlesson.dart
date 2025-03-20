import 'package:flutter/material.dart';
import 'package:labbeb/core/const_data/app_colors.dart';
import 'package:labbeb/widget/helpful_widget/greenbutton.dart';
import 'package:labbeb/widget/helpful_widget/iconnamesubject.dart';

class Suggestionlesson extends StatelessWidget {
  const Suggestionlesson(
      {super.key,
      required this.subjectname,
      required this.subjectexplane,
      required this.subjecticon});
  final String subjectname;
  final String subjectexplane;
  final IconData subjecticon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 155,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Mycolor.lightgrey),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 175,
                    ),
                    Iconnamesubject(
                      ontap: () {},
                      subjectname: subjectname,
                      subjecticon: subjecticon,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  subjectexplane,
                  style: TextStyle(
                      fontFamily: 'NotoKufiArabic',
                      color: Mycolor.black,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 15,
                ),
                Greenbutton(
                  buttontext: 'ابدأ الدرس',
                  buttoncolor: Mycolor.primarycolor,
                  textstyle: TextStyle(
                      fontFamily: 'NotoKufiArabic',
                      color: Mycolor.white,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

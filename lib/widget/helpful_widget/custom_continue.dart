import 'package:flutter/material.dart';
import 'package:labbeb/core/const_data/app_colors.dart';
import 'package:labbeb/widget/helpful_widget/greenbutton.dart';
import 'package:labbeb/widget/helpful_widget/iconnamesubject.dart';

class CustomContinue extends StatelessWidget {
  const CustomContinue(
      {super.key,
      required this.subjectname,
      required this.subjecticon,
      required this.progress});
  final String subjectname;
  final IconData subjecticon;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Mycolor.lightgrey, borderRadius: BorderRadius.circular(14)),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Greenbutton(
                  buttontext: 'استمرار',
                  buttoncolor: Mycolor.primarycolor,
                  textstyle: TextStyle(
                      fontFamily: 'NotoKufiArabic',
                      color: Mycolor.white,
                      fontSize: 14),
                ),
                SizedBox(
                  width: 80,
                ),
                Iconnamesubject(
                  ontap: () {},
                  subjecticon: subjecticon,
                  subjectname: subjectname,
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: LinearProgressIndicator(
                value: progress, // نسبة التقدم (60%)
                minHeight: 6,
                backgroundColor: Mycolor.white,
                valueColor: AlwaysStoppedAnimation<Color>(Mycolor.primarycolor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
  }
}

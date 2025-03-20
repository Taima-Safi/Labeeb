import 'package:flutter/material.dart';
import 'package:labbeb/core/const_data/app_colors.dart';

class Askcontainer extends StatelessWidget {
  Askcontainer(
      {required this.title,
      required this.a1,
      required this.a2,
      required this.a3});
  final title;
  final a1;
  final a2;
  final a3;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 350,
      // height: 265,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      margin: EdgeInsets.only(top: 18, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Mycolor.lightgrey,
        // border: Border.all(),
        borderRadius: BorderRadius.circular(13.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              // 'حل نظام المعادلات التالي \n\n3x + 2y = 8\n2x - y = 3',
              style: TextStyle(
                fontFamily: "NotoKufiArabic",
                color: Mycolor.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            //  SizedBox(height: 10),

            //SizedBox(height: 20),
            buildOption(a1),
            buildOption(a2),
            buildOption(a3),
          ],
        ),
      ),
    );
  }

  Widget buildOption(String option) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          option,
          style: TextStyle(
            fontFamily: "NotoKufiArabic",
            color: Mycolor.black,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        Radio(
          value: option,
          groupValue: null, // يمكنك إضافة منطق لتحديد القيمة المحددة
          onChanged: (value) {
            // يمكنك إضافة منطق لتحديث القيمة المحددة
          },
        ),
      ],
    );
  }
}

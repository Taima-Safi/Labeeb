import 'package:flutter/material.dart';
import 'package:labeeb/core/const_data/app_colors.dart';
import 'package:labeeb/core/const_data/text_style.dart';

class Iconnamesubject extends StatelessWidget {
  const Iconnamesubject(
      {super.key,
      required this.subjectname,
      required this.subjecticon,
      required this.ontap});
  final String subjectname;
  final IconData subjecticon;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          subjectname,
          style: FontStyles.algebra,
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          height: 50,
          width: 49,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14), color: Mycolor.white),
          child: IconButton(
            onPressed: ontap,
            icon: Icon(
              subjecticon,
              color: Mycolor.black,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}

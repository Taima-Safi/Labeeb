import 'package:flutter/material.dart';
import 'package:labeeb/core/const_data/app_colors.dart';
import 'package:labeeb/core/const_data/text_style.dart';
import 'package:labeeb/widget/helpful_widget/iconnamesubject.dart';

class Customlesson extends StatelessWidget {
  const Customlesson(
      {super.key,
      required this.lessoname,
      required this.subjecticon,
      required this.number,
      required this.onpressed});
  final String lessoname;
  final IconData subjecticon;
  final String number;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(
          color: Mycolor.lightgrey, borderRadius: BorderRadius.circular(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 15,
          ),
          IconButton(
              onPressed: onpressed,
              icon: Icon(
                Icons.arrow_back_ios,
                color: Mycolor.black,
                size: 20,
              )),
          Container(
            height: 20,
            width: 30,
            decoration: BoxDecoration(
                color: Mycolor.primarycolor,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                number,
                style: FontStyles.seeall,
              ),
            ),
          ),
          SizedBox(
            width: 185,
          ),
          Iconnamesubject(
              subjectname: lessoname,
              subjecticon: subjecticon,
              ontap: onpressed),
          SizedBox(
            width: 18,
          ),
        ],
      ),
    );
  }
}

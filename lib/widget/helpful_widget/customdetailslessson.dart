import 'package:flutter/material.dart';
import 'package:labbeb/core/const_data/app_colors.dart';
import 'package:labbeb/core/const_data/text_style.dart';

class Customdetailslessson extends StatelessWidget {
  const Customdetailslessson(
      {super.key, required this.lessonname, required this.lessonhint});
  final String lessonname;
  final String lessonhint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: double.infinity,
        height: 230,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14), color: Mycolor.lightgrey),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                lessonname,
                style: FontStyles.lesson,
              ),
              SizedBox(
                  width: 350,
                  child: Divider(
                    color: Mycolor.grey.withAlpha(40),
                    thickness: 1,
                    height: 30,
                  )),
              Text(
                textAlign: TextAlign.right,
                lessonhint,
                style: FontStyles.searchbar,
              )
            ],
          ),
        ),
      ),
    );
  }
}

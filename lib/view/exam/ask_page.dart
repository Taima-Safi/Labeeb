import 'package:flutter/material.dart';
import 'package:labbeb/core/const_data/app_colors.dart';

import 'package:labbeb/view/chat/chatgpt.dart';

import 'package:labbeb/view/exam/askContainer.dart';

import 'package:labbeb/view/exam/testapi.dart';
import 'package:labbeb/view/home_page/home_screen/home_screen.dart';
import 'package:labbeb/view/lesson_page/lesson_screen/lesson_screen.dart';
import 'package:labbeb/widget/general_widget/navbar.dart';

class AskExamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        foregroundColor: Mycolor.white,
        automaticallyImplyLeading: false,
        backgroundColor: Mycolor.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    width: 62,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Mycolor.primarycolor,
                      // border: Border.all(),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    child: Center(
                      child: Text(
                        "حفظ",
                        style: TextStyle(
                          fontFamily: "NotoKufiArabic",
                          color: Mycolor.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    )),
                SizedBox(
                  width: 85,
                ),
                Text(" المعادلات التربيعية",
                    style: TextStyle(
                      fontFamily: "NotoKufiArabic",
                      color: Mycolor.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    )),
                SizedBox(
                  width: 12,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 16,
                  ),
                  child: Image.asset("assets/Frame 2607208.png"),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            margin: EdgeInsets.only(top: 40),
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
                Text(
                  "المستوى: متوسط",
                  style: TextStyle(
                    fontFamily: "NotoKufiArabic",
                    color: Mycolor.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "المدة: 15د",
                  style: TextStyle(
                    fontFamily: "NotoKufiArabic",
                    color: Mycolor.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "عدد الاسئلة: 5",
                  style: TextStyle(
                    fontFamily: "NotoKufiArabic",
                    color: Mycolor.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Askcontainer(
              title: "حل نظام المعادلات التالي \n\n3x + 2y = 8\n2x - y = 3",
              a1: "x = 2, y = 1",
              a2: "x = 2, y = 2",
              a3: "x = 0, y = 3"),
          Askcontainer(
              title: "حل نظام المعادلات التالي \n\nx + y = 5\n2x - y = 4",
              a1: "x = 2, y = 3",
              a2: "x = 3, y = 2",
              a3: "x = 0, y = 3"),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 14, right: 14, bottom: 25),
        child: BottomNavBar(
          isSelectedHome: false,
          isSelectedlabeeb: false,
          isSelectedlesson: false,
          isSelectedProfile: false,
          isSelectedtest: true,
          onPressedtest: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SubjectsListScreen()));
          },
          onPressedlabeeb: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ChatScreen()));
          },
          onPressedHome: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          onpressedlesson: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LessonScreen()));
          },
        ),
      ),
    );
  }
}

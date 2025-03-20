import 'package:flutter/material.dart';
import 'package:labbeb/core/const_data/app_colors.dart';
import 'package:labbeb/modle/Exam_model.dart';
import 'package:labbeb/service/getallExam.dart';
import 'package:labbeb/view/chat/chatgpt.dart';

import 'package:labbeb/view/exam/ExamName_custom.dart';
import 'package:labbeb/view/home_page/home_screen/home_screen.dart';
import 'package:labbeb/view/lesson_page/lesson_screen/lesson_screen.dart';
import 'package:labbeb/widget/general_widget/navbar.dart';

class SubjectsListScreen extends StatefulWidget {
  @override
  _SubjectsListScreenState createState() => _SubjectsListScreenState();
}

class _SubjectsListScreenState extends State<SubjectsListScreen> {
  late Future<List<Map<String, dynamic>>> subjectsFuture;

  @override
  void initState() {
    super.initState();
    subjectsFuture = ApiService().fetchSubjectsAndExams();
  }

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
                const Text("الاختبارات",
                    style: TextStyle(
                      fontFamily: "NotoKufiArabic",
                      color: Mycolor.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    )),
                const SizedBox(
                  width: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                  ),
                  child: Image.asset("assets/Frame 2607208.png"),
                ),
              ],
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: subjectsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('لا توجد مواد'));
          }

          // بناء واجهة باستخدام البيانات المستدعاة
          List<Map<String, dynamic>> titles = snapshot.data!;

          return ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              // استرجاع بيانات المادة
              final String? title = titles[index]['title'];
              // List<String> exams = List<String>.from(titles[index]['exams']);
              List<Exam> exams = List<Exam>.from(
                  titles[index]['exams'].map((exam) => Exam.fromJson(exam)));
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 40),
                width: 350,
                // height: 208,
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                            width: 64,
                            height: 27,
                            decoration: BoxDecoration(
                              color: Mycolor.primarycolor,
                              // border: Border.all(),
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            child: const Center(
                              child: Text(
                                "عرض الكل",
                                style: TextStyle(
                                  fontFamily: "NotoKufiArabic",
                                  color: Mycolor.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9,
                                ),
                              ),
                            )),
                        Text(
                          title ?? "no name",
                          style: const TextStyle(
                            fontFamily: "NotoKufiArabic",
                            color: Mycolor.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ]),
                  ...exams.map((exam) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: nameExam_widget(
                          name: exam.title,
                        ),
                      )),
                ]),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14, bottom: 25),
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
                MaterialPageRoute(builder: (context) => const LessonScreen()));
          },
        ),
      ),
    );
  }
}

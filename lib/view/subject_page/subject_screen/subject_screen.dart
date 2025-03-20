import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labbeb/core/const_data/app_colors.dart';
import 'package:labbeb/core/const_data/text_style.dart';
import 'package:labbeb/view/chat/chatgpt.dart';
import 'package:labbeb/view/exam/testapi.dart';
import 'package:labbeb/view/home_page/home_screen/home_screen.dart';
import 'package:labbeb/view/lesson_page/lesson_screen/lesson_screen.dart';
import 'package:labbeb/view/subject_page/subject_controller/subject_controller.dart';
import 'package:labbeb/widget/general_widget/custom_searchbar.dart';
import 'package:labbeb/widget/general_widget/navbar.dart';
import 'package:labbeb/widget/helpful_widget/customdetailslessson.dart';

class SubjectScreen extends StatelessWidget {
  final int subjectId;
  SubjectScreen({required this.subjectId});
  final SubjectController controller = Get.put(SubjectController());

  @override
  Widget build(BuildContext context) {
    controller.fetchLessons(subjectId);
    return GetBuilder(
        init: SubjectController(),
        builder: (context) {
          return Scaffold(
            extendBody: true, // لجعل الجسم يمتد أسفل البوتوم بار

            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14, bottom: 25),
              child: BottomNavBar(
                isSelectedHome: true,
                isSelectedlabeeb: false,
                isSelectedlesson: false,
                isSelectedProfile: false,
                isSelectedtest: false,
                onpressedlesson: () {
                  Get.to(LessonScreen());
                },
                onPressedHome: () {
                  Get.to(HomeScreen());
                },
                onPressedlabeeb: () {
                  Get.to(ChatScreen());
                },
                onPressedtest: () {
                  Get.to(SubjectsListScreen());
                },
              ),
            ),
            backgroundColor: Mycolor.white,
            endDrawer: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                      decoration: BoxDecoration(color: Mycolor.primarycolor),
                      child: Text(
                        'القائمة الجانبية',
                        style: FontStyles.title,
                      )),
                ],
              ),
            ),

            appBar: AppBar(
              backgroundColor: Mycolor.white,
              title: Obx(
                () => Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    controller.subjectTitle.value.isEmpty
                        ? ' '
                        : controller.subjectTitle.value,
                    style: FontStyles.title,
                  ),
                ),
              ),
              toolbarHeight: 100,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Mycolor.primarycolor,
                        borderRadius:
                            BorderRadius.circular(16), // جعل الدائرة ناعمة
                      ),
                      child: const Icon(
                        Icons.menu, // أيقونة القائمة
                        color: Mycolor.white, // لون الأيقونة
                      ),
                    ),
                  ),
                ),
              ],
            ),

            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 1000,
                child: Column(
                  children: [
                    CustomsearchBar(),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      if (controller.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (controller.lessons.isEmpty) {
                        return Center(child: Text('لا توجد دروس متاحة.'));
                      }
                      return Expanded(
                        child: ListView.builder(
                          itemCount: controller.lessons.length,
                          itemBuilder: (context, index) {
                            var lesson = controller.lessons[index];
                            return Customdetailslessson(
                              lessonname: lesson['title'],
                              lessonhint: lesson['description'],
                            );
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

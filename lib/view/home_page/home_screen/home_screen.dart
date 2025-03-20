import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labbeb/core/const_data/app_colors.dart';
import 'package:labbeb/core/const_data/text_style.dart';
import 'package:labbeb/view/chat/chatgpt.dart';
import 'package:labbeb/view/exam/testapi.dart';
import 'package:labbeb/view/home_page/home_controller/home_controller.dart';
import 'package:labbeb/view/lesson_page/lesson_screen/lesson_screen.dart';
import 'package:labbeb/view/subject_page/subject_screen/subject_screen.dart';
import 'package:labbeb/widget/general_widget/custom_searchbar.dart';
import 'package:labbeb/widget/general_widget/navbar.dart';
import 'package:labbeb/widget/helpful_widget/custom_continue.dart';
import 'package:labbeb/widget/helpful_widget/customsubject.dart';
import 'package:labbeb/widget/helpful_widget/suggestionlesson.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<String> subjects = [
    'الجبر',
    'العلوم الطبيعية',
    'الجغرافيا',
    'التاريخ',
    'اللغة العربية',
    'ديانة',
    'رياضيات',
    'English'
  ];
  final HomeController controller =
      Get.put(HomeController()); // استدعاء الكونترولر

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(color: Mycolor.primarycolor),
                child: Text(
                  'القائمة الجانبية',
                  style: FontStyles.title,
                )),
          ],
        ),
      ),
      extendBody: true, // لجعل الجسم يمتد أسفل البوتوم بار

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 14.0, right: 14, bottom: 25),
        child: BottomNavBar(
          isSelectedHome: true,
          isSelectedlabeeb: false,
          isSelectedlesson: false,
          isSelectedProfile: false,
          isSelectedtest: false,
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
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        backgroundColor: Mycolor.white,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            '!مرحباً بعودتك',
            style: FontStyles.title,
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
                  borderRadius: BorderRadius.circular(16), // جعل الدائرة ناعمة
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomsearchBar(),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'استمر من حيث توقفت',
                  style: FontStyles.subtitle,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              const CustomContinue(
                subjecticon: Icons.science,
                subjectname: 'علم الأحياء',
                progress: 0.4,
              ),
              const SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'الدروس المقترحة',
                  style: FontStyles.subtitle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SingleChildScrollView(
                  dragStartBehavior: DragStartBehavior.start,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Suggestionlesson(
                        subjecticon: Icons.mosque,
                        subjectname: 'ديانة',
                        subjectexplane: 'بر الوالدين',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Suggestionlesson(
                        subjecticon: Icons.brush,
                        subjectname: 'رسم',
                        subjectexplane: 'الألوان الأساسية',
                      )
                    ],
                  )),
              const SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'المواد الدراسية',
                  style: FontStyles.subtitle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.subjects.isEmpty) {
                  return const Center(
                      child: Text(' جاري تحميل المواد دراسية المتاحة.'));
                }
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 3,
                  ),
                  itemCount: controller.subjects.length,
                  itemBuilder: (context, index) {
                    final subject = controller.subjects[index];

                    return Customsubject(
                      subjectname: subject.title ?? 'null',
                      pagename: () {
                        Get.to(SubjectScreen(subjectId: subject.id));
                      },
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

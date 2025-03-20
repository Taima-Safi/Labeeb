import 'package:flutter/material.dart';
import 'package:labbeb/core/const_data/app_colors.dart';
import 'package:labbeb/core/const_data/text_style.dart';
import 'package:labbeb/view/chat/chatgpt.dart';
import 'package:labbeb/view/exam/testapi.dart';
import 'package:labbeb/view/home_page/home_screen/home_screen.dart';
import 'package:labbeb/widget/general_widget/custom_searchbar.dart';
import 'package:labbeb/widget/general_widget/navbar.dart';
import 'package:labbeb/widget/helpful_widget/custom_continue.dart';
import 'package:labbeb/widget/helpful_widget/customlesson.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // لجعل الجسم يمتد أسفل البوتوم بار

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 14.0, right: 14, bottom: 25),
        child: BottomNavBar(
          isSelectedHome: false,
          isSelectedlabeeb: false,
          isSelectedlesson: true,
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

      appBar: AppBar(
        backgroundColor: Mycolor.white,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'الدروس',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                subjecticon: Icons.architecture,
                subjectname: 'أساسيات الجبر',
                progress: 0.8,
              ),
              const SizedBox(
                height: 25,
              ),
              Customlesson(
                lessoname: '  جبر',
                subjecticon: Icons.architecture,
                number: '24',
                onpressed: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              Customlesson(
                lessoname: 'علوم',
                subjecticon: Icons.science,
                number: '19',
                onpressed: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              Customlesson(
                lessoname: 'ديانة',
                subjecticon: Icons.mosque,
                number: '5',
                onpressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

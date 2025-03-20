import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labeeb/view/home_page/home_screen/home_screen.dart';
import 'package:labeeb/view/lesson_page/lesson_screen/lesson_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

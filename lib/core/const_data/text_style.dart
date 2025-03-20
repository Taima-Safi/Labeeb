// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class FontStyles {
  //‘عنوانين الصفحات
  static final title = GoogleFonts.notoKufiArabic(
    color: Mycolor.black,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

//استمر من حيث توقفت والدروس المقترحة والمواد الدراسية+اسم المادة في الاختبارات

  static final subtitle = GoogleFonts.notoKufiArabic(
    color: Mycolor.black,
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );
  //اساسيات الجبر_الجزء الاول
  static final algebra = GoogleFonts.notoKufiArabic(
    color: Mycolor.black,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
  //الجبر في واجهة الدروس + الدرس الاول .....+اسماء الاختبارات
  //سؤال الاختبار +الاجابة
  static final lesson = GoogleFonts.notoKufiArabic(
    color: Mycolor.black,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

//ادخل نص للبحث+ شرح الدرس
  static final searchbar = GoogleFonts.notoKufiArabic(
    color: Mycolor.grey,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  //المواد
  static final subject = GoogleFonts.notoKufiArabic(
    color: Mycolor.white,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
//nav bar title
  static final navbar = GoogleFonts.notoKufiArabic(
    color: Mycolor.black,
    fontWeight: FontWeight.w500,
    fontSize: 11,
  );

  //chat with ai
  static final chat = GoogleFonts.notoKufiArabic(
    color: Mycolor.white,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  static final aichat = GoogleFonts.notoKufiArabic(
    color: Mycolor.black,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  //عرض الكل +حفظ
  static final seeall = GoogleFonts.notoKufiArabic(
    color: Mycolor.white,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );
  //عدد الاسئلة المدة المستوى
  static final testlevel = GoogleFonts.notoKufiArabic(
    color: Mycolor.black,
    fontWeight: FontWeight.w700,
    fontSize: 12,
  );
  //5 15د متوسط
  static final test = GoogleFonts.notoKufiArabic(
    color: Mycolor.black,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
}

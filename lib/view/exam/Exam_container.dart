// import 'package:flutter/material.dart';
// import 'package:labbeb/const_data/app_colors.dart';
// import 'package:labbeb/view/exam/ExamName_custom.dart';

// class ExamContainer extends StatelessWidget {
//   ExamContainer(
//       {required this.name1,
//       required this.name2,
//       required this.name3,
//       required this.name4});
//   final name1;
//   final name2;
//   final name3;
//   final name4;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
//       width: 350,
//       height: 208,
//       child: Column(children: [
//         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//           Container(
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//               //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
//               width: 64,
//               height: 27,
//               decoration: BoxDecoration(
//                 color: Mycolor.primarycolor,
//                 // border: Border.all(),
//                 borderRadius: BorderRadius.circular(13.0),
//               ),
//               child: Center(
//                 child: Text(
//                   "عرض الكل",
//                   style: TextStyle(
//                     fontFamily: "NotoKufiArabic",
//                     color: Mycolor.white,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 9,
//                   ),
//                 ),
//               )),
//           Text(
//             name1,
//             style: TextStyle(
//               fontFamily: "NotoKufiArabic",
//               color: Mycolor.black,
//               fontWeight: FontWeight.w600,
//               fontSize: 15,
//             ),
//           ),
//         ]),
//         nameExam_widget(
//           name: name2
//           // "اختبار المعادلات الخطية"
//           ,
//         ),
//         nameExam_widget(name: name3
//             //"اختبار النسب والتناسب",
//             ),
//         nameExam_widget(name: name4
//             //"اختبار الإحصاء والاحتمالات",
//             ),
//       ]),
//     );
//   }
// }

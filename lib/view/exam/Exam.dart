// import 'package:flutter/material.dart';
// import 'package:labbeb/view/chat/chatgpt.dart';
// import 'package:labbeb/const_data/app_colors.dart';

// import 'package:labbeb/view/exam/Exam_container.dart';
// import 'package:labbeb/view/exam/custom_searchbar.dart';

// import 'package:labbeb/view/navbar.dart';

// class Exam_page extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       backgroundColor: Mycolor.white,
//       appBar: AppBar(
//         foregroundColor: Mycolor.white,
//         automaticallyImplyLeading: false,
//         backgroundColor: Mycolor.white,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(top: 12),
//             child: Row(
//               children: [
//                 Text("الاختبارات",
//                     style: TextStyle(
//                       fontFamily: "NotoKufiArabic",
//                       color: Mycolor.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16,
//                     )),
//                 SizedBox(
//                   width: 12,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                     right: 16,
//                   ),
//                   child: Image.asset("assets/Frame 2607208.png"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           Divider(
//             thickness: MediaQuery.of(context).size.width * .001,
//           ),
//           CustomSearchBar(),
//           ExamContainer(
//             name1: "الرياضيات",
//             name2: "اختبار المعادلات الخطية",
//             name3: "اختبار النسب والتناسب",
//             name4: "اختبار الإحصاء والاحتمالات",
//           ),
//           ExamContainer(
//             name1: "الفيزياء",
//             name2: "اختبار قوانين نيوتن للحركة",
//             name3: "اختبار الكهرباء والمغناطيسية",
//             name4: "اختبار الصوت والضوء",
//           ),
//         ]),
//       ),
//       bottomNavigationBar: Padding(
//         padding: EdgeInsets.only(left: 14, right: 14, bottom: 25),
//         child: BottomNavBar(
//           isSelectedHome: false,
//           isSelectedlabeeb: false,
//           isSelectedlesson: false,
//           isSelectedProfile: false,
//           isSelectedtest: true,
//           onPressedtest: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => Exam_page()));
//           },
//           onPressedlabeeb: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => ChatScreen()));
//           },
//         ),
//       ),
//     );
//   }
// }

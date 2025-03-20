import 'package:flutter/material.dart';

import '../../core/const_data/app_colors.dart';

class CustomsearchBar extends StatelessWidget {
  final Widget? netxPage; // خاصية اختيارية لقبول الدالة

  const CustomsearchBar({
    super.key,
    this.netxPage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 60, // الديناميكية في الارتفاع
        width: double.infinity, // عرض الحقل ديناميكي (مناسب للشاشة)
        child: TextField(
          onTap: () {
            // Get.to(
            //   netxPage,
            //   transition: Transition.fade,
            //   duration: const Duration(milliseconds: 300),
            // );
          },
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            filled: true,
            fillColor: Mycolor.lightgrey,
            hintText: 'ادخل نص للبحث',
            hintStyle: TextStyle(
                color: Mycolor.grey,
                fontFamily: 'NotoKufiArabic',
                fontSize: 14),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(top: 3, left: 6),
              child: Icon(
                Icons.search_outlined,
                color: Mycolor.grey,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ), // مسافات ديناميكية داخل الحقل
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14), // نصف القطر ديناميكي
              borderSide: BorderSide(
                color: Colors.transparent, // جعل الحدود بلون كاشف (شفاف)
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14), // نصف القطر ديناميكي
              borderSide: BorderSide(
                color: Colors.transparent, // جعل الحدود بلون كاشف (شفاف)
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14), // نصف القطر ديناميكي
              borderSide: BorderSide(
                color: Colors.transparent, // جعل الحدود بلون كاشف (شفاف)
              ),
            ),
          ),
        ),
      ),
    );
  }
}

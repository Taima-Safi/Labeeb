// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:labbeb/core/const_data/text_style.dart';

import '../../core/const_data/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final Function()? onPressedHome;
  final Function()? onpressedlesson;
  final Function()? onPressedlabeeb;
  final Function()? onPressedtest;
  final Function()? onPressedProfile;

  final bool isSelectedHome;
  final bool isSelectedlesson;
  final bool isSelectedlabeeb;
  final bool isSelectedtest;

  final bool isSelectedProfile;

  const BottomNavBar({
    super.key,
    this.onPressedHome,
    this.onPressedlabeeb,
    this.onpressedlesson,
    this.onPressedProfile,
    this.onPressedtest,
    required this.isSelectedHome,
    required this.isSelectedlabeeb,
    required this.isSelectedlesson,
    required this.isSelectedProfile,
    required this.isSelectedtest,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38),
        color: Mycolor.lightgrey,
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 30.0, left: 30, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Transform.translate(
              offset: Offset(-6, -5),
              child: Column(
                children: [
                  IconButton(
                    onPressed: onPressedProfile,
                    icon: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (isSelectedProfile)
                          Icon(
                            Icons.account_circle,
                            size: 32,
                            color: Mycolor.black,
                          )
                        else
                          Icon(
                            Icons.account_circle_outlined,
                            size: 30,
                            color: Mycolor.black,
                          )
                      ],
                    ),
                  ),
                  Text(
                    'حسابي',
                    style: FontStyles.navbar,
                  )
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(-3, -5),
              child: Column(
                children: [
                  IconButton(
                    onPressed: onPressedtest,
                    icon: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (isSelectedtest)
                          Icon(
                            Icons.edit,
                            size: 32,
                            color: Mycolor.black,
                          )
                        else
                          Icon(
                            Icons.edit_outlined,
                            size: 30,
                            color: Mycolor.black,
                          )
                      ],
                    ),
                  ),
                  Text(
                    'الاختبارات',
                    style: FontStyles.navbar,
                  )
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(4, -5),
              child: Column(
                children: [
                  IconButton(
                    onPressed: onPressedlabeeb,
                    icon: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (isSelectedlabeeb)
                          Icon(
                            Icons.reddit,
                            size: 32,
                            color: Mycolor.black,
                          )
                        else
                          Icon(
                            Icons.reddit_outlined,
                            size: 30,
                            color: Mycolor.black,
                          )
                      ],
                    ),
                  ),
                  Text(
                    'لبيب',
                    style: FontStyles.navbar,
                  )
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(6, -5),
              child: Column(
                children: [
                  IconButton(
                    onPressed: onpressedlesson,
                    icon: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (isSelectedlesson)
                          Icon(
                            Icons.book,
                            size: 32,
                            color: Mycolor.black,
                          )
                        else
                          Icon(
                            Icons.book_outlined,
                            size: 30,
                            color: Mycolor.black,
                          )
                      ],
                    ),
                  ),
                  Text(
                    'الدروس',
                    style: FontStyles.navbar,
                  )
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(6, -5),
              child: Column(
                children: [
                  IconButton(
                    onPressed: onPressedHome,
                    icon: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (isSelectedHome)
                          Icon(
                            Icons.home,
                            size: 32,
                            color: Mycolor.black,
                          )
                        else
                          Icon(
                            Icons.home_outlined,
                            size: 30,
                            color: Mycolor.black,
                          )
                      ],
                    ),
                  ),
                  Text(
                    'الرئيسية',
                    style: FontStyles.navbar,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:labbeb/core/const_data/app_colors.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({required this.message, Key? key}) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        // height: 62,
        //width: 257,
        padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * .05,
            left: MediaQuery.of(context).size.width * .05,
            top: MediaQuery.of(context).size.height * .015,
            bottom: MediaQuery.of(context).size.height * .02),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Mycolor.primarycolor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(13),
              // topRight: Radius.circular(32),
              bottomRight: Radius.circular(13),
              bottomLeft: Radius.circular(13)),
        ),
        child: Text(
            textAlign: TextAlign.right,
            message,
            // 'مرحبًا، أواجه صعوبة في فهم المعادلات الخطية. هل يمكنك مساعدتي؟',
            style: TextStyle(
              fontFamily: "NotoKufiArabic",
              color: Mycolor.white,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            )),
      ),
    );
  }
}

class ChatBubbleFreind extends StatelessWidget {
  const ChatBubbleFreind({required this.message, Key? key}) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        // height: 80,
        // width: 350,
        // height: MediaQuery.of(context).size.height * .07,
        padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * .05,
            left: MediaQuery.of(context).size.width * .05,
            top: MediaQuery.of(context).size.height * .015,
            bottom: MediaQuery.of(context).size.height * .02),
        margin: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(13),
            bottomRight: Radius.circular(13),
            bottomLeft: Radius.circular(13),
          ),
          color: Mycolor.lightgrey,
        ),
        child: Text(
            textAlign: TextAlign.right,
            message,
            // ' بالتأكيد! المعادلة الخطية هي معادلة من الدرجة الأولى، أي أن المتغير فيها ليس مرفوعًا للأس',
            style: TextStyle(
              fontFamily: "NotoKufiArabic",
              color: Mycolor.black,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            )),
      ),
    );
  }
}

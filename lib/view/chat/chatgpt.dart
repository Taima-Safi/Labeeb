import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:labbeb/core/const_data/app_colors.dart';
import 'dart:convert';

import 'package:labbeb/view/chat/chatBubble.dart';

import 'package:labbeb/view/exam/testapi.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];
  // final String apiKey = "YOUR_OPENAI_API_KEY";

  Future<void> sendMessage(String message) async {
    setState(() {
      messages.add({"role": "user", "text": message});
    });

    var response = await http.post(
      Uri.parse("http://labeeb.somee.com/api/OpenAI/ask2"),
      headers: {
        // "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "question": message,
        "studentAge": 10,
      }),
    );
    print("🔹 Full Response: ${response.body}");
    // print("Response: ${response.body}"); // **طباعة الاستجابة للتحقق منها**

    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body);

        if (data.containsKey("response")) {
          setState(() {
            messages.add({
              "role": "assistant",
              "text": data["response"] ?? "لا يوجد رد"
            });
          });
        } else {
          print("⚠️ Error: Response does not contain 'response' key.");
        }
      } catch (e) {
        print("⚠️ Error parsing response: $e");
      }
    } else {
      print("⚠️ Error: ${response.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        backgroundColor: Mycolor.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              children: [
                Text("لبيب",
                    style: TextStyle(
                      fontFamily: "NotoKufiArabic",
                      color: Mycolor.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    )),
                SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SubjectsListScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Image.asset("assets/Frame 2607208.png"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isUser = messages[index]["role"] == "user";
                return isUser
                    ? ChatBubble(message: messages[index]["text"]!)
                    : ChatBubbleFreind(message: messages[index]["text"]!);
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          children: [
            IconButton(
              icon: Image.asset("assets/Frame 1.png"),
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  sendMessage(_controller.text);
                  _controller.clear();
                }
              },
            ),
            Expanded(
              child: TextField(
                controller: _controller,
                minLines: 1,
                maxLines: 3,
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Mycolor.lightgrey,
                  hintText: 'اكتب سؤالك هنا',
                  hintStyle: TextStyle(
                    fontFamily: "NotoKufiArabic",
                    color: Mycolor.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                    borderSide: BorderSide(
                      color: Mycolor.lightgrey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                    borderSide: BorderSide(
                      color: Mycolor.lightgrey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//         child: SizedBox(
//           height: 50,
//           width: 350,
//           child: TextField(
// controller: _controller,
//             minLines: 1,
//             maxLines: 3,
//             textAlign: TextAlign.end,
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Mycolor.lightgrey,
//               hintText: 'اكتب سؤالك هنا',
//               hintStyle: TextStyle(
//                 fontFamily: "NotoKufiArabic",
//                 color: Mycolor.black,
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//               ),
//               prefixIcon: GestureDetector(
//                 onTap: (){if (_controller.text.isNotEmpty) {
//                   sendMessage(_controller.text);
//                   _controller.clear();
//                 }},
//                 child: Image.asset("assets/Frame 1.png")),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(13),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(13),
//                 borderSide: BorderSide(
//                   color: Mycolor.lightgrey,
//                 ),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(13),
//                 borderSide: BorderSide(
//                   color: Mycolor.lightgrey,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
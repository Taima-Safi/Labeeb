import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SubjectController extends GetxController {
  var isLoading = true.obs;
  var lessons = [].obs;
  var subjectTitle = "".obs; // 🆕 اسم المادة

  Future<void> fetchLessons(int subjectId) async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse(
            'http://labeeb.somee.com/api/Subject/GetAllLesson?subjectId=$subjectId'),
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        if (jsonData.isNotEmpty) {
          subjectTitle.value = jsonData[0]['subjectTitle']; // 🆕 اسم المادة
        }
        lessons.value = jsonData;
      } else {
        Get.snackbar("خطأ", "فشل تحميل البيانات");
      }
    } catch (e) {
      Get.snackbar("خطأ", e.toString());
    } finally {
      isLoading(false);
    }
  }
}

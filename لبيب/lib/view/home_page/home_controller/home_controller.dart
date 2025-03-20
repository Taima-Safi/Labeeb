import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:labeeb/modle/getallsubjects.dart';

class HomeController extends GetxController {
  var subjects = <Allcategorymodel>[].obs; // قائمة المواد الدراسية المراقبة
  var isLoading = false.obs;

  void fetchSubjects() async {
    try {
      final headers = {'accept': '*/*'};

      final response = await http.get(
        Uri.parse(
            'http://labeeb.somee.com/api/Subject/GetAllSubject'), // استبدل بالرابط الصحيح
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        subjects.value =
            jsonData.map((e) => Allcategorymodel.fromJson(e)).toList();
      } else {
        Get.snackbar(
            "خطأ", "فشل تحميل المواد الدراسية. (${response.statusCode})");
      }
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ أثناء تحميل المواد الدراسية: $e");
    } finally {}
  }

  @override
  void onInit() {
    fetchSubjects();
    super.onInit();
  }
}

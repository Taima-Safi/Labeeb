import 'package:dio/dio.dart';

Future<void> fetchExamQuestions(int examId) async {
  final String apiUrl =
      "http://labeeb.somee.com/api/Exam/GetExam?examId=$examId";
  Dio dio = Dio();

  try {
    Response response = await dio.get(
      apiUrl,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    print("Full Response: ${response.data}");

    if (response.statusCode == 200) {
      var data = response.data;
      print("✅ الأسئلة المستلمة: $data");
    } else {
      print("❌ خطأ في الطلب: ${response.statusCode}, ${response.data}");
    }
  } catch (e) {
    print("❌ استثناء أثناء جلب البيانات: $e");
  }
}

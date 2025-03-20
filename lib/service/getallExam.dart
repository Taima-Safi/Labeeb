import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> fetchSubjectsAndExams() async {
    try {
      final response =
          await _dio.get('http://labeeb.somee.com/api/Exam/GetAllSubjectExam');
      if (response.statusCode == 200) {
        List<Map<String, dynamic>> subjects =
            List<Map<String, dynamic>>.from(response.data);
        return subjects;
      } else {
        throw Exception('فشل في تحميل البيانات');
      }
    } catch (e) {
      print("Error: $e");
      throw Exception('حدث خطأ أثناء تحميل البيانات');
    }
  }
}

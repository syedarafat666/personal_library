import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:personal_library/services/api_servcies.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DeleteBookController extends GetxController {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void deleteBook(String bookId) async {
    try {
      final SharedPreferences prefs = await _prefs;
      var url = Uri.parse(ApiEndPoint.baseUrl + ApiEndPoint.authEndPoint.deleteBook + '/$bookId');
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('token')}'
      };

      http.Response response = await http.delete(url, headers: headers);
      if(response.statusCode == 204){
        print('Book $bookId deleted successfully');
      }else{
        throw Exception('Failed to update data. Error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception while updating data: $e');
      }
    }
  }
}

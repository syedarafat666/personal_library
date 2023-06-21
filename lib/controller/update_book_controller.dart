
// import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:personal_library/services/api_servcies.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UpdateBookController extends GetxController {
  TextEditingController bookNameController = TextEditingController();
  TextEditingController authorkNameController = TextEditingController();
  TextEditingController pagesController = TextEditingController();
  TextEditingController totalPagesReadController = TextEditingController();
  TextEditingController publishingYearController = TextEditingController();
  TextEditingController bookStatusController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
   // Variable for bookId

  void updateBook(int bookId) async {
    try {
      final SharedPreferences prefs = await _prefs;
      print('-------------${prefs.getString('token')}');
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('token')}'
      };
      
      Map body = {
        'bookId': bookId,
        'bookname': bookNameController.text,
        'authorname': authorkNameController.text,
        'publishyear': publishingYearController.text,
        'totalpages': pagesController.text,
        'totalread': totalPagesReadController.text,
        'bookstatus': bookStatusController.text,
      };
      var url =
          Uri.parse(ApiEndPoint.baseUrl + ApiEndPoint.authEndPoint.updateBook + '/$bookId' +'$body');

      http.Response response =
          await http.put(url, headers: headers);

      if (response.statusCode == 201) {
        // var result = jsonDecode(response.body);
        // print(result);
        // bookNameController.text = result['bookname'];
        // authorkNameController.text = result['authorname'];
        // totalPagesReadController.text = result['totalread'];
        // bookStatusController.text = result['bookstatus'];

        print('Book updated successfully');
        Get.snackbar('Yay!', 'Book updated successfully');
        bookNameController.clear();
        authorkNameController.clear();
        publishingYearController.clear();
        pagesController.clear();
        totalPagesReadController.clear();
        bookStatusController.clear();
        update();
      } else {
        throw Exception('Failed to update data. Error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception while updating data: $e');
      }
    }
  }
}

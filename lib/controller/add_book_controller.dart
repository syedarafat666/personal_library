// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_library/services/api_servcies.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddBookController extends GetxController {
  TextEditingController bookNameController = TextEditingController();
  TextEditingController authorkNameController = TextEditingController();
  TextEditingController pagesController = TextEditingController();
  TextEditingController totalPagesReadController = TextEditingController();
  TextEditingController publishingYearController = TextEditingController();
  TextEditingController bookStatusController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> addBook() async {
    try {
      final SharedPreferences prefs = await _prefs;
      print('-------------${prefs.getString('token')}');
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('token')}'
      };
      var url =
          Uri.parse(ApiEndPoint.baseUrl + ApiEndPoint.authEndPoint.addBooks);
      Map body = {
        'bookname': bookNameController.text,
        'authorname': authorkNameController.text,
        'publishyear': publishingYearController.text,
        'totalpages': pagesController.text,
        'totalread': totalPagesReadController.text,
        'bookstatus': bookStatusController.text,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 201) {
        print('Book posted successfully');
        Get.snackbar('Yay!', 'Book posted successfully');
        bookNameController.clear();
        authorkNameController.clear();
        publishingYearController.clear();
        pagesController.clear();
        totalPagesReadController.clear();
        bookStatusController.clear();
        update();
      } else {
        throw Exception(response.body.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
}

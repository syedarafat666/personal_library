import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_library/services/api_servcies.dart';
import 'package:personal_library/view/screens/library_reading_assistant_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SigninController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    try {
      // var headers = {'Content=type': 'application/json'};
      var url =
          Uri.parse(ApiEndPoint.baseUrl + ApiEndPoint.authEndPoint.loginEmail);
      Map body = {
        'email': emailController.text,
        'password': passwordController.text,
      };

      http.Response response = await http.post(
        url,
        body: body,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var token = data['token'];
        if (kDebugMode) {
          print(token);
        }
        final SharedPreferences pref = await _prefs;
        await pref.setString('token', token);
        if (kDebugMode) {
          print('Login Successfully');
        }
        emailController.clear();
        passwordController.clear();
        Get.off(const LibraryReadingAssistantScreen());
        update();
      } else {
        if (kDebugMode) {
          print('Request failed with status: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}

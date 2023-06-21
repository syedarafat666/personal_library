import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:personal_library/services/api_servcies.dart';
import 'package:personal_library/view/screens/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> signupUserWithEmail() async {
    try {
      var headers = {'Content-type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoint.baseUrl + ApiEndPoint.authEndPoint.registerEmail);
      Map body = {
        'name': nameController.text,
        'email': emailController.text.trim(),
        'password': passwordController.text,
        'confirm passwoed': confirmPasswordController.text,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        var token = data['token'];
        if (kDebugMode) {
          print(token);
        }
        final SharedPreferences pref = await _prefs;
        await pref.setString('token', token);

        emailController.clear();
        nameController.clear();
        passwordController.clear();
        Get.off(
          const SigninScreen(),
        );
      } else {
        Get.snackbar('Failed', 'Something went wrong');
      }
    } catch (e) {
      Get.snackbar('Failed', e.toString());
    }
  }
}

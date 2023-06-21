import 'dart:convert';

import 'package:get/get.dart';
import 'package:personal_library/models/book_stats_model.dart';
import 'package:personal_library/services/api_servcies.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class BooksStatsController extends GetxController {
  var bookStats = BooksStatsModel(
    totalFinished: 0,
    totalReading: 0,
    totalBooks: 0,
  ).obs;
  RxBool isLoading = false.obs;


  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() {
    getStats();
    super.onInit();
  }

 void getStats() async {
    try {
      isLoading.value = true;
      final SharedPreferences prefs = await _prefs;
      var url =
          Uri.parse(ApiEndPoint.baseUrl + ApiEndPoint.authEndPoint.bookStats);
      print('-------------${prefs.getString('token')}');
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('token')}'
      };

      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        bookStats.value = BooksStatsModel.fromJson(data);
        update();
      }else{
        throw Exception('Failed');
      }
    } catch (e) {
      throw Exception(e);
    } finally{
      isLoading.value = false;
    }
  }
}

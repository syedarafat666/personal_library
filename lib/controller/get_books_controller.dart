import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:personal_library/models/books_model.dart';
import 'package:personal_library/services/api_servcies.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyBooksController extends GetxController {
  RxList<BooksModel> booksList = <BooksModel>[].obs;
  RxBool isLoading = false.obs;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance(); 

  @override
  void onInit() {
    fetchBooks();
    super.onInit();
  }

  void fetchBooks() async {
    try {
      isLoading.value = true;
      final SharedPreferences prefs = await _prefs;
      print('-------------${prefs.getString('token')}');
      var headers = {'Content-Type': 'application/json',
      'Authorization': 'Bearer ${prefs.getString('token')}'};
      var url = Uri.parse(ApiEndPoint.baseUrl + ApiEndPoint.authEndPoint.getBooks);
  
      http.Response response = await http.get(url, headers: headers);


      if (response.statusCode == 201) {
        var jsonData = json.decode(response.body) as List;
        booksList.value = jsonData.map((item) => BooksModel.fromJson(item)).toList();
        update();
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
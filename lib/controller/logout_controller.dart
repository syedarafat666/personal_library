import 'package:get/get.dart';
import 'package:personal_library/services/api_servcies.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LogoutController extends GetxController{

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void logout() async {
    try{
      SharedPreferences prefs = await _prefs;
      var url = Uri.parse(ApiEndPoint.baseUrl + ApiEndPoint.authEndPoint.logout);
      print('-------------${prefs.getString('token')}');
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('token')}'
      };

      http.Response response = await http.get(url, headers: headers);
      if(response.statusCode == 200){
        print('Successful');
      }else{
        throw Exception('${response.body}');
      }
    }catch(e){
      print(e);
    }
  }
}
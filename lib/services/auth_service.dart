import 'package:digigarson_demo/models/session.dart';
import 'package:digigarson_demo/models/users.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';  //json işlemleri için

class AuthService {
  String url="https://api.digigarson.net/api/";

  Future<Session> loginUser(String email, String password) async {
    Session _session;
    String path=url+"sessions";

    final http.Response response = await http.post(
      Uri.parse(path),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> map=json.decode(response.body);
      _session=Session.fromJson(map);
      return _session;
    } else {
      return new Session("Hata", response.body);
    }
  }

  Future<Users> registerUser(String name, String email, String password,String password2) async {
    Users _user;
    String path=url+"users";

    final http.Response response = await http.post(
      Uri.parse(path),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
        "passwordConfirmation": password2,
        "name": name
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> map=json.decode(response.body);
      _user=Users.fromJson(map);
      return _user;
    } else {
      return new Users("", response.body,"Hata","","","");
    }
  }
}
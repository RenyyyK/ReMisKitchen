import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  late String token;
  late DateTime expiryDate;
  late String userId;

  Future<void> signup(String email, String password) async {
    final url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDaaM3yioT6kjRJg60hTNwyUFd7jAtQWyc');
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true
        },
      ),
    );
    print(json.decode(response.body));
  }
}
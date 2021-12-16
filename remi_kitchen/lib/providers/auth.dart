import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:remi_kitchen/models/http_exception.dart';

class Auth with ChangeNotifier {
  late String token;
  late DateTime expiryDate;
  late String userId;

  Future<void> authenticate(String? email, String? password, String urlSegment) async {
    final url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyDaaM3yioT6kjRJg60hTNwyUFd7jAtQWyc');
    try {
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
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch(error) {
      throw error;
    }
  }

  Future<void> signup(String? email, String? password) async {
    return authenticate(email, password, 'signUp');
  }

  Future<void> login(String? email, String? password) async {
    return authenticate(email, password, 'signInWithPassword');
  }
}
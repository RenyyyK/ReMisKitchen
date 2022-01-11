import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:remi_kitchen/models/http_exception.dart';

class Auth with ChangeNotifier {
  late String? token;
  DateTime? expiryDate;
  late String? userId;

  bool get isAuth {
    return getToken != null;
  }

  String? get getToken {
    if (expiryDate != null &&
        expiryDate!.isAfter(DateTime.now()) &&
        token != null) {
      return token;
    }
    return null;
  }

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
      print(responseData);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      token = responseData['idToken'];
      userId = responseData['localId'];
      expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      notifyListeners();
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

  void logout() {
    token = null;
    userId = null;
    expiryDate = null;
    notifyListeners();
  }
}
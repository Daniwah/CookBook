// ignore_for_file: use_build_context_synchronously

import 'package:cookbook/model/model_sign_in.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/services/service.dart';

class SignInViewModel with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final service = Services();
  bool rememberMe = false;
  bool heightContainer = false;
  ModelSignIn? dataLogin;

  Future<void> signIn() async {
    final emailUser = email.text;
    final passwordUser = password.text;
    final data = await service.signInAccount(emailUser, passwordUser);
    dataLogin = data;
    //email.clear;
    //password.clear;
    notifyListeners();
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      heightContainer = true;
      notifyListeners();
      return 'Email tidak boleh kosong';
    } else if (!EmailValidator.validate(value)) {
      heightContainer = true;
      notifyListeners();
      return 'Format email salah';
    }
    heightContainer = false;
    notifyListeners();
    return null;
  }

  String? validatePassword(String value) {
    heightContainer = true;
    notifyListeners();
    if (value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    heightContainer = false;
    notifyListeners();
    return null;
  }
}

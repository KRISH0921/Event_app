import 'package:flutter/material.dart';

class SignInInactiveProvider extends ChangeNotifier{

  bool show = true;

  void change() {
    show = !show;
    notifyListeners();
  }
}
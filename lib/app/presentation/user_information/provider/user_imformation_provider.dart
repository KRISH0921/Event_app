import 'package:flutter/material.dart';

class UserInformationProvider extends ChangeNotifier{

  bool gender = true;

  void change (){
    gender = !gender;
    notifyListeners();
  }
}

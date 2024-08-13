import 'package:event_app/app/presentation/select_location_two/model/select_Location_model.dart';
import 'package:flutter/material.dart';

class SelectLocationProvider extends ChangeNotifier {

  List<SelectLocationModel> locationList = <SelectLocationModel>[
    SelectLocationModel(title: "San Isidro"),
    SelectLocationModel(title: "Rubtsovsk,"),
    SelectLocationModel(title: "Omsk"),
    SelectLocationModel(title: "Sterlitamak"),
    SelectLocationModel(title: "Bahía Blanca"),
    SelectLocationModel(title: "La Plata"),
    SelectLocationModel(title: "Resistencia"),
    SelectLocationModel(title: "Mar del Plata"),
    SelectLocationModel(title: "Chelyabinsk"),

  ];

  int? show;

  void change(int value){
    show = value;
    notifyListeners();
  }

}
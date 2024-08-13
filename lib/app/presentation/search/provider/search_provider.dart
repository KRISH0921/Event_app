
import 'package:event_app/app/presentation/search/model/search_model.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {

  List<SearchModel> searchList = [
    SearchModel(name: "Music Event",image: "assets/images/clock.svg",subImage: "assets/images/close.svg"),
    SearchModel(name: "Design Conference",image: "assets/images/clock.svg",subImage: "assets/images/close.svg"),
    SearchModel(name: "UI UX Webinars",image: "assets/images/clock.svg",subImage: "assets/images/close.svg"),
    SearchModel(name: "Adam Levine Concert",image: "assets/images/clock.svg",subImage: "assets/images/close.svg"),
  ];
}
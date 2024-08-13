import 'package:event_app/app/presentation/home_screen/model/home_model.dart';
import 'package:event_app/app/presentation/home_screen/model/get_favorite_event.dart';
import 'package:event_app/app/presentation/home_screen/model/home_screen_model.dart';
import 'package:event_app/app/utils/post_api.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {

  bool process = false;

  void changeProcess(){
    process = !process;
    notifyListeners();
  }

  List<HomeScreenModel> eventList = <HomeScreenModel>[
    HomeScreenModel(title: "Business", image: "assets/images/bag.png"),
    HomeScreenModel(title: "Sport", image: "assets/images/boll.png"),
    HomeScreenModel(title: "Community", image: "assets/images/hand.png"),
    HomeScreenModel(title: "Art", image: "assets/images/art.png"),
    HomeScreenModel(title: "Hackathon", image: "assets/images/hackathon.png"),
  ];



  List<HomeScreenModel> homeList = [
    HomeScreenModel(
        subImage: "assets/images/Rectangle.png",
        subTitle: "Artistics Museum 2024",
        image: "assets/images/Component.svg",
        title: "Town Hall London",
        name: "Sep 06 2024",
        subTimage: "assets/images/Avatars.png",
        subName: "Interested",

    ),
    HomeScreenModel(
        subImage: "assets/images/Rectangletwo.png",
        subTitle: "Artistics Museum 2024",
        image: "assets/images/Component.svg",
        title: "Town Hall Germany",
        name: "Sep 12 204",
        subTimage: "assets/images/Avatars.png",
        subName: "Interested",
    ),
    HomeScreenModel(
        subImage: "assets/images/Rectangle.png",
        subTitle: "Artistics Museum 2024",
        image: "assets/images/Component.svg",
        title: "Town Hall America",
        name: "Sep 11 2024",
        subTimage: "assets/images/Avatars.png",
        subName: "Interested",
    ),
    HomeScreenModel(
        subImage: "assets/images/Rectangletwo.png",
        subTitle: "Artistics Museum 2024",
        image: "assets/images/Component.svg",
        title: "Town Hall Australia",
        name: "Sep 13 2024",
        subTimage: "assets/images/Avatars.png",
        subName: "Interested",
    ),
  ];

  List<HomeScreenModel> upcomingList = [
    HomeScreenModel(
        subTitle: "Asia Dance Competion",
        title: "Kamisama Art Club",
        name: "Sep 14 · 9:00 AM",
        subName: "\$.39",
        subTimage: "assets/images/AsiaDance.png",
        image: "assets/images/calendar.svg",
        subImage: "assets/images/ticketshow.svg"),
    HomeScreenModel(
        subTitle: "Lois Photographic Event",
        title: "Kamisama Art Club",
        name: "Sep 21 · 11:00 AM",
        subName: "\$.30",
        subTimage: "assets/images/Lois.png",
        image: "assets/images/calendar.svg",
        subImage: "assets/images/ticketshow.svg"),
    HomeScreenModel(
        subTitle: "Asia Dance Competion",
        title: "Kamisama Art Club",
        name: "Sep 30 · 8:00 AM",
        subName: "\$.50",
        subTimage: "assets/images/AsiaDance.png",
        image: "assets/images/calendar.svg",
        subImage: "assets/images/ticketshow.svg"),
    HomeScreenModel(
        subTitle: "Lois Photographic Event",
        title: "Kamisama Art Club",
        name: "Nov 10 · 10:00 AM",
        subName: "\$.60",
        subTimage: "assets/images/Lois.png",
        image: "assets/images/calendar.svg",
        subImage: "assets/images/ticketshow.svg"),
  ];

  List<HomeScreenModel> createList = [

    HomeScreenModel(image: "assets/images/Boximage.png",subImage: "assets/images/add.svg"),
    HomeScreenModel(image: "assets/images/Boximage.png",subImage: "assets/images/add.svg"),
    HomeScreenModel(image: "assets/images/Boximage.png",subImage: "assets/images/add.svg"),
    HomeScreenModel(image: "assets/images/Boximage.png",subImage: "assets/images/add.svg"),
    HomeScreenModel(image: "assets/images/Boximage.png",subImage: "assets/images/add.svg"),
  ];


  int? topia;

  void change(int value) {
    topia = value;
    notifyListeners();
  }

  int i = 0;

  void changePage(int value) {
    i = value;
    notifyListeners();
  }


  Future<Event> getPopularData() async {
    // notifyListeners();
    return await PostApi().popularEvent();
  }

  Future<GetFavoriteEvent> favoriteEvent() async {
    // notifyListeners();
    return PostApi().getFavoriteEvent("6629109e677004d41fd5d542", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MjkxMDllNjc3MDA0ZDQxZmQ1ZDU0MiIsImlhdCI6MTcxOTM4OTY4OX0.W9FcjO8nxRrrWKjvoqsXP8TmQRDRvD-L0qQ2qSBPECA");

  }


}

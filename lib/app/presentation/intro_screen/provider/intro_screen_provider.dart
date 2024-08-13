import 'package:event_app/app/presentation/intro_screen/model/intro_screen_model.dart';
import 'package:flutter/material.dart';

class IntroScreenProvider extends ChangeNotifier {

  List<IntroScreenModel> eventList = <IntroScreenModel>[
    IntroScreenModel(
        title: "Welcome to",
        name: "Online Event App",
        subTitle: "Find the Best event near you",
        subName: "with just one of best app",
        image: "assets/images/Onboardingone.png"),
    IntroScreenModel(
        title: "Organized",
        name: "A Premium Events",
        subTitle: "Find the Best event near you",
        subName: "with just one of best app",
        image: "assets/images/Onboardingtwo.png"),
    IntroScreenModel(
        title: "Find and",
        name: "Book a Event",
        subTitle: "Find the Best event near you",
        subName: "with just one of best app",
        image: "assets/images/Onboardingthree.png"),
  ];

}

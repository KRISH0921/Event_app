import 'package:event_app/app/presentation/home_screen/provider/home_screen_provider.dart';
import 'package:event_app/app/presentation/home_screen/tab/tab_createvent.dart';
import 'package:event_app/app/presentation/home_screen/tab/tab_home.dart';
import 'package:event_app/app/presentation/home_screen/tab/tab_like.dart';
import 'package:event_app/app/presentation/home_screen/tab/tab_profile.dart';
import 'package:event_app/app/presentation/home_screen/tab/tab_ticket.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenProvider? providerT;
  HomeScreenProvider? providerF;

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<HomeScreenProvider>(context, listen: true);
    providerF = Provider.of<HomeScreenProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: providerT!.i,
          children: [
            TabHome(),
            TabLike(),
            TabCreateEvent(),
            TabTicket(),
            TabProfile(),
          ],
        ),
      ),
      bottomNavigationBar:
      Theme(
      data: ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    ),child : BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          providerT!.changePage(value);
        },

        selectedItemColor: Colors.cyan,
        showUnselectedLabels: true,
        currentIndex: providerT!.i,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/home.svg"),
            activeIcon: SvgPicture.asset("assets/images/homefill.svg",),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/heart.svg"),
            activeIcon: SvgPicture.asset("assets/images/heartfill.svg"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Group.svg"),
            activeIcon: SvgPicture.asset("assets/images/Group.svg"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/ticket.svg"),
            activeIcon: SvgPicture.asset("assets/images/ticketfill.svg"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/user.svg"),
            activeIcon: SvgPicture.asset("assets/images/userfill.svg"),
            label: "",
          ),
        ],
      ),),
    );
  }
}

import 'package:event_app/app/components/coustom_appbar.dart';
import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabTicket extends StatefulWidget {
  const TabTicket({super.key});

  @override
  State<TabTicket> createState() => _TabTicketState();
}

class _TabTicketState extends State<TabTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              name: "View Ticket",
              textAlign: TextAlign.center,
              fontSize: 18.sp,
            ),          ],
        ),
      ),

    );
  }
}

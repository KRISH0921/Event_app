import 'package:event_app/app/components/custom_button.dart';
import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationScreen extends StatefulWidget {
  const   LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Expanded(
           child: Image.asset("assets/images/Mapl.png",fit: BoxFit.cover,width: double.infinity,),
         ),
         Container(
           width: double.infinity,
           child: Column(
             children: [
               SizedBox(height: 42.h,),
               customText(
                   name: "Find Best Event",
                   fontSize: 28.sp,
                   color: primaryBlack,
                   fontFamily: "UrbanistBold"),
               Padding(
                 padding: EdgeInsets.only(bottom: 16.h),
                 child: customText(
                     name: "Near you",
                     fontSize: 28.sp,
                     color: primaryBlack,
                     fontFamily: "UrbanistBold"),
               ),
               customText(
                   name: "By enabling your location, you help us",
                   fontSize: 16.sp,
                   color: primaryBoulder,
                   fontFamily: "UrbanistRegular"),
               customText(
                   name: "provide recommendations for events around",
                   fontSize: 16.sp,
                   color: primaryBoulder,
                   fontFamily: "UrbanistRegular"),
               Padding(
                 padding: EdgeInsets.only(bottom: 21.h),
                 child: customText(
                     name: " you.",
                     fontSize: 16.sp,
                     color: primaryBoulder,
                     fontFamily: "UrbanistRegular"),
               ),
               Padding(
                 padding: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 14.h),
                 child: CustomButton(
                   name: "Enable location",
                   onTap: () {
                     Navigator.pushNamed(context, "select");
                   },
                 ),
               ),
               Padding(
                 padding: EdgeInsets.only(bottom: 14.h),
                 child: GestureDetector(
                   onTap: () {
                     Navigator.pushNamed(context, "choose");
                   },
                   child: customText(
                       name: "Not now",
                       fontSize: 16.sp,
                       color: primaryMist,
                       fontFamily: "UrbanistMedium"),
                 ),
               ),
             ],
           ),
         ),
        ],
      ),
    );
  }
}

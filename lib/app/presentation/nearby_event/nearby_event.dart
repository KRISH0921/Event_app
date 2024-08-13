import 'package:event_app/app/components/coustom_appbar.dart';
import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearbyEvent extends StatefulWidget {
  const NearbyEvent({super.key});

  @override
  State<NearbyEvent> createState() => _NearbyEventState();
}

class _NearbyEventState extends State<NearbyEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              textAlign: TextAlign.center,
              name: "Nearby Events",
              fontSize: 18.sp,
              fontFamily: "UrbanistSemiBold",
            ),
            Expanded(
              child: Stack(

                children: [
                  Image.asset(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    "assets/images/Mapview.png",
                  ),
                  Positioned(
                    bottom: 32.h,
                    left: 24.h,
                    right: 24.h,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.r)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.h,),
                        child: Row(
                          children: [
                            Image.asset("assets/images/view.png",height: 100.h,width: 103.h,),
                            SizedBox(width: 16.h),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: 21.h,bottom: 22.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    customText(name: "International\nArt & Museum Festival",color: primaryBlack,fontSize: 16.sp,fontFamily: "UrbanistBold"),
                                    customText(name: "Distance: 1 km",color: primaryBoulder,fontSize: 12.sp,fontFamily: "UrbanistMedium"),
                                    customText(name: "\$41.00",color: primaryBlack,fontSize: 16.sp,fontFamily: "UrbanistBold"),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

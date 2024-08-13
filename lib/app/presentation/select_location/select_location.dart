import 'package:event_app/app/components/custom_button.dart';
import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.h, left: 24.h),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset("assets/images/arrowleft.svg"),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24.h, top: 48.h),
                    child: customText(name: "Select Location",fontSize: 28.sp,color: primaryBlack,fontFamily: "UrbanistBold"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.h, top: 10.h),
                    child: customText(name: "Select your own language",fontSize: 16.sp,color: primaryBoulder,fontFamily: "UrbanistRegular"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 43.h, left: 43.h),
                    child: customText(name: "Location", fontSize: 12.sp,color: primaryAshGrey,fontFamily: "UrbanistMedium"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7.h, left: 24.h, right: 24.h),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "selecttwo");
                      },
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: primaryMercury),
                            borderRadius: BorderRadius.all(Radius.circular(30.r))),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.h, right: 28.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customText(
                                  name: "San Isidro",
                                  color: primaryBlack,
                                  fontSize: 14.sp,fontFamily: "UrbanistRegular"),
                              SvgPicture.asset("assets/images/Layer.svg"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),  
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.h,right: 24.h,bottom: 24.h),
              child: CustomButton(
                name: "Continue",
                onTap: () {
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

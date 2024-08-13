import 'package:event_app/app/components/coustom_appbar.dart';
import 'package:event_app/app/components/coustom_profile.dart';
import 'package:event_app/app/components/custom_button.dart';
import 'package:event_app/app/components/custom_sub_button.dart';
import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabProfile extends StatefulWidget {
  const TabProfile({super.key});

  @override
  State<TabProfile> createState() => _TabProfileState();
}

class _TabProfileState extends State<TabProfile> {
  String image = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(
              name: "Profile",
              textAlign: TextAlign.center,
              fontSize: 18.sp,
              fontFamily: "UrbanistSemiBold",
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.h, left: 24.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset("assets/images/Image.png",
                            height: 56.h, width: 56.h),
                        SizedBox(width: 12.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                                name: "Julia Smith",
                                fontSize: 18.sp,
                                color: primaryBlack,
                                fontFamily: "PlusJakartaSansSemiBold"),
                            customText(
                                name: "Julia Smith",
                                fontSize: 12.sp,
                                color: primaryDoveGrey,
                                fontFamily: "UrbanistMedium"),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 24.h),
                          child: GestureDetector(
                            child: SvgPicture.asset("assets/images/Edit.svg"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 24.h,
                      right: 24.h,
                    ),
                    child: Column(
                      children: [
                        CustomProfile(
                          width: 24.h,
                          svgPicture: "assets/images/userT.svg",
                          widthone: 12.h,
                          name: "Personal Information",
                          fontFamily: "UrbanistMedium",
                          onTap: () {
                            Navigator.pushNamed(context, "user");
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CustomProfile(
                          width: 24.h,
                          svgPicture: "assets/images/ball.svg",
                          widthone: 12.h,
                          name: "Notification",
                          fontFamily: "UrbanistMedium",
                          onTap: () {
                            Navigator.pushNamed(context, "");
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CustomProfile(
                          width: 24.h,
                          svgPicture: "assets/images/message.svg",
                          widthone: 12.h,
                          name: "FAQ",
                          fontFamily: "UrbanistMedium",
                          onTap: () {},
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CustomProfile(
                          width: 24.h,
                          svgPicture: "assets/images/ball.svg",
                          widthone: 12.h,
                          name: "Notification",
                          fontFamily: "UrbanistMedium",
                          onTap: () {},
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CustomProfile(
                          width: 24.h,
                          svgPicture: "assets/images/language.svg",
                          widthone: 12.h,
                          name: "Language",
                          fontFamily: "UrbanistMedium",
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 30.h, left: 24.h, right: 24.h, bottom: 16.h),
                    child: CustomSubButton(
                      height: 64.h,
                      name: "Log Out",
                      textColor: primaryLightRed,
                      borderColor: primaryLightRed,
                      fontSize: 14.sp,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 228.h,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  SizedBox(height: 30.h,),
                                  customText(
                                      name: "Logout",
                                      color: primaryBlack,
                                      fontSize: 18.sp,
                                      fontFamily: "UrbanistBold"),
                                  SizedBox(height: 20.h,),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text:
                                                "Are you sure you want to log out of ",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color: primaryBoulder,
                                                fontFamily: "UrbanistRegular")),
                                        TextSpan(
                                          text: "Julia",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: primaryBlack,
                                              fontFamily: "UrbanistSemiBold"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.h,),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Smith ",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: primaryBlack,
                                              fontFamily: "UrbanistSemiBold"),
                                        ),
                                        TextSpan(
                                          text: "account? ",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: primaryBoulder,
                                              fontFamily: "UrbanistRegular"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 30.h, right: 30.h, bottom: 20.h),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CustomSubButton(
                                            name: "Cancel",
                                            fontSize: 16.sp,
                                            fontFamily: "UrbanistSemiBold",
                                            textColor: primaryRed,
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 31.h,),
                                        Expanded(
                                          child: CustomButton(
                                            name: "Logout",
                                            fontFamily: "UrbanistSemiBold",
                                            onTap: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

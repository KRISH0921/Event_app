import 'package:event_app/app/components/custom_button.dart';
import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/components/custom_text_field.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                    child: customText(name: "Input Your Email",fontSize: 28.sp,color: primaryBlack,fontFamily: "UrbanistBold"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.h, top: 10.h),
                    child: customText(name: "Your Email address",fontSize: 16.sp,color:primaryBoulder,fontFamily: "UrbanistRegular"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 36.h,top: 33.h),
                    child: customText(name: "Email",fontSize: 12.sp,color: primaryAshGrey,fontFamily: "UrbanistMedium"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7.h,left: 24.h,right: 24.h),
                    child: CustomTextFromField(hintText: "Enter your email"),
                  ),  
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:24.h,right:24.h,bottom: 30.h),
              child: CustomButton(
                name: "Submit",
                onTap: () {
                  Navigator.pushNamed(context, "login");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

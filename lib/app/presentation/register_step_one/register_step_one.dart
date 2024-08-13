import 'package:event_app/app/components/custom_button.dart';
import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/components/custom_text_field.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterStepOne extends StatefulWidget {
  const RegisterStepOne({super.key});

  @override
  State<RegisterStepOne> createState() => _RegisterStepOneState();
}

class _RegisterStepOneState extends State<RegisterStepOne> {
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
                    child: customText(name: "Register your account",fontSize: 28.sp,color: primaryBlack,fontFamily: "UrbanistBold"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.h, top: 10.h),
                    child: customText(name: "Create your Account",fontSize: 16.sp,color: primaryBoulder,fontFamily: "UrbanistRegular"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 36.46.h, left: 43.h),
                    child: customText(name: "First Name", fontSize: 12.sp,color: primaryAshGrey,fontFamily: "UrbanistMedium"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.h, right: 24.h, top: 7.h),
                    child: CustomTextFromField(hintText: "First Name"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 36.h, top: 23.h),
                    child: customText(name: "Last Name", fontSize: 12.sp,color: primaryAshGrey,fontFamily: "UrbanistMedium"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.h, right: 24.h, top: 7.h),
                    child: CustomTextFromField(hintText: "Last Name"),
                  ),
                  SizedBox(
                    height: 17.27,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h,vertical: 24.h),
              child: CustomButton(
                name: "Continue",
                onTap: () {
                  Navigator.pushNamed(context, "registerTwo");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

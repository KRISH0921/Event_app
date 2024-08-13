import 'package:event_app/app/components/custom_button.dart';
import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/components/custom_text_field.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterStepTwo extends StatefulWidget {
  const RegisterStepTwo({super.key});

  @override
  State<RegisterStepTwo> createState() => _RegisterStepTwoState();
}

class _RegisterStepTwoState extends State<RegisterStepTwo> {
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
                    padding: EdgeInsets.only(top: 36.h, left: 43.h),
                    child: customText(name: "Email", fontSize: 12.sp,color: primaryAshGrey,fontFamily: "UrbanistMedium"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.h, right: 24.h, top: 7.h),
                    child: CustomTextFromField(hintText: "Email"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 36.h, left: 43.h),
                    child: customText(name: "Password", fontSize: 12.sp,color: primaryAshGrey,fontFamily: "UrbanistMedium"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.h, right: 24.h, top: 7.h),
                    child: CustomTextFromField(hintText: "Password"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 36.h, top: 23.h),
                    child: customText(name: "Confirm Password", fontSize: 12.sp,color: primaryAshGrey,fontFamily: "UrbanistMedium"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.h, right: 24.h, top: 7.h),
                    child: CustomTextFromField(hintText: "Confirm password"),
                  ),
                  SizedBox(
                    height: 17.27,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: customText(
                        name:
                        "Your password must include at least one symbol and be 8 or more characters long.",
                        fontSize: 12.sp,color: primaryAshGrey,fontFamily: "UrbanistRegular"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h,vertical: 24.h),
              child: CustomButton(
                name: "Create Password",
                onTap: () {
                  Navigator.pushNamed(context, "otp");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

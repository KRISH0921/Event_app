import 'package:event_app/app/components/custom_button.dart';
import 'package:event_app/app/components/custom_sub_button.dart';
import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/components/custom_text_field.dart';
import 'package:event_app/app/presentation/sign_in_inactive/provider/sing_in_inactive_provider.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SignInInactive extends StatefulWidget {
  const SignInInactive({super.key});

  @override
  State<SignInInactive> createState() => _SignInInactiveState();
}

class _SignInInactiveState extends State<SignInInactive> {

  SignInInactiveProvider? providerT;
  SignInInactiveProvider? providerF;


  @override
  Widget build(BuildContext context) {

    providerT = Provider.of<SignInInactiveProvider>(context, listen: true);
    providerF = Provider.of<SignInInactiveProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24.h, top: 48.h),
                    child: customText(name: "Input Your Email",fontSize: 28.sp,color: primaryBlack,fontFamily: "UrbanistBold"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.h, top: 10.h),
                    child: customText(name: "Your Sign in details ",fontSize: 16.sp,color: primaryAshGrey,fontFamily: "UrbanistRedular"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 36.46.h, top: 60.h),
                    child: customText(name: "Email", fontSize: 12.sp,color: primaryAshGrey,fontFamily: "UrbanistMedium"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7.h, left: 24.h, right: 24.h),
                    child: CustomTextFromField(hintText: "Enter your email",),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 36.h, top: 24.h),
                    child: customText(name: "Password", fontSize: 12.sp,color: primaryAshGrey,fontFamily: "UrbanistMedium"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7.h, left: 24.h, right: 24.h),
                    child: CustomTextFromField(hintText: "Enter your password"),
                  ),

                  GestureDetector(
                    onTap: (){
                      providerT!.change();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.h,left: 24.h,right: 24.h),
                      child: Row(
                        children: [
                          providerT!.show == true ? SvgPicture.asset("assets/images/stoptwo.svg"): SvgPicture.asset("assets/images/stop.svg",),
                          SizedBox(width: 5.h),
                          customText(name: "Remember me", fontSize: 14.sp,color: primaryAshGrey,fontFamily: "UrbanistMedium"),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "forgot");
                              },
                              child: customText(name: "Forgot password", fontSize: 14.sp,color: primaryAshGrey,fontFamily: "UrbanistMedium"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: CustomSubButton(
                name: "Create Account",
                onTap: () {
                  Navigator.pushNamed(context, "registerone");
                },
              ),
            ),
            SizedBox(height: 16.h,),
            Padding(
              padding: EdgeInsets.only(left: 24.h,right: 24.h,bottom: 38.h),
              child: CustomButton(
                name: "Sign In",
                onTap: () {
                  Navigator.pushNamed(context, "home");
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset("assets/images/Google.svg"),
                  SvgPicture.asset("assets/images/Facebook.svg"),
                  SvgPicture.asset("assets/images/Insta.svg"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

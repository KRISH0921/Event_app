import 'dart:io';

import 'package:event_app/app/components/coustom_appbar.dart';
import 'package:event_app/app/components/coustom_profile.dart';
import 'package:event_app/app/components/custom_button.dart';
import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/components/custom_text_field.dart';
import 'package:event_app/app/presentation/user_information/provider/user_imformation_provider.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  UserInformationProvider? providerT;
  UserInformationProvider? providerF;

  String image = "";

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<UserInformationProvider>(context, listen: true);
    providerF = Provider.of<UserInformationProvider>(context, listen: true);

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
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment(1, 0.9),
                      children: [
                        Container(
                          height: 94.h,
                          width: 100.h,
                          decoration: BoxDecoration(
                            image: image == ""
                                ? DecorationImage(image: AssetImage("assets/images/userp.png"),
                            )
                                : DecorationImage(image: FileImage(File(image)),fit: BoxFit.fill,),
                            shape: BoxShape.circle,
                            color: primaryWhite,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context, builder: (context) {
                                  return AlertDialog(
                                    content: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(height: 30.73.h,),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 30.13.h),
                                            child: customText(name: "Change your picture",color: primaryBlack,fontSize: 22.sp,fontFamily: "UrbanistSemiBold"),
                                          ),
                                          Divider(
                                            color: primaryAshGrey,
                                          ),
                                          SizedBox(height: 19.21.h,),
                                          CustomProfile(
                                            onTap: () async {
                                              ImagePicker picker = ImagePicker();
                                              XFile? xFile = await picker.pickImage(
                                                  source: ImageSource.camera);
                                              setState(
                                                    () {
                                                  image = xFile!.path;
                                                },
                                              );
                                              Navigator.pop(context);
                                            },
                                            height: 57.62.h,
                                            width: 18.2.h,
                                            name: "Take a photo",
                                            widthone: 16.2.h,
                                            fontSize: 14.sp,
                                            fontFamily: "UrbanistBold",
                                            subColor: primaryWhiteSmoke,
                                            svgPicture: "assets/images/Camera.svg",
                                          ),
                                          SizedBox(height: 19.21.h,),
                                          CustomProfile(
                                            onTap: () async {
                                              ImagePicker picker = ImagePicker();
                                              XFile? xFile = await picker.pickImage(
                                                  source: ImageSource.gallery);
                                              setState(() {
                                                image = xFile!.path;
                                              });
                                              Navigator.pop(context);
                                            },
                                            height: 57.62.h,
                                            width: 18.2.h,
                                            name: "Choose from your file",
                                            widthone: 16.2.h,
                                            fontSize: 14.sp,
                                            fontFamily: "UrbanistBold",
                                            subColor: primaryWhiteSmoke,
                                            svgPicture: "assets/images/file.svg",
                                          ),
                                          SizedBox(height: 19.21.h,),
                                          CustomProfile(onTap: (){

                                          },
                                            height: 57.62.h,
                                            width: 18.2.h,
                                            name: "Delete Photo",
                                            widthone: 16.2.h,
                                            fontSize: 14.sp,
                                            fontFamily: "UrbanistBold",
                                            color: primaryRed,
                                            subColor: primaryWhiteSmoke,
                                            svgPicture: "assets/images/bin.svg",
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                            );
                          },
                          child: SvgPicture.asset("assets/images/Editp.svg",height: 32.h,width: 32.h,),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 30.h, top: 23.h, bottom: 7.h),
                    child: customText(
                        name: "First Name",
                        color: primaryAshGrey,
                        fontSize: 12.sp,
                        fontFamily: "UrbanistMedium"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h, right: 38.h),
                    child: CustomTextFromField(hintText: "First Name"),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 30.h, top: 23.h, bottom: 7.h),
                    child: customText(
                        name: "Last Name",
                        color: primaryAshGrey,
                        fontSize: 12.sp,
                        fontFamily: "UrbanistMedium"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h, right: 38.h),
                    child: CustomTextFromField(hintText: "Last Name"),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 30.h, top: 23.h, bottom: 7.h),
                    child: customText(
                        name: "Email",
                        color: primaryAshGrey,
                        fontSize: 12.sp,
                        fontFamily: "UrbanistMedium"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h, right: 38.h),
                    child: CustomTextFromField(hintText: "Email"),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 30.h, top: 23.h, bottom: 7.h),
                    child: customText(
                        name: "Date of Birth",
                        color: primaryAshGrey,
                        fontSize: 12.sp,
                        fontFamily: "UrbanistMedium"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h, right: 38.h),
                    child: CustomTextFromField(hintText: "Date of Birth"),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 30.h, top: 23.h, bottom: 7.h),
                    child: customText(
                        name: "Gender",
                        color: primaryAshGrey,
                        fontSize: 12.sp,
                        fontFamily: "UrbanistMedium"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h, right: 38.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              providerT!.change();
                            },
                            child: Container(
                              height: 50.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: primaryMercury),
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 20.h),
                                  providerT!.gender == true
                                      ? SvgPicture.asset(
                                          "assets/images/check.svg")
                                      : SvgPicture.asset(
                                          "assets/images/checkfill.svg"),
                                  SizedBox(width: 10.h),
                                  customText(name: "Female",color: primaryAshGrey,fontSize: 14.sp,fontFamily: "UrbanistMedium")
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 37.h,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              providerT!.change();
                            },
                            child: Container(
                              height: 50.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: primaryMercury),
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 20.h),
                                  providerT!.gender == true
                                      ? SvgPicture.asset(
                                          "assets/images/checkfill.svg")
                                      : SvgPicture.asset(
                                          "assets/images/check.svg"),
                                  SizedBox(width: 10.h),
                                  customText(name: "Male",color: primaryAshGrey,fontSize: 14.sp,fontFamily: "UrbanistMedium")
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
            SizedBox(height: 49.h,),
            Padding(
              padding: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 5.h),
              child: CustomButton(
                name: "Save Changes",
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

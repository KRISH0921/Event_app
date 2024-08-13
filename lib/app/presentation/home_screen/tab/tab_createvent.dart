import 'package:event_app/app/components/coustom_appbar.dart';
import 'package:event_app/app/components/custom_button.dart';
import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/components/custom_text_field.dart';
import 'package:event_app/app/presentation/home_screen/model/home_screen_model.dart';
import 'package:event_app/app/presentation/home_screen/provider/home_screen_provider.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class TabCreateEvent extends StatefulWidget {
  const TabCreateEvent({super.key});

  @override
  State<TabCreateEvent> createState() => _TabCreateEventState();
}

class _TabCreateEventState extends State<TabCreateEvent> {
  HomeScreenProvider? providerT;
  HomeScreenProvider? providerF;

  String image = "";

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<HomeScreenProvider>(context, listen: true);
    providerF = Provider.of<HomeScreenProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              textAlign: TextAlign.center,
              name: "Create Event",
              fontSize: 18.sp,
            ),
            Expanded(
              child: ListView(
                primary: true,
                shrinkWrap: false,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 24.h, left: 32.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Event Details",
                            style: TextStyle(
                                color: primaryBlack,
                                fontSize: 12.sp,
                                fontFamily: "UrbanistSemiBold"),
                          ),
                          TextSpan(
                            text: "*",
                            style:
                                TextStyle(color: primaryRed, fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.h, left: 24.h, right: 24.h),
                    child: CustomTextFromField(hintText: "Event Details"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 22.h, left: 32.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Event type",
                            style: TextStyle(
                                color: primaryBlack,
                                fontSize: 12.sp,
                                fontFamily: "UrbanistSemiBold"),
                          ),
                          TextSpan(
                              text: "*",
                              style:
                                  TextStyle(color: primaryRed, fontSize: 12.sp))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.h, left: 24.h, right: 24.h),
                    child: CustomTextFromField(hintText: "Event Type"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 22.h, left: 32.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Select Date",
                            style: TextStyle(
                                color: primaryBlack,
                                fontSize: 12.sp,
                                fontFamily: "UrbanistSemiBold"),
                          ),
                          TextSpan(
                              text: "*",
                              style:
                                  TextStyle(color: primaryRed, fontSize: 12.sp))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.h, left: 24.h, right: 24.h),
                    child: CustomTextFromField(
                      hintText: "Select Date",
                      subIcon: Icon(
                        Icons.date_range_rounded,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 22.h, left: 32.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Add Location",
                            style: TextStyle(
                                color: primaryBlack,
                                fontSize: 12.sp,
                                fontFamily: "UrbanistSemiBold"),
                          ),
                          TextSpan(
                              text: "*",
                              style:
                                  TextStyle(color: primaryRed, fontSize: 12.sp))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.h, left: 24.h, right: 24.h),
                    child: CustomTextFromField(hintText: "Add Location"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 22.h, left: 32.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Event image",
                            style: TextStyle(
                                color: primaryBlack,
                                fontSize: 12.sp,
                                fontFamily: "UrbanistSemiBold"),
                          ),
                          TextSpan(
                              text: "*",
                              style:
                                  TextStyle(color: primaryRed, fontSize: 12.sp))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 80.h,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 24.h),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        HomeScreenModel show = providerF!.createList[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.h),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  ImagePicker picker = ImagePicker();
                                  XFile? xFile = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(
                                    () {
                                      image = xFile!.path;
                                    },
                                  );
                                },
                              child: Stack(
                                  children: [
                                    Image.asset(
                                      "${show.image}",
                                      height: 80.h,
                                      width: 83.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 28.h, horizontal: 28.h),
                                      child:
                                          SvgPicture.asset("${show.subImage}"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 22.h, left: 32.h),
                    child: customText(
                        name: "Upload up to 5 image",
                        fontSize: 12.sp,
                        color: primaryAshGrey,
                        fontFamily: "UrbanistRegular"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24.h, left: 32.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "About Event",
                            style: TextStyle(
                                color: primaryBlack,
                                fontSize: 12.sp,
                                fontFamily: "UrbanistSemiBold"),
                          ),
                          TextSpan(
                              text: "*",
                              style:
                                  TextStyle(color: primaryRed, fontSize: 12.sp))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 6.h, left: 24.h, right: 24.h, bottom: 56.h),
                    child: CustomTextFromField(
                      hintText: "About Event",
                      line: 10,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 8.h),
              child: CustomButton(
                name: "Continue",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 26.97.h),
                                child: SvgPicture.asset(
                                  "assets/images/Groupchek.svg",
                                ),
                              ),
                              customText(
                                  name: "Event has been",
                                  fontSize: 24.sp,
                                  color: primaryBlack,
                                  fontFamily: "UrbanistBold"),
                              customText(
                                  name: "Created Successfully",
                                  fontSize: 24.sp,
                                  color: primaryBlack,
                                  fontFamily: "UrbanistBold"),
                              customText(
                                  name: "Great, Your Event was Successfully",
                                  fontSize: 14.sp,
                                  color: primaryDoveGrey,
                                  fontFamily: "UrbanistMedium"),
                              customText(
                                  name: "created",
                                  fontSize: 14.sp,
                                  color: primaryDoveGrey,
                                  fontFamily: "UrbanistMedium"),
                              SizedBox(
                                height: 26.h,
                              ),
                              CustomButton(
                                name: "OK",
                                onTap: () {
                                  Navigator.pushNamed(context, "home");
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

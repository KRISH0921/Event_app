import 'package:dotted_line/dotted_line.dart';
import 'package:event_app/app/components/coustom_appbar.dart';
import 'package:event_app/app/components/custom_button.dart';
import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              textAlign: TextAlign.center,
              name: "Ticket",
              fontSize: 18.h,
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 42.h, left: 24.h, right: 24.h),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(
                          "assets/images/Ticket.png",
                          height: 452,
                        ),
                        Column(
                          children: [
                            SizedBox(height: 21),
                            customText(
                                name: "SCAN BARCODE",
                                color: primaryBlack,
                                fontSize: 18.88.sp,
                                fontFamily: "UrbanistSemiBold"),
                            SizedBox(
                              height: 16,
                            ),
                            Image.asset(
                              "assets/images/Frame.png",
                              height: 161.h,
                              width: 169.h,
                            ),
                            // SizedBox(
                            //   height: 100.h,
                            // ),
                            SizedBox(height: 100.h,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 24.h),
                              child: Container(
                                height: 159.h,
                                width: double.infinity,
                                child: Padding(
                                  padding:  EdgeInsets.only(left: 16.h),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/event.png",
                                            height: 57.h,
                                            width: 56.h,
                                          ),
                                          SizedBox(
                                            width: 12.h,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              customText(
                                                  name: "Artexpo | Visual Design\nExhibition",
                                                  color: primaryBlack,
                                                  fontSize: 12.sp,
                                                  fontFamily: "UrbanistBold"),
                                              SizedBox(
                                                height: 11.h,
                                              ),
                                              customText(
                                                  name: "Sep 18-24 | 9 am",
                                                  color: primaryBoulder,
                                                  fontSize: 10.sp,
                                                  fontFamily: "UrbanistMedium"),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              customText(
                                                  name: "\$199",
                                                  color: primaryBlue,
                                                  fontSize: 12.sp,
                                                  fontFamily: "UrbanistBold"),
                                              SizedBox(
                                                height: 30.h,
                                              ),
                                              customText(
                                                  name: "Jogja Expo Center",
                                                  color: primaryBoulder,
                                                  fontSize: 12.sp,
                                                  fontFamily: "UrbanistMedium"),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(right:12.h,bottom: 16.h),
                                        child: DottedLine(
                                          dashColor: primaryAshGrey,
                                          dashLength: 20,
                                          dashGapLength: 8,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              customText(
                                                  name: "Ticket type",
                                                  color: primaryBoulder,
                                                  fontFamily: "UrbanistRegular",
                                                  fontSize: 10.sp),
                                              customText(
                                                  name: "VVIP",
                                                  color: primaryBlack,
                                                  fontFamily: "UrbanistMedium",
                                                  fontSize: 12.sp),
                                            ],
                                          ),
                                          SizedBox(width: 32.h),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              customText(
                                                  name: "No. of Tickets",
                                                  color: primaryBoulder,
                                                  fontFamily: "UrbanistRegular",
                                                  fontSize: 10.sp),
                                              customText(
                                                  name: "x 1",
                                                  color: primaryBlack,
                                                  fontFamily: "UrbanistMedium",
                                                  fontSize: 12.sp),
                                            ],
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: EdgeInsets.only(right: 24.h),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                customText(
                                                    name: "Date",
                                                    color: primaryBoulder,
                                                    fontFamily: "UrbanistRegular",
                                                    fontSize: 10.sp),
                                                customText(
                                                    name: "24 Sep 2024",
                                                    color: primaryBlack,
                                                    fontFamily: "UrbanistMedium",
                                                    fontSize: 12.sp),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 24.h,right: 24.h,bottom: 16.h),
              child: CustomButton(
                name: "Continue",
                onTap: () {
                  Navigator.pushNamed(context, "home");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

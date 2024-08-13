import 'package:event_app/app/components/coustom_appbar.dart';
import 'package:event_app/app/components/custom_button.dart';
import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/components/custom_text_field.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingPayment extends StatefulWidget {
  const BookingPayment({super.key});

  @override
  State<BookingPayment> createState() => _BookingPaymentState();
}

class _BookingPaymentState extends State<BookingPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(
              textAlign: TextAlign.center,
              name: "Payment Methods",fontSize: 18.h,),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 24.66.h, left: 24.h, right: 24.h),
                    child: Image.asset("assets/images/Credit Card.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.66.h, left: 43.h),
                    child: customText(
                        name: "Cardholder Name",
                        fontSize: 12.h,
                        color: primaryAshGrey,
                        fontFamily: "UrbanistMedium"),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 6.17.h, left: 24.h, right: 24.h),
                    child: CustomTextFromField(hintText: "Cardholder Name"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 22.h, left: 43.h),
                    child: customText(
                        name: "Card Number",
                        fontSize: 12.h,
                        color: primaryAshGrey,
                        fontFamily: "UrbanistMedium"),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 6.17.h, left: 24.h, right: 24.h),
                    child: CustomTextFromField(hintText: "Card Number"),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 28.83.h, left: 43.h),
                              child: customText(
                                  name: "Expires",
                                  fontSize: 12.h,
                                  color: primaryAshGrey,
                                  fontFamily: "UrbanistMedium"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 7.h, left: 24.h, bottom: 55.h),
                              child: CustomTextFromField(hintText: "Expires"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 44.62.h,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 28.83.h, left: 21.5.h),
                              child: customText(
                                  name: "CVV",
                                  fontSize: 12.h,
                                  color: primaryAshGrey,
                                  fontFamily: "UrbanistMedium"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 7.h, right: 24.h, bottom: 55.h),
                              child: CustomTextFromField(hintText: "CVV"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 24.h),
              child: CustomButton(
                name: "Continue",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 26.97.h),
                                child: Image.asset(
                                  "assets/images/thum.png",
                                  height: 129.4.h,
                                  width: 135.3.h,
                                ),
                              ),
                              SizedBox(height: 28.9.h,),
                              customText(
                                  name: "Payment Successful",
                                  fontSize: 24.sp,
                                  color: primaryBlack,
                                  fontFamily: "UrbanistBold"),
                              SizedBox(height: 7.71.h,),
                              customText(
                                  name:
                                      "Get everything ready until it’s time to go",
                                  fontSize: 14,
                                  color: primaryDoveGrey,
                                  fontFamily: "UrbanistMedium"),
                              customText(
                                  name: "on a trip",
                                  fontSize: 14,
                                  color: primaryDoveGrey,
                                  fontFamily: "UrbanistMedium"),
                              SizedBox(height: 28.9.h,),
                              CustomButton(
                                name: "View Ticket",
                                onTap: () {
                                  Navigator.pushNamed(context, "ticket");
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
            ),
          ],
        ),
      ),
    );
  }
}

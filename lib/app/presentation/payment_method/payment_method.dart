import 'package:event_app/app/components/coustom_appbar.dart';
import 'package:event_app/app/components/custom_button.dart';
import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/presentation/payment_method/model/payment_method_model.dart';
import 'package:event_app/app/presentation/payment_method/provider/payment_method_provider.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  PaymentMethodProvider? providerT;
  PaymentMethodProvider? providerF;

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<PaymentMethodProvider>(context, listen: true);
    providerF = Provider.of<PaymentMethodProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(
              textAlign: TextAlign.center,
              name: "Payment Methods",
              fontSize: 18.h,
            ),
            Expanded(
              child: ListView(
                primary: true,
                shrinkWrap: false,
                children: [
                  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 42.13.h),
                    itemCount: providerF!.paymentList.length,
                    itemBuilder: (context, index) {
                      PaymentMethodModel show = providerF!.paymentList[index];
                      return Padding(
                        padding: EdgeInsets.only(top:29.h,left: 24.h, right: 24.h),
                        child: Container(
                          height: 76.27.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: primaryMercury),
                              borderRadius: BorderRadius.circular(40.r)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 19.07.h),
                            child: Row(
                              children: [
                                SvgPicture.asset("${show.image}"),
                                customText(name: "${show.name}", color: primaryBlack,fontSize: 15.25,fontFamily: "UrbanistSemiBold"),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 29.h, left: 24.h, right: 24.h),
                    child: Container(
                      height: 76.27.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryMercury),
                          borderRadius: BorderRadius.circular(40.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/add-circle.svg"),
                          SizedBox(
                            width: 9.530.h,
                          ),
                          customText(
                              name: "Add More",
                              fontSize: 13.35.sp,
                              color: primaryBlack,
                              fontFamily: "UrbanistMedium"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 24.h),
              child: CustomButton(
                name: "Continue",
                onTap: () {
                  Navigator.pushNamed(context, "booking");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

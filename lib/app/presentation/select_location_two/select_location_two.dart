import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/presentation/select_location_two/model/select_Location_model.dart';
import 'package:event_app/app/presentation/select_location_two/provider/select_location_provider.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SelectLocationTwo extends StatefulWidget {
  const SelectLocationTwo({super.key});

  @override
  State<SelectLocationTwo> createState() => _SelectLocationTwoState();
}

class _SelectLocationTwoState extends State<SelectLocationTwo> {
  SelectLocationProvider? providerT;
  SelectLocationProvider? providerF;

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<SelectLocationProvider>(context, listen: true);
    providerF = Provider.of<SelectLocationProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 16.h,left: 24.h),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset("assets/images/Arrow Back.svg")),
                  SizedBox(width: 42.7.h,),
                  customText(
                      name: "Select a Location",
                      fontSize: 18.sp,
                      color: primaryBlack,
                      fontFamily: "UrbanistBold"),
                ],
              ),
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: providerF!.locationList.length,
              itemBuilder: (context, index) {
                SelectLocationModel select = providerF!.locationList[index];
                return Padding(
                  padding:
                  EdgeInsets.only(top: 16.h, left: 24.h, right: 24.h),
                  child: GestureDetector(
                    child: Container(
                      height: 50.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(30.r),
                          ),
                          border: Border.all(
                              color: providerT!.show == index
                                  ? primaryBlue
                                  : primaryMercury),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.h),
                        child: Row(
                          children: [
                            providerT!.show == index ? SvgPicture.asset("assets/images/checkfill.svg"): SvgPicture.asset("assets/images/check.svg"),
                            SizedBox(width: 15.41.h,),
                            customText(name: "${select.title}",fontSize: 15.41.sp,color: primaryBlack,fontFamily: "PlusJakartaSansSemiBold"),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      providerT!.change(index);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

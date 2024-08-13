import 'package:chips_choice/chips_choice.dart';
import 'package:event_app/app/components/custom_button.dart';
import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseInterest extends StatefulWidget {
  const ChooseInterest({super.key});

  @override
  State<ChooseInterest> createState() => _ChooseInterestState();
}

class _ChooseInterestState extends State<ChooseInterest> {
  List<String> tags = [];
  List<String> options = [
    "Design",
    "Business",
    "Music",
    "Fashion",
    "Gaming",
    "Health",
    "Education",
    "Sport",
    "Media & Theate",
    "School",
    "Science & Tech",
  ];
  List<Image> show = [
    Image.asset("assets/images/design.png"),
    Image.asset("assets/images/business.svg"),
    Image.asset("assets/images/fashion.svg"),
    Image.asset("assets/images/gaming.svg"),
    Image.asset("assets/images/health.svg"),
    Image.asset("assets/images/education.svg"),
    Image.asset("assets/images/sport.svg"),
    Image.asset("assets/images/media.svg"),
    Image.asset("assets/images/school.svg"),
    Image.asset("assets/images/science.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.h, left: 24.h, right: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset("assets/images/arrowleft.svg"),
                  ),
                  GestureDetector(
                    onTap: () {
                    },
                    child: customText(
                        name: "Skip",
                        color: primaryDarkGrey,
                        fontSize: 14.sp,
                        fontFamily: "UrbanistMedium"),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.h, left: 24.h, bottom: 10.h),
              child: customText(
                  name: "Choose Your Interest",
                  color: primaryBlack,
                  fontSize: 28.sp,
                  fontFamily: "UrbanistBold"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.h, bottom: 30.h),
              child: customText(
                  name:
                      "Select a few categories based on your\ninterests to get started.",
                  color: primaryBoulder,
                  fontSize: 16.sp,
                  fontFamily: "UrbanistRegular"),
            ),
            // FilterChip(label: Text("data"), onSelected: (value) {
            //
            // },),
            ChipsChoice.multiple(
              value: tags,
              onChanged: (val) => setState(() => tags = val),
              choiceItems: C2Choice.listFrom<String, String>(
                source: options,
                value: (i, v) => v,
                label: (i, v) => v,
                tooltip: (i, v) => v,
              ),
              textDirection: TextDirection.ltr,
              choiceStyle: C2ChipStyle.filled(
                color: primaryWhite,
                selectedStyle: C2ChipStyle(
                  borderRadius: BorderRadius.circular(30.r),
                  backgroundColor: Colors.blue,
                ),
                height: 43.h,
              ),
              wrapped: true,
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 24.h,right: 24.h,bottom: 24.h),
              child: CustomButton(
                name: "Get Started",
                onTap: (){
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

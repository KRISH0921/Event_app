import 'package:event_app/app/components/custom_button.dart';
import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/presentation/intro_screen/provider/intro_screen_provider.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController pageController = PageController();

  IntroScreenProvider? providerT;
  IntroScreenProvider? providerF;

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<IntroScreenProvider>(context, listen: true);
    providerF = Provider.of<IntroScreenProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: providerF!.eventList.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        "${providerT!.eventList[index].image}",
                        width: 375.h,
                        height: 755.h,
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 230.h),
                          child: customText(
                            name: "${providerT!.eventList[index].title}",fontSize: 28.sp,color: primaryBlack,fontFamily: "UrbanistBold"
                          ),
                        ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 189.h),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: customText(
                            name: "${providerT!.eventList[index].name}",fontSize: 28.sp,color: primaryBlack,fontFamily: "UrbanistBold"
                          ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 155.h),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: customText(
                            name: "${providerT!.eventList[index].subTitle}",fontSize: 16.sp,color: primaryBoulder,
                          ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 125.h),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: customText(
                            name: "${providerT!.eventList[index].subName}",fontSize: 16.sp,color: primaryBoulder,
                          ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 17.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  name: "Get Started",
                  onTap: () {
                    Navigator.pushNamed(context, "signin");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

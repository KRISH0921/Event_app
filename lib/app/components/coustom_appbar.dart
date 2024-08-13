import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppbar extends StatefulWidget {
   CustomAppbar({super.key,this.name,this.fontSize,this.textAlign,this.fontFamily});

   String? name;
   double? fontSize;
   TextAlign? textAlign;
   String? fontFamily;

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}


class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child:Padding(
        padding: EdgeInsets.only(top: 15.h,bottom: 16.h,left: 24.h,right: 24.h),
        child: Row(
          children: [
            GestureDetector(
                onTap:(){
                  Navigator.pop(context);
                },  
                child: SvgPicture.asset("assets/images/arrowleft.svg",height: 24.h,width: 24.h),
            ),
            Expanded(
              child: customText(
                  name: widget.name?? "",
                  textAlign: widget.textAlign,
                  color: primaryBlack,
                  fontSize: widget.fontSize,
                  fontFamily: widget.fontFamily?? "UrbanistBold"),
            ),
            SizedBox(width: 24.h,),
          ],
        ),
      ),
    );
  }
}

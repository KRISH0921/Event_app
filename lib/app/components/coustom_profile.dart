import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class CustomProfile extends StatefulWidget {
  CustomProfile({
    super.key,
    required this.onTap,
    required this.name,
    this.image,
    this.svgPicture,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.width,
    this.widthone,
    this.height,
    this.subColor,

  });


  Function onTap;
  String name;
  String? image;
  Color? color;
  Color? subColor;
  double? fontSize;
  String? fontFamily;
  String? svgPicture;
  double? height;
  double? width;
  double? widthone;

  @override
  State<CustomProfile> createState() => _CustomProfileState();
}

class _CustomProfileState extends State<CustomProfile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap.call();
      },
      child: Container(
        height: widget.height?? 64.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.subColor,
          border: Border.all(color: primaryMercury),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          children: [
            SizedBox(width: widget.width,),
            SvgPicture.asset( widget.svgPicture ?? "",),
            SizedBox(width: widget.widthone,),
            Text(
              widget.name,
              style: TextStyle(
                fontFamily: widget.fontFamily,
                color: widget.color ?? primaryBlack,
                fontSize: widget.fontSize ?? 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

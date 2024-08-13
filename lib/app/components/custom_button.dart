import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  CustomButton({super.key,required this.name,required this.onTap, this.buttonColor,this.fontFamily,this.fontColor});

  String name;
  Function onTap;
  Color? buttonColor;
  String? fontFamily;
  Color? fontColor;


  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap.call();
      },
      child: Container(
          height: 50.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: widget.buttonColor?? primaryBlue,
              borderRadius: BorderRadius.all(Radius.circular(30.r),
              ),
          ),
          child: Center(
            child: Text(
              widget.name,
              style: TextStyle(
                  color: widget.fontColor ??primaryWhite,
                  fontFamily: widget.fontFamily??"UrbanistBold",
                  fontSize: 16.sp),
            ),
          ),
        ),
    );
  }
}

import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSubButton extends StatefulWidget {
  CustomSubButton({super.key,required this.name,required this.onTap, this.buttonColor,this.borderColor,this.textColor,this.fontFamily,this.height,this.fontSize});

  String name;
  Function onTap;
  Color? buttonColor;
  Color? borderColor;
  Color? textColor;
  String? fontFamily;
  double? height;
  double? fontSize;

  @override
  _CustomSubButtonState createState() => _CustomSubButtonState();
}

class _CustomSubButtonState extends State<CustomSubButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          height: widget.height?? 50.h,
          width: double.infinity,
          child: Center(
            child: Text(
              widget.name,
              style: TextStyle(
                  color: widget.textColor?? primaryBlack,
                  fontFamily: widget.fontFamily ?? "UrbanistBold",
                  fontSize: widget.fontSize?? 16.sp),
            ),
          ),
          decoration: BoxDecoration(
              color: widget.buttonColor?? Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(30.r),
              ),
              border: Border.all(color: widget.borderColor?? primaryMercury)
          ),
        ),
        onTap: () {
          widget.onTap.call();
        }
    );
  }
}
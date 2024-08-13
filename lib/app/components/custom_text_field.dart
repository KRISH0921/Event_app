import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFromField extends StatefulWidget {
  CustomTextFromField(
      {super.key,
      required this.hintText,
      this.height,
      this.textColor,
      this.fontFamily,
      this.fontSize,
      this.line,
      this.icon,
      this.onTap,
      this.subIcon,
      this.controller,
      });

  String? hintText;
  Color? textColor;
  String? fontFamily;
  double? fontSize;
  double? height;
  int? line;
  Icon? icon;
  Function? onTap;
  Icon? subIcon;
  TextEditingController? controller;

  @override
  State<CustomTextFromField> createState() => _CustomTextFromFieldState();
}

class _CustomTextFromFieldState extends State<CustomTextFromField> {
  TextEditingController timePicker = TextEditingController();
  TextEditingController datePicker = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: widget.line ?? 1,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryBlue),
          borderRadius: BorderRadius.all(
            Radius.circular(30.r),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: primaryMercury),
          borderRadius: BorderRadius.all(
            Radius.circular(30.r),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryMercury),
          borderRadius: BorderRadius.all(
            Radius.circular(33.r),
          ),
        ),
        contentPadding: EdgeInsets.all(16),
        hintText: widget.hintText,
        prefixIcon: widget.icon,
        suffixIcon: widget.subIcon,
        hintStyle: TextStyle(
            color: widget.textColor ?? primaryAshGrey,
            fontFamily: widget.fontFamily ?? "UrbanistRegular",
            fontSize: widget.fontSize ?? 14.sp),
      ),
    );
  }
}

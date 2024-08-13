import 'package:flutter/material.dart';

Widget customText(
    {required String name,
      int? maxLines,
    double? fontSize,
    Color? color,
    String? fontFamily,
    TextAlign? textAlign}) {
  return Text(
    name,
    maxLines: maxLines,
    textAlign: textAlign,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily ?? "",
      fontSize: fontSize,
      color: color,
    ),
  );
}

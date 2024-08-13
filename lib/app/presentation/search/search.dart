import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/components/custom_text_field.dart';
import 'package:event_app/app/presentation/search/model/search_model.dart';
import 'package:event_app/app/presentation/search/provider/search_provider.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  SearchProvider? providerT;
  SearchProvider? providerF;

  @override
  Widget build(BuildContext context) {

    providerT = Provider.of<SearchProvider>(context,listen: true);
    providerF = Provider.of<SearchProvider>(context,listen: false);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32.h, left: 24.h, right: 24.h),
              child: CustomTextFromField(
                icon: Icon(
                  Icons.search_rounded,
                  color: primaryBlack,
                ),
                hintText: "Music event, Webinars...",
                textColor: primaryBoulder,
                fontFamily: "UrbanistBold",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.h, top: 16.h),
              child: customText(
                  name: "Recent Search",
                  color: primaryBlack,
                  fontSize: 16.sp,
                  fontFamily: "UrbanistSemiBold"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: providerF!.searchList.length,
                itemBuilder: (context, index) {
                  SearchModel show = providerF!.searchList[index];
                  return Padding(
                    padding: EdgeInsets.only(top: 24.h,left: 24.h,right: 24.h),
                    child: Row(
                      children: [
                        SvgPicture.asset("${show.image}"),
                        SizedBox(width: 10.h,),
                        GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, "nearby");
                            },
                            child: customText(name: "${show.name}",color: primaryBlack,fontSize: 14.sp,fontFamily: "UrbanistMedium")),
                        Spacer(),
                        SvgPicture.asset("${show.subImage}"),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

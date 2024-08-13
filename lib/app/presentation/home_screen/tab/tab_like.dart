import 'package:event_app/app/components/coustom_appbar.dart';
import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/presentation/home_screen/model/get_favorite_event.dart';
import 'package:event_app/app/presentation/home_screen/model/home_model.dart';
import 'package:event_app/app/presentation/home_screen/provider/home_screen_provider.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:event_app/app/utils/api_file.dart';
import 'package:event_app/app/utils/post_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class TabLike extends StatefulWidget {
  const TabLike({super.key});

  @override
  State<TabLike> createState() => _TabLikeState();
}

class _TabLikeState extends State<TabLike> {

  HomeScreenProvider? providerT;
  HomeScreenProvider? providerF;
  @override
  Widget build(BuildContext context) {

    providerT = Provider.of<HomeScreenProvider>(context, listen: true);
    providerF = Provider.of<HomeScreenProvider>(context, listen: false);

    // String favoriteEvent = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              name: "Like",
              textAlign: TextAlign.center,
              fontSize: 18.sp,
            ),
            FutureBuilder(
              future: providerT!.favoriteEvent(),
              builder: (context, snapshot) {
                if(snapshot.hasError){
                  customText(name:"Data is not Available ${snapshot.error}");
                } else if(snapshot.hasData){
                  GetFavoriteEvent select = snapshot.data! as GetFavoriteEvent;
                  List<FavoriteRecord>? list = select.favorite!.records;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: list!.length,
                      itemBuilder: (context, index) {
                        FavoriteRecord data = list[index];
                      return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.h,vertical: 10.h,),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(10.r),topLeft: Radius.circular(10.r)
                                        ),
                                        child: Image.network(
                                            "${ApiFile.uploadUrl}${data.eventId!.avatar}",height: 167.h,width: double.infinity,fit: BoxFit.fill,),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(right: 10.h,top: 10.h),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: GestureDetector(
                                            onTap: (){
                                              providerT!.changeProcess() ;
                                              PostApi().unFavoriteEvent("6629109e677004d41fd5d542",data.eventId!.id, "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MjkxMDllNjc3MDA0ZDQxZmQ1ZDU0MiIsImlhdCI6MTcxOTM4OTY4OX0.W9FcjO8nxRrrWKjvoqsXP8TmQRDRvD-L0qQ2qSBPECA");
                                              providerT!.changeProcess();
                                            },
                                            child: providerT!.process == false ? SvgPicture.asset("assets/images/likefill.svg") : SvgPicture.asset("assets/images/like.svg"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h,),
                                  customText(name: "${data.eventId!.event}",fontSize: 14.sp,fontFamily: "UrbanistBold"),
                                  SizedBox(height: 5.h,),
                                  customText(
                                      maxLines: 1,
                                      name: "${data.eventId!.address}",fontSize: 12.sp,fontFamily: "UrbanistMedium",color: primaryBoulder),
                                  SizedBox(height: 5.h,),
                                  customText(
                                      name: "\$${data.eventId!.price}",fontSize: 12.sp,fontFamily: "UrbanistMedium",color: primaryBoulder),
                                ],
                              ),
                            ),
                          );
                     },
                    ),
                  );
                }
                return CircularProgressIndicator();
            },),
          ],
        ),
      ),
    );
  }
}

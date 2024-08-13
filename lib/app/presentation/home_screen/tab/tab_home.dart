import 'package:event_app/app/presentation/home_screen/model/get_favorite_event.dart';
import 'package:event_app/app/presentation/home_screen/model/home_model.dart';
import 'package:event_app/app/utils/api_file.dart';
import 'package:event_app/app/utils/post_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../components/custom_text.dart';
import '../../../them/custom_color/custom_color.dart';
import '../model/all_category.dart';
import '../model/upcoming_event_model.dart';
import '../provider/home_screen_provider.dart';

class TabHome extends StatefulWidget {
  const TabHome({super.key});

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  HomeScreenProvider? providerT;
  HomeScreenProvider? providerF;

  @override
  void initState() {
    super.initState();
    // Provider.of<HomeScreenProvider>(context, listen: false).favoriteEvent();
    PostApi().getFavoriteEvent("6629109e677004d41fd5d542", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MjkxMDllNjc3MDA0ZDQxZmQ1ZDU0MiIsImlhdCI6MTcxOTM4OTY4OX0.W9FcjO8nxRrrWKjvoqsXP8TmQRDRvD-L0qQ2qSBPECA");
  }

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<HomeScreenProvider>(context, listen: true);
    providerF = Provider.of<HomeScreenProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText(
                      name: "Welcome back!",
                      fontSize: 24.sp,
                      color: primaryBlack,
                      fontFamily: "UrbanistSemiBold"),
                  Image.asset(
                    "assets/images/Image.png",
                    height: 36.h,
                    width: 36.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.h),
              child: customText(
                  name: "Julia Smith",
                  fontSize: 20.sp,
                  color: primaryBoulder,
                  fontFamily: "UrbanistSemiBold"),
            ),
            SizedBox(
              height: 23.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "search");
                },
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryMercury),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: 12,
                        ),
                        customText(
                            name: "Music event, Webinars...",
                            fontSize: 14.sp,
                            color: primaryBoulder,
                            fontFamily: "UrbanistMedium")
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            Expanded(
              child: ListView(
                primary: true,
                shrinkWrap: false,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(
                            name: "Popular Event",
                            fontSize: 18.sp,
                            color: primaryBlack,
                            fontFamily: "UrbanistSemiBold"),
                        GestureDetector(
                          onTap: () {

                          },
                          child: customText(
                              name: "See more",
                              fontSize: 14.sp,
                              color: primaryBlue,
                              fontFamily: "UrbanistSemiBold"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FutureBuilder(
                    future: providerT!.getPopularData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("Data is not available ${snapshot.error}");
                      } else if (snapshot.hasData) {
                        Event select = snapshot.data! as Event;
                        print("dffdfdf ==== ${select.events}");
                        List<EventsRecord>? list = select.events!.record;
                        return SizedBox(
                          height: 276.h,
                          child: ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(horizontal: 16.h),
                            itemCount: list!.length,
                            itemBuilder: (context, index) {
                              EventsRecord data = list[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context,
                                      "event",
                                      arguments: data.id
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.h),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            10.r)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                              BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                topLeft: Radius.circular(10),
                                              ),
                                              child: Image.network(
                                                "${ApiFile.uploadUrl}${data
                                                    .avatar}", height: 167.h,),
                                            ),
                                            FutureBuilder(future: providerT!.favoriteEvent(), builder: (context, snapshot) {
                                             if(snapshot.hasError){
                                               return Text("${snapshot.error}");
                                             }
                                             else if(snapshot.hasData){
                                               GetFavoriteEvent event = snapshot.data as GetFavoriteEvent;
                                               List list = event.favorite!.records ?? [];
                                               var data2 = list.where((element) => element.eventId!.id == data.id);
                                               bool? i = false;
                                               i = data2.isNotEmpty;
                                               print("varawd$i");
                                               print("datadadnajhddh${snapshot.data}");
                                               return list.isEmpty ? GestureDetector (
                                                 onTap: () {
                                                   providerT!.changeProcess();
                                                   PostApi().favoriteEvent(
                                                       "6629109e677004d41fd5d542",
                                                       data.id,
                                                       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MjkxMDllNjc3MDA0ZDQxZmQ1ZDU0MiIsImlhdCI6MTcxOTM4OTY4OX0.W9FcjO8nxRrrWKjvoqsXP8TmQRDRvD-L0qQ2qSBPECA");
                                                   providerT!.changeProcess();
                                                 },
                                                 child:  SvgPicture.asset("assets/images/like.svg"),
                                               ) :
                                            //      FutureBuilder(future: PostApi().checkFavorite(data.id.toString()),
                                            //      builder: (context, snapshot) {
                                            //        print("id===================================${data.id}");
                                            //        if (snapshot.hasError) {
                                            //          return Text(
                                            //              "${snapshot.error}");
                                            //        }
                                            //        else if(snapshot.hasData){

                                                      i == false ? GestureDetector (
                                                       onTap: () {
                                                         providerT!.changeProcess();
                                                         PostApi().favoriteEvent(
                                                             "6629109e677004d41fd5d542",
                                                             data.id,
                                                             "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MjkxMDllNjc3MDA0ZDQxZmQ1ZDU0MiIsImlhdCI6MTcxOTM4OTY4OX0.W9FcjO8nxRrrWKjvoqsXP8TmQRDRvD-L0qQ2qSBPECA");
                                                         providerT!.changeProcess();
                                                       },
                                                       child:  SvgPicture.asset("assets/images/like.svg"),
                                                     ) : GestureDetector (
                                                       onTap: () {
                                                         providerT!.changeProcess();
                                                         PostApi().unFavoriteEvent(
                                                             "6629109e677004d41fd5d542",
                                                             data.id,
                                                             "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MjkxMDllNjc3MDA0ZDQxZmQ1ZDU0MiIsImlhdCI6MTcxOTM4OTY4OX0.W9FcjO8nxRrrWKjvoqsXP8TmQRDRvD-L0qQ2qSBPECA");
                                                         providerT!.changeProcess();
                                                       },
                                                       child:  SvgPicture.asset("assets/images/likefill.svg") ,
                                                     );

                                                 //   }
                                                 //   return Center(child: CircularProgressIndicator());
                                                 // },),
                                             }
                                             return CircularProgressIndicator();
                                            },),
                                          ],
                                        ),
                                        customText(name: "${data.event}",
                                            fontSize: 14.sp,
                                            fontFamily: "UrbanistBold"),
                                        Row(
                                          children: [
                                            customText(
                                                maxLines: 1,
                                                name: "${data.event}",
                                                fontSize: 12.sp,
                                                fontFamily: "UrbanistMedium",
                                                color: primaryBoulder),
                                            customText(name: "${data.price}",
                                                fontSize: 12.sp,
                                                fontFamily: "UrbanistMedium",
                                                color: primaryBoulder),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                      // return Center(
                      //   child: CircularProgressIndicator(
                      //     color: Colors.cyan,
                      //   ),
                      // );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.h, top: 32.h),
                    child: customText(
                        name: "Event Categories",
                        fontSize: 16.sp,
                        color: primaryBlack,
                        fontFamily: "UrbanistSemiBold"),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FutureBuilder(
                    future: PostApi().allCategory(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("Data is not available");
                      } else if (snapshot.hasData) {
                        AllCategory select = snapshot.data! as AllCategory;
                        print("The data ===${select.categories}");
                        List<CategoryRecord>? list = select.categories!.record;
                        return SizedBox(
                          height: 40.h,
                          width: double.infinity,
                          child: ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 18.h),
                            scrollDirection: Axis.horizontal,
                            itemCount: list!.length,
                            itemBuilder: (context, index) {
                              CategoryRecord data = list[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6.h),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: primaryMercury),
                                      borderRadius: BorderRadius.circular(
                                          30.r)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8.h,
                                        bottom: 8.h,
                                        left: 24.h,
                                        right: 24.h),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.network(
                                          "${ApiFile.uploadUrl}${data.avatar}",
                                          height: 24.h,
                                          width: 18.h,
                                        ),
                                        SizedBox(width: 7),
                                        customText(name: "${data.category}"),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: 24.h, right: 27.h, bottom: 17.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(
                            name: "Upcoming Event",
                            color: primaryBlack,
                            fontSize: 18.sp,
                            fontFamily: "UrbanistSemiBold"),
                        customText(
                            name: "See all",
                            color: primaryBlue,
                            fontSize: 14.sp,
                            fontFamily: "UrbanistSemiBold"),
                      ],
                    ),
                  ),
                  FutureBuilder(
                    future: PostApi().upComingEvent(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return customText(name: "Data is not available");
                      } else if (snapshot.hasData) {
                        UpComingEvent select = snapshot.data! as UpComingEvent;
                        print("UpComing data=======${select.events}");
                        List<EventsRecord>? list = select.events!.record;
                        return ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: list!.length,
                          itemBuilder: (context, index) {
                            EventsRecord data = list[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context,
                                    "event",
                                    arguments: data.id
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 24.h, bottom: 30.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.r)),
                                      child: Image.network(
                                        "${ApiFile.uploadUrl}${data.avatar}",
                                        height: 80.h,
                                        width: 80.h,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 14.h,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          customText(
                                              name: "${data.event}",
                                              color: primaryBlack,
                                              fontSize: 16.sp,
                                              fontFamily: "UrbanistSemiBold"),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: customText(
                                                    name: "${data.address}",
                                                    maxLines: 1,
                                                    color: primaryBoulder,
                                                    fontSize: 12.sp,
                                                    fontFamily: "UrbanistRegular"),
                                              ),
                                              SizedBox(width: 200,),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/images/calendar.svg"),
                                              SizedBox(
                                                width: 8.h,
                                              ),
                                              customText(
                                                  name: "${data.date}",
                                                  color: primaryBoulder,
                                                  fontSize: 14.sp,
                                                  fontFamily: "UrbanistMedium"),
                                              SizedBox(
                                                width: 16.h,
                                              ),
                                              SvgPicture.asset(
                                                  "assets/images/ticketshow.svg"),
                                              SizedBox(
                                                width: 8.h,
                                              ),
                                              customText(
                                                  name: "\$${data.price}",
                                                  color: primaryBoulder,
                                                  fontSize: 14.sp,
                                                  fontFamily: "UrbanistMedium"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

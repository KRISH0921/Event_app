import 'package:event_app/app/components/coustom_appbar.dart';
import 'package:event_app/app/components/custom_button.dart';
import 'package:event_app/app/components/custom_text.dart';
import 'package:event_app/app/presentation/home_screen/model/detail_page_model.dart';
import 'package:event_app/app/them/custom_color/custom_color.dart';
import 'package:event_app/app/utils/api_file.dart';
import 'package:event_app/app/utils/post_api.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({super.key});

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {

    String popularEvent = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(
              textAlign: TextAlign.center,
              name: "Event Detail",
              fontSize: 18.sp,
            ),
            Expanded(
              child: ListView(
                children: [
                  FutureBuilder(
                    future: PostApi().detailPage(popularEvent),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("Data is not available ${snapshot.error}");
                      } else if (snapshot.hasData) {
                        DetailPage select = snapshot.data! as DetailPage;
                        print("dffdfdf ==== ${select.events}");
                        List<Record>? list = select.events!.record;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 24.h,
                                right: 24.h,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.r),
                                ),
                                child: Image.network(
                                    "${ApiFile.uploadUrl}${list![0].avatar}"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 16.h, left: 24.h, right: 24.h),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundImage: NetworkImage("${ApiFile.uploadUrl}${list![0].avatar}",),
                                    // child: Image.network("${ApiFile.uploadUrl}${list![0].avatar}",
                                    //     width: 40.h, height: 40.h),
                                  ),
                                  SizedBox(
                                    width: 10.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      customText(
                                          name: "${list[0].event}",
                                          fontSize: 16.sp,
                                          color: primaryBlack,
                                          fontFamily: "UrbanistBold"),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          RatingBar.builder(
                                            itemSize: 5 * 5,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: REdgeInsets.symmetric(
                                                horizontal: 3.95),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: primaryAmber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              setState(
                                                () {
                                                  this.rating = rating;
                                                },
                                              );
                                            },
                                          ),
                                          SizedBox(
                                            width: 5.53.h,
                                          ),
                                          customText(
                                              name: "$rating",
                                              color: primaryBlack,
                                              fontSize: 10.sp,
                                              fontFamily: "UrbanistBold"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 28.h,
                                    width: 75.h,
                                    decoration: BoxDecoration(
                                      color: primaryLavender,
                                      borderRadius: BorderRadius.circular(30.r),
                                    ),
                                    child: Center(
                                        child: customText(
                                            name: "Follow",
                                            color: primaryBlue,
                                            fontSize: 14.sp,
                                            fontFamily: "UrbanistMedium")),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 21.5.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.h),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/images/location.svg"),
                                  SizedBox(width: 4),
                                  Expanded(
                                    child: customText(
                                        maxLines: 1,
                                        name: "${list![0].address}",
                                        color: primaryBoulder,
                                        fontSize: 14.sp,
                                        fontFamily: "UrbanistMedium"),
                                  ),
                                  Spacer(),
                                  customText(
                                      name: "Starting at",
                                      color: primaryBoulder,
                                      fontSize: 12.sp,
                                      fontFamily: "UrbanistSemiBold"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 24.h,
                                right: 29.h,
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/images/calendar.svg"),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  customText(
                                      name: "${list![0].date}",
                                      color: primaryBoulder,
                                      fontSize: 14.sp,
                                      fontFamily: "UrbanistMedium"),
                                  Spacer(),
                                  customText(
                                      name: "\$${list![0].price}",
                                      color: primaryBlack,
                                      fontSize: 24.sp,
                                      fontFamily: "UrbanistSemiBold"),
                                ],
                              ),
                            ),
                            SizedBox(height: 24.h,),
                            Padding(
                              padding: EdgeInsets.only(left: 24.h),
                              child: customText(
                                  name: "Description:",
                                  fontSize: 16.sp,
                                  color: primaryBlack,
                                  fontFamily: "UrbanistBold"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.h, left: 24.h, right: 18.h),
                              child: ExpandableText(
                                "${list![0].description}",
                                style: TextStyle(
                                    color: primaryBoulder,
                                    fontSize: 14.sp,
                                    fontFamily: "UrbanistMedium"),
                                maxLines: 3,
                                expandText: 'Read more',
                                collapseText: "..Read less",
                                linkColor: primaryBlue,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 24.h, top: 26.h),
                              child: customText(
                                  name: "Location:",
                                  fontSize: 16.sp,
                                  color: primaryBlack,
                                  fontFamily: "UrbanistBold"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 6.h, left: 24.h),
                              child: customText(
                                  name: "Keas 69 Str. 15234, Chalandri Athens, Greece",
                                  fontSize: 14.sp,
                                  color: primaryBoulder,
                                  fontFamily: "UrbanistRegular"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 18.h, left: 26.h, right: 24.h, bottom: 38.h),
                              child: Image.asset("assets/images/Map.png"),
                            ),
                          ],
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 15.h),
              child: CustomButton(
                name: "Get a Ticket",
                onTap: () {
                  Navigator.pushNamed(context, "payment");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

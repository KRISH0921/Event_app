import 'dart:convert';

import 'package:event_app/app/presentation/home_screen/model/home_model.dart';
import 'package:event_app/app/presentation/home_screen/model/all_category.dart';
import 'package:event_app/app/presentation/home_screen/model/detail_page_model.dart';
import 'package:event_app/app/presentation/home_screen/model/favorite_event.dart';
import 'package:event_app/app/presentation/home_screen/model/get_favorite_event.dart';
import 'package:event_app/app/presentation/home_screen/model/un_favorite_event.dart';
import 'package:event_app/app/presentation/home_screen/model/upcoming_event_model.dart';
import 'package:http/http.dart' as http;

class PostApi {
  var show;
  List<FavoriteRecord> likeList = [];

  Future<Event> popularEvent() async {
    Uri url = Uri.parse("https://web.templatevictory.com/api/popularevent");
    final response = await http.post(
      url, headers: {"Content-Type": "application/json"},
      // body: {
      // "_id": "658fa3aa0e82ee272bd9d792"
      // }
    );
    final body = json.decode(response.body);
    print("sdfsfsa======${body}");
    show = Event.fromMap(body);
    print("Data==${show}");
    return show;
  }

  Future<DetailPage> detailPage(String popularEventId) async {
    Uri url = Uri.parse("https://web.templatevictory.com/api/eventdetails");
    final response = await http.post(
      url, body: {"_id": popularEventId},
      // headers: {"Content-Type": "application/json"},
      // body: {
      //   "_id": popularEventId
      // }
    );
    print("rrrrrrrr======${response}");
    final body = json.decode(response.body);
    print("ffffff======${body}");
    show = DetailPage.fromMap(body);
    print("Data==${show}");
    return show;
  }

  Future<FavoriteEvent> favoriteEvent(String userId, eventId, token) async {

    var url = Uri.parse("https://web.templatevictory.com/api/favoriteevent");
    final response = await http.post(url,
        body: {
          "userId": userId,
          "eventId": eventId,
        },
        headers: {"Authorization": "Bearer ${token}"
        });
    final body = json.decode(response.body);
    print("favoriteEvent ======${body}");
    show = FavoriteEvent.fromMap(body);
    print("Data favoriteEvent =====${show}");
    return show;
  }

  

  Future<GetFavoriteEvent> getFavoriteEvent(String userId, token) async {
      var url = Uri.parse("https://web.templatevictory.com/api/getfavoriteevent");
    final response = await http.post(url,
        body: {
          "userId": userId,
        },
        headers: {"Authorization": "Bearer ${token}"
        },
    );
    final body = json.decode(response.body);
    print("favoriteEvent ======${body}");
    GetFavoriteEvent f1 = GetFavoriteEvent();
    f1 = GetFavoriteEvent.fromMap(body);
if(f1.status == "success"){
  likeList = f1.favorite!.records ??[];
  print("list ==============wew=== ${likeList[0].eventId!.id}");
}
    print("Data favoriteEvent =====${f1}");
    return f1;
  }

  Future<UnFavoriteEvent> unFavoriteEvent(String userId,eventId, token) async {
    likeList = [];
      var url = Uri.parse("https://web.templatevictory.com/api/unfavoriteevent");
    final response = await http.post(url,
        body:{
          "userId": userId,
          "eventId": eventId
        },
        headers: {"Authorization": "Bearer ${token}"
        },
    );
    final body = json.decode(response.body);
    print("UnFavoriteEvent ======${body}");
    show = UnFavoriteEvent.fromMap(body);
    print("Data UnFavoriteEvent =====${show}");
    return show;
  }

  Future<bool?> checkFavorite(String eventId) async {
    print("list ================= ${likeList}");
    getFavoriteEvent(eventId, "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MjkxMDllNjc3MDA0ZDQxZmQ1ZDU0MiIsImlhdCI6MTcxOTM4OTY4OX0.W9FcjO8nxRrrWKjvoqsXP8TmQRDRvD-L0qQ2qSBPECA");
    var contain = likeList.where((element) => element.eventId!.id == eventId);
    print("=====================s=======${ likeList.where((element) => element.eventId!.id == eventId)}");
    print("=====================adas=======$contain}");
    return contain.isNotEmpty;
  }

  Future<AllCategory> allCategory() async {
    var url = Uri.parse("https://web.templatevictory.com/api/allcategory");
    final response =
        await http.post(url, headers: {"Content-Type": "application/json"});
    final body = json.decode(response.body);
    print("sdfsfsa======${body}");
    show = AllCategory.fromMap(body);
    print("Data==${show}");
    return show;
  }

  Future<UpComingEvent> upComingEvent() async {
    var url = Uri.parse("https://web.templatevictory.com/api/featureevent");
    final response =
    await http.post(url, headers: {"Content-Type": "application/json"});
    final body = json.decode(response.body);
    print("sdfsfsa======${body}");
    show = UpComingEvent.fromMap(body);
    print("Data dfgsf==${show}");
    return show;
  }

}

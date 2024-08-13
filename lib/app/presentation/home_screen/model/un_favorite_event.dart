
import 'dart:convert';

import 'package:event_app/app/presentation/home_screen/model/get_favorite_event.dart';

UnFavoriteEvent unFavoriteEventFromMap(String str) => UnFavoriteEvent.fromMap(json.decode(str));


class UnFavoriteEvent {
  String? status;
  int? code;
  String? message;
  Favorite? favorite;

  UnFavoriteEvent({
    this.status,
    this.code,
    this.message,
    this.favorite,
  });

  factory UnFavoriteEvent.fromMap(Map<String, dynamic> json) => UnFavoriteEvent(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    favorite: json["Favorite"] == null ? null : Favorite.fromMap(json["Favorite"]),
  );

}

class Favorite {
  int? totalRecords;
  List<FavoriteRecord>? records;

  Favorite({
    this.totalRecords,
    this.records,
  });

  factory Favorite.fromMap(Map<String, dynamic> json) => Favorite(
    totalRecords: json["totalRecords"],
    records: json["records"] == null ? [] : List<FavoriteRecord>.from(json["records"]!.map((x) => FavoriteRecord.fromMap(x))),
  );

}

// class UnFavoriteRecord {
//   String? id;
//   String? userId;
//   EventId? eventId;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;
//
//   UnFavoriteRecord({
//     this.id,
//     this.userId,
//     this.eventId,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//   });
//
//   factory UnFavoriteRecord.fromMap(Map<String, dynamic> json) => UnFavoriteRecord(
//     id: json["_id"],
//     userId: json["userId"],
//     eventId: json["eventId"] == null ? null : EventId.fromMap(json["eventId"]),
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//   );
//
// }
//
// class EventId {
//   Location? location;
//   String? id;
//   Id? categoryId;
//   List<Id>? organizerId;
//   List<Id>? sponserId;
//   String? event;
//   String? avatar;
//   String? address;
//   DateTime? date;
//   DateTime? lastdate;
//   String? time;
//   String? price;
//   int? tax;
//   int? totalSeat;
//   bool? active;
//   List<String>? galleryImg;
//   String? desclaimer;
//   String? description;
//   String? briefdescription;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;
//
//   EventId({
//     this.location,
//     this.id,
//     this.categoryId,
//     this.organizerId,
//     this.sponserId,
//     this.event,
//     this.avatar,
//     this.address,
//     this.date,
//     this.lastdate,
//     this.time,
//     this.price,
//     this.tax,
//     this.totalSeat,
//     this.active,
//     this.galleryImg,
//     this.desclaimer,
//     this.description,
//     this.briefdescription,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//   });
//
//   factory EventId.fromMap(Map<String, dynamic> json) => EventId(
//     location: json["location"] == null ? null : Location.fromMap(json["location"]),
//     id: json["_id"],
//     categoryId: json["categoryId"] == null ? null : Id.fromMap(json["categoryId"]),
//     organizerId: json["organizerId"] == null ? [] : List<Id>.from(json["organizerId"]!.map((x) => Id.fromMap(x))),
//     sponserId: json["sponserId"] == null ? [] : List<Id>.from(json["sponserId"]!.map((x) => Id.fromMap(x))),
//     event: json["event"],
//     avatar: json["avatar"],
//     address: json["address"],
//     date: json["date"] == null ? null : DateTime.parse(json["date"]),
//     lastdate: json["lastdate"] == null ? null : DateTime.parse(json["lastdate"]),
//     time: json["time"],
//     price: json["price"],
//     tax: json["tax"],
//     totalSeat: json["totalSeat"],
//     active: json["active"],
//     galleryImg: json["galleryImg"] == null ? [] : List<String>.from(json["galleryImg"]!.map((x) => x)),
//     desclaimer: json["desclaimer"],
//     description: json["description"],
//     briefdescription: json["briefdescription"],
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//   );
// }
//
// class Id {
//   String? id;
//   String? category;
//   String? avatar;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;
//   String? organizer;
//   String? sponser;
//
//   Id({
//     this.id,
//     this.category,
//     this.avatar,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.organizer,
//     this.sponser,
//   });
//
//   factory Id.fromMap(Map<String, dynamic> json) => Id(
//     id: json["_id"],
//     category: json["category"],
//     avatar: json["avatar"],
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//     organizer: json["organizer"],
//     sponser: json["sponser"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "_id": id,
//     "category": category,
//     "avatar": avatar,
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "__v": v,
//     "organizer": organizer,
//     "sponser": sponser,
//   };
// }
//
// class Location {
//   double? latitude;
//   double? longitude;
//
//   Location({
//     this.latitude,
//     this.longitude,
//   });
//
//   factory Location.fromMap(Map<String, dynamic> json) => Location(
//     latitude: json["latitude"]?.toDouble(),
//     longitude: json["longitude"]?.toDouble(),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "latitude": latitude,
//     "longitude": longitude,
//   };
// }

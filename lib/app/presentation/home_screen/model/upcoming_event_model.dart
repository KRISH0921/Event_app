
import 'dart:convert';

import 'package:event_app/app/presentation/home_screen/model/home_model.dart';

UpComingEvent upComingFromMap(String str) => UpComingEvent.fromMap(json.decode(str));


class UpComingEvent {
  String? status;
  int? code;
  String? message;
  Events? events;

  UpComingEvent({
    this.status,
    this.code,
    this.message,
    this.events,
  });

  factory UpComingEvent.fromMap(Map<String, dynamic> json) => UpComingEvent(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    events: json["Events"] == null ? null : Events.fromMap(json["Events"]),
  );

}

class Events {
  int? totalRecords;
  List<EventsRecord>? record;

  Events({
    this.totalRecords,
    this.record,
  });

  factory Events.fromMap(Map<String, dynamic> json) => Events(
    totalRecords: json["totalRecords"],
    record: json["record"] == null ? [] : List<EventsRecord>.from(json["record"]!.map((x) => EventsRecord.fromMap(x))),
  );

}

// class Record {
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
//   int? totalBookedTickets;
//   List<Ticket>? tickets;
//
//   Record({
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
//     this.totalBookedTickets,
//     this.tickets,
//   });
//
//   factory Record.fromMap(Map<String, dynamic> json) => Record(
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
//     totalBookedTickets: json["totalBookedTickets"],
//     tickets: json["tickets"] == null ? [] : List<Ticket>.from(json["tickets"]!.map((x) => Ticket.fromMap(x))),
//   );
//
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
// }
//
// class Ticket {
//   String? userId;
//   String? name;
//   String? avatar;
//
//   Ticket({
//     this.userId,
//     this.name,
//     this.avatar,
//   });
//
//   factory Ticket.fromMap(Map<String, dynamic> json) => Ticket(
//     userId: json["userId"],
//     name: json["name"],
//     avatar: json["avatar"],
//   );
//
// }

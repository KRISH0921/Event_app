

import 'dart:convert';

AllCategory allCategoryFromJson(String str) => AllCategory.fromMap(json.decode(str));

class AllCategory {
  String? status;
  int? code;
  String? message;
  Categories? categories;

  AllCategory({
    this.status,
    this.code,
    this.message,
    this.categories,
  });

  factory AllCategory.fromMap(Map<String, dynamic> json) => AllCategory(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    categories: json["Categories"] == null ? null : Categories.fromMap(json["Categories"]),
  );

}

class Categories {
  int? totalRecords;
  List<CategoryRecord>? record;

  Categories({
    this.totalRecords,
    this.record,
  });

  factory Categories.fromMap(Map<String, dynamic> json) => Categories(
    totalRecords: json["totalRecords"],
    record: json["record"] == null ? [] : List<CategoryRecord>.from(json["record"]!.map((x) => CategoryRecord.fromMap(x))),
  );

}

class CategoryRecord {
  String? id;
  String? category;
  String? avatar;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CategoryRecord({
    this.id,
    this.category,
    this.avatar,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CategoryRecord.fromMap(Map<String, dynamic> json) => CategoryRecord(
    id: json["_id"],
    category: json["category"],
    avatar: json["avatar"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );


}

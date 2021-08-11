import 'dart:convert';

CenterList centerListFromJson(String str) =>
    CenterList.fromJson(json.decode(str));

String centerListToJson(CenterList data) => json.encode(data.toJson());

class CenterList {
  CenterList({
    this.currentCount = 0,
    this.data = const [],
    this.matchCount = 0,
    this.page = 0,
    this.perPage = 0,
    this.totalCount = 0,
  });

  int currentCount;
  List<Datum> data;
  int matchCount;
  int page;
  int perPage;
  int totalCount;

  factory CenterList.fromJson(Map<String, dynamic> json) => CenterList(
        currentCount: json["currentCount"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        matchCount: json["matchCount"],
        page: json["page"],
        perPage: json["perPage"],
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
        "currentCount": currentCount,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "matchCount": matchCount,
        "page": page,
        "perPage": perPage,
        "totalCount": totalCount,
      };
}

class Datum {
  Datum({
    required this.address,
    required this.centerName,
    required this.centerType,
    required this.createdAt,
    required this.facilityName,
    required this.id,
    required this.lat,
    required this.lng,
    required this.org,
    required this.phoneNumber,
    required this.sido,
    required this.sigungu,
    required this.updatedAt,
    required this.zipCode,
  });

  String address;
  String centerName;
  CenterType centerType;
  DateTime createdAt;
  String facilityName;
  int id;
  String lat;
  String lng;
  String org;
  String phoneNumber;
  String sido;
  String sigungu;
  DateTime updatedAt;
  String zipCode;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        address: json["address"],
        centerName: json["centerName"],
        centerType:
            centerTypeValues.map[json["centerType"]] ?? CenterType.EMPTY,
        createdAt: DateTime.parse(json["createdAt"]),
        facilityName: json["facilityName"],
        id: json["id"],
        lat: json["lat"],
        lng: json["lng"],
        org: json["org"],
        phoneNumber: json["phoneNumber"],
        sido: json["sido"],
        sigungu: json["sigungu"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        zipCode: json["zipCode"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "centerName": centerName,
        "centerType": centerTypeValues.reverse[centerType],
        "createdAt": createdAt.toIso8601String(),
        "facilityName": facilityName,
        "id": id,
        "lat": lat,
        "lng": lng,
        "org": org,
        "phoneNumber": phoneNumber,
        "sido": sido,
        "sigungu": sigungu,
        "updatedAt": updatedAt.toIso8601String(),
        "zipCode": zipCode,
      };
}

enum CenterType { EMPTY, CENTER_TYPE }

final centerTypeValues = EnumValues({
  "지역": CenterType.CENTER_TYPE,
  "중앙/권역": CenterType.EMPTY,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap.isEmpty) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
      return reverseMap;
    } else {
      return reverseMap;
    }
  }
}

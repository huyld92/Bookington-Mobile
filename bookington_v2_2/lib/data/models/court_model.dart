import 'package:intl/intl.dart';

class CourtModel {
  String ownerId;
  String districtId;
  String name;
  String address;
  DateTime openAt;
  DateTime closeAt;

  CourtModel(
      {required this.ownerId,
      required this.districtId,
      required this.name,
      required this.address,
      required this.openAt,
      required this.closeAt});

  factory CourtModel.fromJson(Map<String, dynamic> json) => CourtModel(
        ownerId: json["ownerId"],
        districtId: json["districtId"],
        name: json["name"],
        address: json["address"], 
        openAt: DateFormat("hh:mm:ss").parse(json["openAt"]),
        closeAt: DateFormat("hh:mm:ss").parse(json["closeAt"]),
      );

  static List<CourtModel> listFromJson(list) =>
      List<CourtModel>.from(list.map((x) => CourtModel.fromJson(x)));
}

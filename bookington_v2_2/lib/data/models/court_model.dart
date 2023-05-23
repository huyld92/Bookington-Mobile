// ignore for file: unnecessary getters setters

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/court_images.dart';
import 'package:intl/intl.dart';

class CourtModel {
  late String id;
  late String name;
  late String phone;
  late String districtName;
  late String address;
  late String description;
  late double moneyPerHour;
  late int numberOfSubCourt;
  late int numberOfReview;
  late double ratingStar;
  late DateTime openAt;
  late DateTime closeAt;
  late bool isActive;
  late List<CourtImage> listCourtImage;

  CourtModel(
      {required this.id,
      required this.name,
      required this.phone,
      required this.districtName,
      required this.address,
      required this.description,
      required this.moneyPerHour,
      required this.numberOfSubCourt,
      required this.numberOfReview,
      required this.ratingStar,
      required this.openAt,
      required this.closeAt,
      required this.isActive,
      required this.listCourtImage});

  factory CourtModel.fromJson(Map<String, dynamic> json) {
    List list = json["courtPictures"];
    bool checkList= false;
    if(list.isEmpty){
      checkList = true;
    }
    print('checkList=$checkList');
    return CourtModel(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        phone: json["phone"] ?? "0907777778",
        districtName: json["districtName"] ?? "",
        address: json["address"] ?? "",
        description: json["description"] ?? "",
        moneyPerHour: json["moneyPerHour"] * 1.0,
        numberOfSubCourt: json["numberOfSubCourt"] ?? 0,
        numberOfReview: json["numOfReview"],
        ratingStar: json["ratingStar"] * 1.0,
        openAt: DateFormat("HH:mm").parse(json["openAt"]),
        closeAt: DateFormat("HH:mm").parse(json["closeAt"]),
        isActive: json["isActive"],
        listCourtImage: checkList ? List.filled(1, CourtImage.empty()):CourtImage.listFromJson(json["courtPictures"]),
         // listCourtImage: json["isActive"]
      );
  }

  static List<CourtModel> listFromJson(list) =>
      List<CourtModel>.from(list.map((x) => CourtModel.fromJson(x)));

  factory CourtModel.empty() => CourtModel(
      id: "",
      name: "",
      phone: "",
      districtName: "",
      address: "",
      description: "",
      moneyPerHour: 0,
      numberOfSubCourt: 0,
      numberOfReview: 0,
      ratingStar: 0.0,
      openAt: DateTime.now(),
      closeAt: DateTime.now(),
      isActive: false,
      listCourtImage: List.empty());

  @override
  String toString() {
    return 'CourtModel{id: $id, name: $name, phone: $phone, districtName: $districtName, address: $address, description: $description, moneyPerHour: $moneyPerHour, numberOfSubCourt: $numberOfSubCourt, numberOfReview: $numberOfReview, ratingStar: $ratingStar, openAt: $openAt, closeAt: $closeAt, isActive: $isActive, listCourtImage: $listCourtImage}';
  }
}

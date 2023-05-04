// ignore_for_file: unnecessary_getters_setters

import 'package:bookington_v2_2/data/models/court_images.dart';
import 'package:intl/intl.dart';

class SearchModel {
  late String id;
  late String name;
  late double ratingStar;
  late String districtName;
  late String provinceName;
  late String moneyPerHour;
  late int numberOfSubCourt;
  late int numberOfReview;
  late DateTime openAt;
  late DateTime closeAt;
  late List<CourtImage> listCourtImage;

  SearchModel(
      {required this.id,
      required this.name,
      required this.ratingStar,
      required this.districtName,
      required this.provinceName,
      required this.moneyPerHour,
      required this.numberOfSubCourt,
      required this.numberOfReview,
      required this.openAt,
      required this.closeAt,
      required this.listCourtImage});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    final formatCurrency = NumberFormat("#,###");

    return SearchModel(
        id: json["id"]??"",
        name: json["name"]??"",
        ratingStar: json["ratingStar"].toDouble()??0.0,
        districtName: json["districtName"]??"",
        provinceName: json["provinceName"]??"",
        moneyPerHour: formatCurrency.format(json["moneyPerHour"]),
        numberOfSubCourt: json["numberOfSubCourt"],
        numberOfReview: json["numOfReview"],
        openAt: DateFormat("kk:mm").parse(json["openAt"]),
        closeAt: DateFormat("kk:mm").parse(json["closeAt"]),
        // listCourtImage: List.empty());
        listCourtImage: CourtImage.listFromJson(json["courtPictures"]));
  }

  static List<SearchModel> listFromJson(list) =>
      List<SearchModel>.from(list.map((dynamic x) => SearchModel.fromJson(x)));
}

// ignore_for_file: unnecessary_getters_setters

import 'package:bookington_v2_2/data/models/court_images.dart';
import 'package:intl/intl.dart';

class HomeCourtItemModel {
  late String _id;
  late String _name;
  late String _ratingStar;
  late String _districtName;
  late String _provinceName;
  late String _moneyPerHour;
  late String _numberOfSubCourt;
  late String _numberOfReview;
  late String _openAt;
  late String _closeAt;
  late List<CourtImage> _listCourtImage;

  HomeCourtItemModel(
      this._id,
      this._name,
      this._ratingStar,
      this._districtName,
      this._provinceName,
      this._moneyPerHour,
      this._numberOfSubCourt,
      this._numberOfReview,
      this._openAt,
      this._closeAt,
      this._listCourtImage);

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  factory HomeCourtItemModel.fromJson(Map<String, dynamic> json) {
    final formatCurrency = NumberFormat("#,###");

    return HomeCourtItemModel(
        json["id"],
        json["name"],
        json["ratingStar"].toString(),
        json["districtName"],
        json["provinceName"],
        formatCurrency.format(json["moneyPerHour"]),
        json["numberOfSubCourt"].toString(),
        json["numOfReview"].toString(),
        DateFormat("kk:mm").parse(json["openAt"]).toString(),
        DateFormat("kk:mm").parse(json["closeAt"]).toString(),
        // List.empty(),
        CourtImage.listFromJson(json["courtPictures"]),
      );
  }
  HomeCourtItemModel.empty(){
    _id = "";
    _name = "";
    _ratingStar = "";
    _districtName = "";
    _provinceName = "";
    _moneyPerHour = "";
    _numberOfSubCourt = "";
    _numberOfReview = "";
    _openAt = "";
    _closeAt = "";
    _listCourtImage = List.empty();
  }
  static List<HomeCourtItemModel> listFromJson(list) =>
      List<HomeCourtItemModel>.from(
          list.map((dynamic x) => HomeCourtItemModel.fromJson(x)));


  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get ratingStar => _ratingStar;

  set ratingStar(String value) {
    _ratingStar = value;
  }

  String get districtName => _districtName;

  set districtName(String value) {
    _districtName = value;
  }

  String get provinceName => _provinceName;

  set provinceName(String value) {
    _provinceName = value;
  }

  String get moneyPerHour => _moneyPerHour;

  set moneyPerHour(String value) {
    _moneyPerHour = value;
  }

  String get numberOfSubCourt => _numberOfSubCourt;

  set numberOfSubCourt(String value) {
    _numberOfSubCourt = value;
  }

  String get numberOfReview => _numberOfReview;

  set numberOfReview(String value) {
    _numberOfReview = value;
  }

  String get openAt => _openAt;

  set openAt(String value) {
    _openAt = value;
  }

  String get closeAt => _closeAt;

  set closeAt(String value) {
    _closeAt = value;
  }

  List<CourtImage> get listCourtImage => _listCourtImage;

  set listCourtImage(List<CourtImage> value) {
    _listCourtImage = value;
  }
}

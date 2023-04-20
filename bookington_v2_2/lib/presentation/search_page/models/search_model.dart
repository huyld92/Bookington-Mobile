// ignore_for_file: unnecessary_getters_setters

import 'package:intl/intl.dart';

class SearchModel {
  late String _id;
  late String _name;
  late double _ratingStar;
  late String _districtName;
  late String _provinceName;
  late String _moneyPerHour;
  late int _numberOfSubCourt;
  late int _numberOfReview;
  late DateTime _openAt;
  late DateTime _closeAt;

  SearchModel(
      this._id,
      this._name,
      this._ratingStar,
      this._districtName,
      this._provinceName,
      this._moneyPerHour,
      this._numberOfSubCourt,
      this._numberOfReview,
      this._openAt,
      this._closeAt);

  String get id => _id;

  set id(String value) {
    _id = value;
  } // CourtImage courtPicture;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  double get ratingStar => _ratingStar;

  set ratingStar(double value) {
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

  int get numberOfSubCourt => _numberOfSubCourt;

  set numberOfSubCourt(int value) {
    _numberOfSubCourt = value;
  }

  int get numberOfReview => _numberOfReview;

  set numberOfReview(int value) {
    _numberOfReview = value;
  }

  DateTime get openAt => _openAt;

  set openAt(DateTime value) {
    _openAt = value;
  }

  DateTime get closeAt => _closeAt;

  set closeAt(DateTime value) {
    _closeAt = value;
  }

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    final formatCurrency = NumberFormat("#,###");

    return SearchModel(
      json["id"],
      json["name"],
      json["ratingStar"].toDouble(),
      json["districtName"],
      json["provinceName"],
      formatCurrency.format(json["moneyPerHour"]),
      json["numberOfSubCourt"],
      json["numOfReview"],
      DateFormat("kk:mm").parse(json["openAt"]),
      DateFormat("kk:mm").parse(json["closeAt"]),
    );
  }

  static List<SearchModel> listFromJson(list) =>
      List<SearchModel>.from(list.map((dynamic x) => SearchModel.fromJson(x)));

  SearchModel.search(
    this._name,
    this._districtName,
    this._provinceName,
  );
}

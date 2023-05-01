// ignore_for_file: unnecessary_getters_setters

import 'package:intl/intl.dart';

class CourtModel {
  String _id;
  String _name;
  String _phone;
  String _districtName;
  String _address;
  String _description;
  double _moneyPerHour;
  int _numberOfSubCourt;
  int _numberOfReview;
  double _ratingStar;
  DateTime _openAt;
  DateTime _closeAt;
  bool _isActive;

  CourtModel(
      this._id,
      this._name,
      this._phone,
      this._districtName,
      this._address,
      this._description,
      this._moneyPerHour,
      this._numberOfSubCourt,
      this._numberOfReview,
      this._ratingStar,
      this._openAt,
      this._closeAt,
      this._isActive);

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  factory CourtModel.fromJson(Map<String, dynamic> json) => CourtModel(
        json["id"],
        json["name"],
        json["phone"] ?? "0907777778",
        json["districtName"],
        json["address"],
        json["description"]??"",
        json["moneyPerHour"]*1.0,
        json["numberOfSubCourt"],
        json["numOfReview"],
        json["ratingStar"] *1.0,
        DateFormat("hh:mm:ss").parse(json["openAt"]),
        DateFormat("hh:mm:ss").parse(json["closeAt"]),
        json["isActive"],
      );

  static List<CourtModel> listFromJson(list) =>
      List<CourtModel>.from(list.map((x) => CourtModel.fromJson(x)));

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get districtName => _districtName;

  set districtName(String value) {
    _districtName = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  double get moneyPerHour => _moneyPerHour;

  set moneyPerHour(double value) {
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

  double get ratingStar => _ratingStar;

  set ratingStar(double value) {
    _ratingStar = value;
  }

  DateTime get openAt => _openAt;

  set openAt(DateTime value) {
    _openAt = value;
  }

  DateTime get closeAt => _closeAt;

  set closeAt(DateTime value) {
    _closeAt = value;
  }

  bool get isActive => _isActive;

  set isActive(bool value) {
    _isActive = value;
  }
}

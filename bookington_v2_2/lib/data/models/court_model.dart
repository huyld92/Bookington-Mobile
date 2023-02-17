import 'package:intl/intl.dart';

class CourtModel {
  late String _id;
  late String _name;
  late double _ratingStar;
  late String _districtName;
  late String _provinceName;
  late double _moneyPerHour;
  late int _numberOfSubCourt;
  late DateTime _openAt;
  late DateTime _closeAt;

  CourtModel(
      this._id,
      this._name,
      this._ratingStar,
      this._districtName,
      this._provinceName,
      this._moneyPerHour,
      this._numberOfSubCourt,
      this._openAt,
      this._closeAt);

  CourtModel.search(this._name, this._districtName, this._provinceName);

  factory CourtModel.fromJson(Map<String, dynamic> json) => CourtModel(
        json["id"],
        json["name"],
        double.parse(json["ratingStar"]),
        json["districtName"],
        json["provinceName"],
        double.parse(json["moneyPerHour"]),
        int.parse(json["numberOfSubCourt"]),
        DateFormat("hh:mm:ss").parse(json["openAt"]),
        DateFormat("hh:mm:ss").parse(json["closeAt"]),
      );

  static List<CourtModel> listFromJson(list) =>
      List<CourtModel>.from(list.map((x) => CourtModel.fromJson(x)));

  DateTime get closeAt => _closeAt;

  set closeAt(DateTime value) {
    _closeAt = value;
  }

  DateTime get openAt => _openAt;

  set openAt(DateTime value) {
    _openAt = value;
  }

  int get numberOfSubCourt => _numberOfSubCourt;

  set numberOfSubCourt(int value) {
    _numberOfSubCourt = value;
  }

  double get moneyPerHour => _moneyPerHour;

  set moneyPerHour(double value) {
    _moneyPerHour = value;
  }

  String get provinceName => _provinceName;

  set provinceName(String value) {
    _provinceName = value;
  }

  String get districtName => _districtName;

  set districtName(String value) {
    _districtName = value;
  }

  double get ratingStar => _ratingStar;

  set ratingStar(double value) {
    _ratingStar = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}

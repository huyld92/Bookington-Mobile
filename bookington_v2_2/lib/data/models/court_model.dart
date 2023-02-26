import 'package:intl/intl.dart';

class CourtModel {
  String _id;
  String _ownerId;
  String _districtId;
  String _name;
  String _address;
  DateTime _openAt;
  DateTime _closeAt;

  CourtModel(this._id, this._ownerId, this._districtId, this._name,
      this._address, this._openAt, this._closeAt);

  DateTime get closeAt => _closeAt;

  set closeAt(DateTime value) {
    _closeAt = value;
  }

  DateTime get openAt => _openAt;

  set openAt(DateTime value) {
    _openAt = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get districtId => _districtId;

  set districtId(String value) {
    _districtId = value;
  }

  String get ownerId => _ownerId;

  set ownerId(String value) {
    _ownerId = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  factory CourtModel.fromJson(Map<String, dynamic> json) => CourtModel(
        json["id"],
        json["ownerId"],
        json["districtId"],
        json["name"],
        json["districtId"],
        DateFormat("hh:mm:ss").parse(json["openAt"]),
        DateFormat("hh:mm:ss").parse(json["closeAt"]),
      );

  static List<CourtModel> listFromJson(list) =>
      List<CourtModel>.from(list.map((x) => CourtModel.fromJson(x)));
}

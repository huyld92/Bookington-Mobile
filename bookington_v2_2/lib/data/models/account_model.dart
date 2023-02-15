


import 'dart:convert';

AccountModel accountRespFromJson(String str) => AccountModel.fromJson(json.decode(str));

String accountRespToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
  String _id;
  String _roleId;
  String _phone;
  String _password;
  String _fullName;
  DateTime _dateOfBirth;
  DateTime _createAt;
  bool _isActive;

  AccountModel(this._id, this._roleId, this._phone, this._password,
      this._fullName, this._dateOfBirth, this._createAt, this._isActive);

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get roleId => _roleId;

  bool get isActive => _isActive;

  set isActive(bool value) {
    _isActive = value;
  }

  DateTime get createAt => _createAt;

  set createAt(DateTime value) {
    _createAt = value;
  }

  DateTime get dateOfBirth => _dateOfBirth;

  set dateOfBirth(DateTime value) {
    _dateOfBirth = value;
  }

  String get fullName => _fullName;

  set fullName(String value) {
    _fullName = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  set roleId(String value) {
    _roleId = value;
  }

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
      json["id"],
      json["role_id"],
      json["phone"],
      json["password"],
      json["full_name"],
      json["date_of_birth"],
      json["create_at"],
      json["is_active"]);

  Map<String, dynamic> toJson() => {
        "id": _id,
        "role_id": _roleId,
        "phone": _phone,
        "password": _password,
        "full_name": _fullName,
        "date_of_birth": _dateOfBirth,
        "create_at": _createAt,
        "is_active": _isActive,
      };
}

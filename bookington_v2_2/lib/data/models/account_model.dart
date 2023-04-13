


// ignore_for_file: unnecessary_getters_setters

import 'dart:convert';

import 'package:intl/intl.dart';

AccountModel accountRespFromJson(String str) => AccountModel.fromJson(json.decode(str));

String accountRespToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
  late String _id;
  late String _phone;
  late String _fullName;
  late DateTime _dateOfBirth;
  late String _imgBase;

  AccountModel(this._id, this._phone,
      this._fullName, this._dateOfBirth, this._imgBase);

  AccountModel.empty(){
    _id = "";
    _phone = "";
    _fullName = "";
    _dateOfBirth = DateTime.now();
    _imgBase = "";
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }


  DateTime get dateOfBirth => _dateOfBirth;

  set dateOfBirth(DateTime value) {
    _dateOfBirth = value;
  }

  String get fullName => _fullName;

  set fullName(String value) {
    _fullName = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get imgBase => _imgBase;

  set imgBase(String value) {
    _imgBase = value;
  }


  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
      json["id"]?? "aaa",
      json["phone"],
      json["fullName"],
      DateFormat("dd-MM-yyyy").parse(json["dateOfBirth"]),
      json["file"]["content"],
  );


  Map<String, dynamic> toJson() => {
        "id": _id,
        "phone": _phone,
        "full_name": _fullName,
        "date_of_birth": _dateOfBirth,
      };
}

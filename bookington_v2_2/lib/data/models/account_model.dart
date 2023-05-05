// ignore_for_file: unnecessary_getters_setters

import 'dart:convert';
import 'dart:typed_data';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:intl/intl.dart';

AccountModel accountRespFromJson(String str) =>
    AccountModel.fromJson(json.decode(str));

String accountRespToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
  late String _id;
  late String _phone;
  late String _fullName;
  late DateTime _dateOfBirth;
  late Uint8List _imgBase;

  AccountModel(
      this._id, this._phone, this._fullName, this._dateOfBirth, this._imgBase);

  AccountModel.empty() {
    _id = "";
    _phone = "";
    _fullName = "Dao Duc Huy";
    _dateOfBirth = DateTime.now();
    _imgBase = Uint8List(0);
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

  Uint8List get imgBase => _imgBase;

  set imgBase(Uint8List value) {
    _imgBase = value;
  }

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    Uint8List bytesImage;
     if (json["file"] != null) {
      bytesImage = const Base64Decoder().convert(json["file"]["content"]);
    } else {
      bytesImage = const Base64Decoder().convert(ImageConstant.noAvatarBase);
    }
    DateTime date = DateFormat("dd-MM-yyyy").parse(json["dateOfBirth"]);
    if(date.year < 1900){
      date= DateTime.now();
    }

    return AccountModel(
      json["id"] ?? "aaa",
      json["phone"],
      json["fullName"],
      date,
      bytesImage,
    );
  }


  Map<String, dynamic> toJson() => {
        "id": _id,
        "phone": _phone,
        "full_name": _fullName,
        "date_of_birth": _dateOfBirth,
      };
}

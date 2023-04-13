// ignore_for_file: unnecessary_getters_setters

import 'package:intl/intl.dart';

class VoucherModel {
  late String _id;
  late String _createBy;
  late String _refCourt;
  late String _voucherCode;
  late String _title;
  late String _description;
  late double _discount;
  late int _usages;
  late int _maxQuantity;
  late DateTime _startDate;
  late DateTime _endDate;
  late DateTime _createAt;
  late bool _isActive;

  VoucherModel(
      this._id,
      this._createBy,
      this._refCourt,
      this._voucherCode,
      this._title,
      this._description,
      this._discount,
      this._usages,
      this._maxQuantity,
      this._startDate,
      this._endDate,
      this._createAt,
      this._isActive);
  VoucherModel.empty(){
    _id = "";
    _createBy = "";
    _refCourt = "";
    _voucherCode = "";
    _title = "";
    _description = "";
    _discount = 0.0;
    _usages = 0;
    _maxQuantity = 0;
    _startDate = DateTime.now();
    _endDate = DateTime.now();
    _createAt = DateTime.now();
    _isActive = false;
  }

  bool get isActive => _isActive;

  set isActive(bool value) {
    _isActive = value;
  }

  DateTime get createAt => _createAt;

  set createAt(DateTime value) {
    _createAt = value;
  }

  DateTime get endDate => _endDate;

  set endDate(DateTime value) {
    _endDate = value;
  }

  DateTime get startDate => _startDate;

  set startDate(DateTime value) {
    _startDate = value;
  }

  int get maxQuantity => _maxQuantity;

  set maxQuantity(int value) {
    _maxQuantity = value;
  }

  int get usages => _usages;

  set usages(int value) {
    _usages = value;
  }

  double get discount => _discount;

  set discount(double value) {
    _discount = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get voucherCode => _voucherCode;

  set voucherCode(String value) {
    _voucherCode = value;
  }

  String get refCourt => _refCourt;

  set refCourt(String value) {
    _refCourt = value;
  }

  String get createBy => _createBy;

  set createBy(String value) {
    _createBy = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  factory VoucherModel.fromJson(Map<String, dynamic> json) => VoucherModel(
        json["id"],
        json["createBy"],
        json["refCourt"],
        json["voucherCode"],
        json["title"],
        json["description"],
        json["discount"]*1.0,
        json["usages"],
        json["maxQuantity"],
        DateFormat("yyyy-MM-ddTHH:mm:ss").parse(json["startDate"]),
        DateFormat("yyyy-MM-ddTHH:mm:ss").parse(json["endDate"]),
        DateFormat("yyyy-MM-ddTHH:mm:ss").parse(json["createAt"]),
        json["isActive"],
      );

  static List<VoucherModel> listFromJson(list) => List<VoucherModel>.from(
      list.map((dynamic x) => VoucherModel.fromJson(x)));
}

// ignore_for_file: unnecessary_getters_setters

import 'package:intl/intl.dart';

class TransactionModel {
  late String _id;
  late String _refFrom;
  late String _fromUsername;
  late String _refTo;
  late String _toUsername;
  late String _reason;
  late DateTime _createAt;
  late String _amount;

  TransactionModel(this._id, this._refFrom, this._fromUsername, this._refTo,
      this._toUsername, this._reason, this._createAt, this._amount);

  TransactionModel.empty() {
    _id = "";
    _refFrom = "";
    _fromUsername = "";
    _refTo = "";
    _toUsername = "";
    _reason = "";
    _createAt = DateTime.now();
    _amount = "";
  }

  String get amount => _amount;

  set amount(String value) {
    _amount = value;
  }

  DateTime get createAt => _createAt;

  set createAt(DateTime value) {
    _createAt = value;
  }

  String get toUsername => _toUsername;

  String get reason => _reason;

  set reason(String value) {
    _reason = value;
  }

  set toUsername(String value) {
    _toUsername = value;
  }

  String get refTo => _refTo;

  set refTo(String value) {
    _refTo = value;
  }

  String get fromUsername => _fromUsername;

  set fromUsername(String value) {
    _fromUsername = value;
  }

  String get refFrom => _refFrom;

  set refFrom(String value) {
    _refFrom = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    final formatCurrency = NumberFormat("#,###");
    return TransactionModel(
      json["id"],
      json["refFrom"],
      json["fromUsername"] ?? "a",
      json["refTo"],
      json["toUsername"] ?? "b",
      // json["reason"].toString(),
      "Payment for booking",
      DateFormat("yyyy-MM-dd").parseUTC(json["createAt"]),
      "${formatCurrency.format(json["amount"])} đ",
    );
  }

  static List<TransactionModel> listFromJson(list) =>
      List<TransactionModel>.from(
          list.map((x) => TransactionModel.fromJson(x)));
}

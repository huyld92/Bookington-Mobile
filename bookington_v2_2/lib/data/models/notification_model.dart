// ignore_for_file: unnecessary_getters_setters

import 'package:intl/intl.dart';

class NotificationModel {
  late String _id;
  late String _refAccount;
  late String _content;
  late DateTime _createAt;
  late bool _isRead;

  NotificationModel(
      this._id, this._refAccount, this._content, this._createAt, this._isRead);

  NotificationModel.empty() {
    _id = "";
    _refAccount = "";
    _content = "";
    _createAt = DateTime.now();
    _isRead = false;
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(json["id"], json["refAccount"], json["content"],
          DateFormat("yyyy-MM-dd").parse(json["createAt"]), json["isRead"]);

  static List<NotificationModel> listFromJson(list) =>
      List<NotificationModel>.from(
          list.map((x) => NotificationModel.fromJson(x)));

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get refAccount => _refAccount;

  set refAccount(String value) {
    _refAccount = value;
  }

  String get content => _content;

  set content(String value) {
    _content = value;
  }

  DateTime get createAt => _createAt;

  set createAt(DateTime value) {
    _createAt = value;
  }

  bool get isRead => _isRead;

  set isRead(bool value) {
    _isRead = value;
  }
}

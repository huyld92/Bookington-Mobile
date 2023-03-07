import 'package:intl/intl.dart';

class NotificationModel {
  String _id;
  String _refAccount;
  String _content;
  DateTime _createAt;
  bool _isRead;

  NotificationModel(
      this._id, this._refAccount, this._content, this._createAt, this._isRead);

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

// ignore_for_file: unnecessary_getters_setters

import 'package:intl/intl.dart';

class NotificationModel {
  late String id;
  late String refAccount;
  late String content;
  late DateTime createAt;
  late bool isRead;

  NotificationModel(
      {required this.id,
      required this.refAccount,
      required this.content,
      required this.createAt,
      required this.isRead});

  NotificationModel.empty() {
    id = "";
    refAccount = "";
    content = "";
    createAt = DateTime.now();
    isRead = false;
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    DateTime createAt = DateFormat("yyyy-MM-ddTHH:mmz").parseUTC(json["createAt"]).toLocal();
    return NotificationModel(
          id: json["id"],
          refAccount: json["refAccount"],
          content: json["content"],
          createAt: createAt,
          isRead: json["isRead"]);
  }

  static List<NotificationModel> listFromJson(list) =>
      List<NotificationModel>.from(
          list.map((dynamic x) => NotificationModel.fromJson(x)));
}

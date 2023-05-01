// ignore_for_file: unnecessary_getters_setters

import 'package:bookington_v2_2/data/models/account_model.dart';
import 'package:intl/intl.dart';

class CommentModel {
  late String id;
  late AccountModel commentWriter;
  late String refCourt;
  late String content;
  late double rating;
  late DateTime createAt;
  late bool isActive;

  CommentModel(
      {required this.id,
      required this.commentWriter,
      required this.refCourt,
      required this.content,
      required this.rating,
      required this.createAt,
      required this.isActive});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    DateTime createAt = DateFormat("yyyy-MM-dd").parseUTC(json["createAt"]).toLocal();
    return CommentModel(
        id: json["id"],
        commentWriter: AccountModel.fromJson(json["commentWriter"]),
        refCourt: json["refCourt"],
        content: json["content"],
        rating: json["rating"] * 1.0,
        createAt: createAt,
        isActive: json["isActive"],
      );
  }

  static List<CommentModel> listFromJson(list) =>
      List<CommentModel>.from(list.map((x) => CommentModel.fromJson(x)));

  CommentModel.empty() {
    id = "";
    commentWriter = AccountModel.empty();
    refCourt = "";
    content = "";
    rating = 0.0;
    createAt = DateTime.now();
    isActive = false;
  }
}

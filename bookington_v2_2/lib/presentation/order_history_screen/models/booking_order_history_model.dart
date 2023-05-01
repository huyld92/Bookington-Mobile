import 'package:intl/intl.dart';

class BookingOrderHistoryModel {
  String id;
  String subCourtName;
  DateTime playDate;
  DateTime startTime;
  DateTime endTime;
  double price;
  bool isCancel;

  BookingOrderHistoryModel(
      {required this.id,
      required this.subCourtName,
      required this.playDate,
      required this.startTime,
      required this.endTime,
      required this.price,
      required this.isCancel});

  factory BookingOrderHistoryModel.fromJson(Map<String, dynamic> json) {
    var dateValue = DateFormat("yyyy-MM-dd")
        .parseUTC(json["playDate"])
        .toLocal()
        .toString();
    DateTime playDate = DateFormat("yyyy-MM-dd").parse(dateValue);

    return BookingOrderHistoryModel(
      id: json["id"] ?? "",
      subCourtName: json["subCourtName"] ?? "",
      playDate: playDate,
      startTime: DateFormat("HH:mm").parse(json["startTime"]),
      endTime: DateFormat("HH:mm").parse(json["endTime"]),
      price: json["price"]*1.0 ?? 0.0,
      isCancel: json["isCancel"] ?? false,
    );
  }

  static List<BookingOrderHistoryModel> listFromJson(list) =>
      List<BookingOrderHistoryModel>.from(
          list.map((x) => BookingOrderHistoryModel.fromJson(x)));
}

// ignore_for_file: unnecessary_getters_setters

import 'package:intl/intl.dart';

class BookingModel {

  String _id;
  String _refSlot;
  String _refOrder;
  String _bookBy;
  DateTime _bookAt;
  DateTime _playDate;
  double _price;

  BookingModel(this._id, this._refSlot, this._refOrder, this._bookBy,
      this._bookAt, this._playDate, this._price);

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get refSlot => _refSlot;

  set refSlot(String value) {
    _refSlot = value;
  }

  String get refOrder => _refOrder;

  set refOrder(String value) {
    _refOrder = value;
  }

  String get bookBy => _bookBy;

  set bookBy(String value) {
    _bookBy = value;
  }

  DateTime get bookAt => _bookAt;

  set bookAt(DateTime value) {
    _bookAt = value;
  }

  DateTime get playDate => _playDate;

  set playDate(DateTime value) {
    _playDate = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    var dateValue = DateFormat("yyyy-MM-dd")
        .parseUTC(json["playDate"])
        .toLocal()
        .toString();
    DateTime playDate = DateFormat("yyyy-MM-dd").parse(dateValue);

    return BookingModel(
        json["id"],
        json["refSlot"],
        json["refOrder"],
        json["bookBy"],
        DateFormat("dd-MM-yyyy").parse(json["bookAt"]),
      playDate,
        json["price"]*1.0,
      );
  }

  static List<BookingModel> listFromJson(list) =>
      List<BookingModel>.from(list.map((x) => BookingModel.fromJson(x)));
}

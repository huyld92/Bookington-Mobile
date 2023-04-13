// ignore_for_file: unnecessary_getters_setters

import 'package:intl/intl.dart';

class SlotModel {
  String _slotId;
  DateTime _startTime;
  DateTime _endTime;
  double _price;
  bool _isAvailable;

  SlotModel(
      this._slotId, this._startTime, this._endTime, this._price, this._isAvailable);

  bool get isActive => _isAvailable;

  set isActive(bool value) {
    _isAvailable = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  DateTime get endTime => _endTime;

  set endTime(DateTime value) {
    _endTime = value;
  }

  DateTime get startTime => _startTime;

  set startTime(DateTime value) {
    _startTime = value;
  }

  String get id => _slotId;

  set id(String value) {
    _slotId = value;
  }

  factory SlotModel.fromJson(Map<String, dynamic> json) =>
      SlotModel(
        json["id"],
        DateFormat("HH:mm").parse(json["startTime"]),
        DateFormat("HH:mm").parse(json["endTime"]),
        json["price"]*1.0,
        json["isAvailable"],
      );

  static List<SlotModel> listFromJson(list) =>
      List<SlotModel>.from(
          list.map((dynamic x) => SlotModel.fromJson(x)));
}

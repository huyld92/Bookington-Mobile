

import 'package:intl/intl.dart';

class BookingHistoryModel{

  late String _courtName;
  late String _subCourtName;
  late DateTime _playDate;
  late DateTime _startTime;
  late DateTime _endTime;
  late String _status;

  BookingHistoryModel(this._courtName, this._subCourtName, this._playDate,
      this._startTime, this._endTime, this._status);

  BookingHistoryModel.empty(){
    _courtName= "";
    _subCourtName= "";
    _playDate= DateTime.now();
    _startTime= DateTime.now();
    _endTime=  DateTime.now();
    _status= "";
  }

  String get status => _status;

  set status(String value) {
    _status = value;
  }

  DateTime get endTime => _endTime;

  set endTime(DateTime value) {
    _endTime = value;
  }

  DateTime get startTime => _startTime;

  set startTime(DateTime value) {
    _startTime = value;
  }

  DateTime get playDate => _playDate;

  set playDate(DateTime value) {
    _playDate = value;
  }

  String get subCourtName => _subCourtName;

  set subCourtName(String value) {
    _subCourtName = value;
  }

  String get courtName => _courtName;

  set courtName(String value) {
    _courtName = value;
  }

  factory BookingHistoryModel.fromJson(Map<String, dynamic> json) => BookingHistoryModel(
    json["courtName"],
    json["subCourtName"],
    DateFormat("dd-MM-yyyy").parse(json["playDate"]),
    DateFormat("hh:mm:ss").parse(json["openAt"]),
    DateFormat("hh:mm:ss").parse(json["closeAt"]),
    json["isActive"],
  );

  static List<BookingHistoryModel> listFromJson(list) =>
      List<BookingHistoryModel>.from(list.map((x) => BookingHistoryModel.fromJson(x)));
  
  
}
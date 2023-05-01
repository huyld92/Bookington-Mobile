// ignore_for_file: unnecessary_getters_setters

import 'package:bookington_v2_2/data/models/court_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'slidericon_item_model.dart';
import 'listfive_item_model.dart';

class CourtDetailsModel {
  late String _id;
  late String _name;
  late String _ownerPhoneNumber;
  late double _ratingStar;
  late String _districtName;
  late String _address;
  late String _description;
  late String _moneyPerHour;
  late int _numberOfSubCourt;
  late int _numberOfReview;
  late DateTime _openAt;
  late DateTime _closeAt;
  late bool _isActive;

  // CourtDetailsModel(
  //     this._id,
  //     this._name,
  //     this._ownerPhoneNumber,
  //     this._ratingStar,
  //     this._districtName,
  //     this._address,
  //     this._moneyPerHour,
  //     this._numberOfSubCourt,
  //     this._numberOfReview,
  //     this._openAt,
  //     this._closeAt,
  //     this._isActive);
  CourtDetailsModel(CourtModel court) {
    _id = court.id;
    _name = court.name;
    _ownerPhoneNumber = court.phone;
    _districtName = court.districtName;
    _address = court.address;
    _description = court.description;
    final formatCurrency = NumberFormat("#,###");
    _moneyPerHour = "${formatCurrency.format(court.moneyPerHour)}d";
    _ratingStar = court.ratingStar *1.0;
    _numberOfSubCourt = court.numberOfSubCourt;
    _numberOfReview = court.numberOfReview;
    _openAt = court.openAt;
    _closeAt = court.closeAt;
  }

  CourtDetailsModel.empty() {
    _id = "";
    _name = "";
    _ownerPhoneNumber = "";
    _ratingStar = 0.0;
    _districtName = "";
    _address = "";
    _description = "";
    _moneyPerHour = "0";
    _numberOfSubCourt = 0;
    _numberOfReview = 0;
    _openAt = DateFormat("kk:mm").parse("00:00");
    _closeAt = DateFormat("kk:mm").parse("00:00");
    _isActive = false;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get ownerPhoneNumber => _ownerPhoneNumber;

  set ownerPhoneNumber(String value) {
    _ownerPhoneNumber = value;
  }

  double get ratingStar => _ratingStar;

  set ratingStar(double value) {
    _ratingStar = value;
  }

  String get districtName => _districtName;

  set districtName(String value) {
    _districtName = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get moneyPerHour => _moneyPerHour;

  set moneyPerHour(String value) {
    _moneyPerHour = value;
  }

  int get numberOfSubCourt => _numberOfSubCourt;

  set numberOfSubCourt(int value) {
    _numberOfSubCourt = value;
  }

  int get numberOfReview => _numberOfReview;

  set numberOfReview(int value) {
    _numberOfReview = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  DateTime get openAt => _openAt;

  set openAt(DateTime value) {
    _openAt = value;
  }

  DateTime get closeAt => _closeAt;

  set closeAt(DateTime value) {
    _closeAt = value;
  }

  bool get isActive => _isActive;

  set isActive(bool value) {
    _isActive = value;
  }

  CourtDetailsModel.search(
    this._name,
    this._districtName,
    this._address,
  );

  RxList<SlidericonItemModel> slidericonItemList =
      RxList.filled(2, SlidericonItemModel());

  RxList<ListfiveItemModel> listfiveItemList =
      RxList.filled(5, ListfiveItemModel());
  //
  // RxList<ListdateItemModel> listdateItemList =
  //     RxList.filled(5, ListdateItemModel());
}

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'slidericon_item_model.dart';
import 'listfive_item_model.dart';
import 'listdate_item_model.dart';
import 'listrectangle4224_item_model.dart';

class CourtDetailsModel {
  late String _id;
  late String _name;
  late double _ratingStar;
  late String _districtName;
  late String _address;
  late double _moneyPerHour;
  late int _numberOfSubCourt;
  late DateTime _openAt;
  late DateTime _closeAt;

  CourtDetailsModel(
      this._id,
      this._name,
      this._ratingStar,
      this._districtName,
      this._address,
      this._moneyPerHour,
      this._numberOfSubCourt,
      this._openAt,
      this._closeAt);

  CourtDetailsModel.empty(){
    this._id="";
    this._name="";
    this._ratingStar= 0.0;
    this._districtName="";
    this._address="";
    this._moneyPerHour=0;
    this._numberOfSubCourt=0;
    this._openAt= DateFormat("kk:mm").parse("00:00");
     this._closeAt=DateFormat("kk:mm").parse("00:00");
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  } // CourtImage courtPicture;

  String get name => _name;

  set name(String value) {
    _name = value;
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

  double get moneyPerHour => _moneyPerHour;

  set moneyPerHour(double value) {
    _moneyPerHour = value;
  }

  int get numberOfSubCourt => _numberOfSubCourt;

  set numberOfSubCourt(int value) {
    _numberOfSubCourt = value;
  }

  DateTime get openAt => _openAt;

  set openAt(DateTime value) {
    _openAt = value;
  }

  DateTime get closeAt => _closeAt;

  set closeAt(DateTime value) {
    _closeAt = value;
  }

  factory CourtDetailsModel.fromJson(Map<String, dynamic> json) => CourtDetailsModel(
    json["id"],
    json["name"],
    json["ratingStar"].toDouble(),
    json["districtName"],
    json["provinceName"],
    json["moneyPerHour"].toDouble(),
    json["numberOfSubCourt"],
    DateFormat("kk:mm").parse(json["openAt"]),
    DateFormat("kk:mm").parse(json["closeAt"]),
  );

  static List<CourtDetailsModel> listFromJson(list) =>
      List<CourtDetailsModel>.from(list.map((dynamic x) => CourtDetailsModel.fromJson(x)));

  CourtDetailsModel.search(
      this._name,
      this._districtName,
      this._address,
      );

  RxList<SlidericonItemModel> slidericonItemList =
      RxList.filled(2, SlidericonItemModel());

  RxList<ListfiveItemModel> listfiveItemList =
      RxList.filled(5, ListfiveItemModel());

  RxList<ListdateItemModel> listdateItemList =
      RxList.filled(5, ListdateItemModel());

  RxList<Listrectangle4224ItemModel> listrectangle4224ItemList =
      RxList.filled(3, Listrectangle4224ItemModel());
}

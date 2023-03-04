class TransactionModel {
  String _id;
  String _refFrom;
  String _fromUsername;
  String _refTo;
  String _toUsername;
  DateTime _createAt;
  int _amount;

  TransactionModel(this._id, this._refFrom, this._fromUsername, this._refTo,
      this._toUsername, this._createAt, this._amount);

  int get amount => _amount;

  set amount(int value) {
    _amount = value;
  }

  DateTime get createAt => _createAt;

  set createAt(DateTime value) {
    _createAt = value;
  }

  String get toUsername => _toUsername;

  set toUsername(String value) {
    _toUsername = value;
  }

  String get refTo => _refTo;

  set refTo(String value) {
    _refTo = value;
  }

  String get fromUsername => _fromUsername;

  set fromUsername(String value) {
    _fromUsername = value;
  }

  String get refFrom => _refFrom;

  set refFrom(String value) {
    _refFrom = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        json["id"],
        json["_refFrom"],
        json["_fromUsername"],
        json["_refTo"],
        json["_toUsername"],
        json["_createAt"],
        json["_amount"],
      );

  static List<TransactionModel> listNameFromJson(list) =>
      List<TransactionModel>.from(
          list.map((x) => TransactionModel.fromJson(x)));
}

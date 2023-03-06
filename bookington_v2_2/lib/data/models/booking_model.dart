class BookingModel {
  String _id;
  String _refSlot;
  String _refOrder;
  String _bookBy;
  String _bookAt;
  String _playDate;
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

  String get bookAt => _bookAt;

  set bookAt(String value) {
    _bookAt = value;
  }

  String get playDate => _playDate;

  set playDate(String value) {
    _playDate = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        json["id"],
        json["refSlot"],
        json["refOrder"],
        json["bookBy"],
        json["bookAt"],
        json["playDate"],
        json["price"]*1.0,
      );

  static List<BookingModel> listFromJson(list) =>
      List<BookingModel>.from(list.map((x) => BookingModel.fromJson(x)));
}

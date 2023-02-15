class SlotModel {
  String _id;
  String _refSubCourt;

  DateTime _startTime;
  DateTime _endTime;

  double _price;
  bool _isActive;

  SlotModel(this._id, this._refSubCourt, this._startTime, this._endTime,
      this._price, this._isActive);

  bool get isActive => _isActive;

  set isActive(bool value) {
    _isActive = value;
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

  String get refSubCourt => _refSubCourt;

  set refSubCourt(String value) {
    _refSubCourt = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}

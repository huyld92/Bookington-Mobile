
class VoucherModel {
  String _id;
  String _create_by;
  String _ref_court;
  String _voucher_code;
  String _title;
  String _description;
  double _discount;
  int _usages;
  int _max_quantity;
  DateTime _start_date;
  DateTime _end_date ;
  DateTime _create_at;
  bool _is_active;

  VoucherModel(
      this._id,
      this._create_by,
      this._ref_court,
      this._voucher_code,
      this._title,
      this._description,
      this._discount,
      this._usages,
      this._max_quantity,
      this._start_date,
      this._end_date,
      this._create_at,
      this._is_active);

  bool get
  is_active => _is_active;

  set is_active(bool value) {
    _is_active = value;
  }

  DateTime get create_at => _create_at;

  set create_at(DateTime value) {
    _create_at = value;
  }

  DateTime get end_date => _end_date;

  set end_date(DateTime value) {
    _end_date = value;
  }

  DateTime get start_date => _start_date;

  set start_date(DateTime value) {
    _start_date = value;
  }

  int get max_quantity => _max_quantity;

  set max_quantity(int value) {
    _max_quantity = value;
  }

  int get usages => _usages;

  set usages(int value) {
    _usages = value;
  }

  double get discount => _discount;

  set discount(double value) {
    _discount = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get voucher_code => _voucher_code;

  set voucher_code(String value) {
    _voucher_code = value;
  }

  String get ref_court => _ref_court;

  set ref_court(String value) {
    _ref_court = value;
  }

  String get create_by => _create_by;

  set create_by(String value) {
    _create_by = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }


}
class TransactionModelScreen {
  String _name;
  String _amount;
  String _date;
  String _type;

  TransactionModelScreen(this._name, this._amount, this._date, this._type);

  String get type => _type;

  set type(String value) {
    _type = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get amount => _amount;

  set amount(String value) {
    _amount = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}
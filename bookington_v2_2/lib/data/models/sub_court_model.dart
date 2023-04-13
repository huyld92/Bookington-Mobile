// ignore_for_file: unnecessary_getters_setters

class SubCourtModel {
  String _id;
  String _parentCourtId;
  String _courtTypeId;
  DateTime _createAt;
  bool _isActive;
  bool _isDeleted;

  SubCourtModel(this._id, this._parentCourtId, this._courtTypeId,
      this._createAt, this._isActive, this._isDeleted);

  bool get isDeleted => _isDeleted;

  set isDeleted(bool value) {
    _isDeleted = value;
  }

  DateTime get createAt => _createAt;

  set createAt(DateTime value) {
    _createAt = value;
  }

  String get courtTypeId => _courtTypeId;

  set courtTypeId(String value) {
    _courtTypeId = value;
  }

  String get parentCourtId => _parentCourtId;

  set parentCourtId(String value) {
    _parentCourtId = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  bool get isActive => _isActive;

  set isActive(bool value) {
    _isActive = value;
  }
}

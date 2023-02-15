

class SubCourtModel{
  String _id;
  String _parent_court_id;
  String _court_type_id;
  DateTime _create_at;
  bool _is_active;
  bool _is_deleted;

  SubCourtModel(this._id, this._parent_court_id, this._court_type_id,
      this._create_at, this._is_active, this._is_deleted);

  bool get is_deleted => _is_deleted;

  set is_deleted(bool value) {
    _is_deleted = value;
  }

  DateTime get create_at => _create_at;

  set create_at(DateTime value) {
    _create_at = value;
  }

  String get court_type_id => _court_type_id;

  set court_type_id(String value) {
    _court_type_id = value;
  }

  String get parent_court_id => _parent_court_id;

  set parent_court_id(String value) {
    _parent_court_id = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  bool get is_active => _is_active;

  set is_active(bool value) {
    _is_active = value;
  }
}
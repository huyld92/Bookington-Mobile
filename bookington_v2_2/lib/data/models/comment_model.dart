





// ignore_for_file: unnecessary_getters_setters

class CommentModel{
  String _id ;
  String _commentWriterId ;
  String _refCourt;
  String _content;
  double _rating;
  DateTime _createAt;
  bool _isActive;


  CommentModel(this._id, this._commentWriterId, this._refCourt, this._content,
      this._rating, this._createAt, this._isActive);

  bool get isActive => _isActive;

  set isActive(bool value) {
    _isActive = value;
  }

  DateTime get createAt => _createAt;

  set createAt(DateTime value) {
    _createAt = value;
  }

  double get rating => _rating;

  set rating(double value) {
    _rating = value;
  }

  String get content => _content;

  set content(String value) {
    _content = value;
  }

  String get refCourt => _refCourt;

  set refCourt(String value) {
    _refCourt = value;
  }

  String get commentWriterId => _commentWriterId;

  set commentWriterId(String value) {
    _commentWriterId = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}
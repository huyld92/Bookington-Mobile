class ProfileModel {
  String _fullName;
  String _phomeNumber;

  ProfileModel(this._fullName, this._phomeNumber);

  String get phomeNumber => _phomeNumber;

  set phomeNumber(String value) {
    _phomeNumber = value;
  }

  String get fullName => _fullName;

  set fullName(String value) {
    _fullName = value;
  }
}

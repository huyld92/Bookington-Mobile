import 'dart:convert';

LoginModel loginRespFromJson(Map<String, dynamic> json) =>
    LoginModel.fromJson(json);

String loginRespToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String _userID;
  String _phoneNumber;
  String _fullName;
  String _role;
  String _sysToken;
  int _sysTokenExpires;

  LoginModel(this._userID, this._phoneNumber, this._fullName, this._role,
      this._sysToken, this._sysTokenExpires);


  int get sysTokenExpires => _sysTokenExpires;

  set sysTokenExpires(int value) {
    _sysTokenExpires = value;
  }

  String get sysToken => _sysToken;

  set sysToken(String value) {
    _sysToken = value;
  }

  String get role => _role;

  set role(String value) {
    _role = value;
  }

  String get fullName => _fullName;

  set fullName(String value) {
    _fullName = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get userID => _userID;

  set userID(String value) {
    _userID = value;
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(
        json["userID"],
        json["phoneNumber"],
        json["fullName"],
        json["role"],
        json["sysToken"],
        json["sysTokenExpires"],
      );

  Map<String, dynamic> toJson() =>
      {
        "userID": _userID,
        "phoneNumber": _phoneNumber,
        "fullName": _fullName,
        "role": _role,
        "sysToken": _sysToken,
        "sysTokenExpires": _sysTokenExpires,
      };

}

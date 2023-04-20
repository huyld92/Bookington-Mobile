import 'package:bookington_v2_2/data/models/account_model.dart';

class ProfileModel {
  late AccountModel _accountModel;
  late String _balance;

  ProfileModel();

  ProfileModel.empty(){
    _accountModel = AccountModel.empty();
    _balance = "";
  }

  String get balance => _balance;

  set balance(String value) {
    _balance = value;
  }

  AccountModel get accountModel => _accountModel;

  set accountModel(AccountModel value) {
    _accountModel = value;
  }
}

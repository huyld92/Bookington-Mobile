// ignore_for_file: unnecessary_getters_setters

import 'package:bookington_v2_2/data/models/account_model.dart';

class EditProfileModel {
  AccountModel _accountModel;

  EditProfileModel(this._accountModel);

  AccountModel get accountModel => _accountModel;

  set accountModel(AccountModel value) {
    _accountModel = value;
  }
}

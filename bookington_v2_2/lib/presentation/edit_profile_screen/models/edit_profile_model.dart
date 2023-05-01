// ignore_for_file: unnecessary_getters_setters

import 'package:bookington_v2_2/data/models/account_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class EditProfileModel {
  late AccountModel _accountModel;

  EditProfileModel({required accountModel});
  EditProfileModel.empty(){
    _accountModel = AccountModel.empty();
  }

  AccountModel get accountModel => _accountModel;

  set accountModel(AccountModel value) {
    _accountModel = value;
  }


}

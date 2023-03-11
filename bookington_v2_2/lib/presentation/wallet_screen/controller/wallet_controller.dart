

import 'dart:convert';

import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/transaction_model.dart';
import 'package:bookington_v2_2/presentation/profile_screen/controller/profile_controller.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  RxList<TransactionModel> listTransactionObj = <TransactionModel>[].obs;


  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() {
    ApiClient.getTransactionHistory().then((result) {
      print('statusCode: ${result.statusCode}');
      if (result.statusCode == 200) {
        List<TransactionModel> listTransaction =
        TransactionModel.listNameFromJson(
            jsonDecode(result.body)["result"]);
        listTransactionObj.value = listTransaction;

        listTransactionObj.refresh();
      } else if(result.statusCode == 401 || result.statusCode == 403){
        ProfileController profileController = Get.find();
        profileController.logout();
      }else {
        print('errror');
      }
    });
  }

  void getBack() {
    Get.back();
  }
}
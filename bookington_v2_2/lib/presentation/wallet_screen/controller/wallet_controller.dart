

import 'dart:convert';

import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/transaction_model.dart';
import 'package:bookington_v2_2/presentation/profile_screen/controller/profile_controller.dart';
import 'package:bookington_v2_2/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WalletController extends GetxController with StateMixin{
  RxList<TransactionModel> listTransactionObj = <TransactionModel>[].obs;
RxString balance = "".obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() {
    change(null, status: RxStatus.loading());
    print('here');
    getBalance();
    getListTransaction();
    Future.delayed(const Duration(milliseconds: 500), () {
      change(null, status: RxStatus.success());
    });
  }

  Future<void> getBalance() async {
    try {
      ApiClient.getBalance().then((result) {
        print('statusCode: ${result.statusCode}');
        if (result.statusCode == 200) {
          var jsonResult = jsonDecode(result.body);
          final formatCurrency = NumberFormat("#,###");
          balance.value = formatCurrency.format(jsonResult["result"]["balance"]);
        } else {
          print(result.headers);
        }
      },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  void getListTransaction(){
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
        Map<String, bool> arg = {"timeOut": true};

        profileController.logout(arg);
      }else {
        print('errror');
      }
    },);
  }

  void getBack() {
    Get.back();
  }

  void transationScreen() {
    Get.toNamed(AppRoutes.transactionScreen);
  }
}
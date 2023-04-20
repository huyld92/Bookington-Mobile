import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/transaction_model.dart';
import 'package:bookington_v2_2/presentation/profile_screen/controller/profile_controller.dart';
import 'package:intl/intl.dart';

class WalletController extends GetxController with StateMixin {
  RxList<TransactionModel> listTransactionObj = <TransactionModel>[].obs;
  RxString balance = "".obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    change(null, status: RxStatus.loading());
    await getBalance();
    await getListTransaction();
    change(null, status: RxStatus.success());
  }

  Future<void> getBalance() async {
    try {
      await ApiClient.getBalance().then(
        (result) {
          if (result.statusCode == 200) {
            var jsonResult = jsonDecode(result.body);
            final formatCurrency = NumberFormat("#,###");
            balance.value =
                formatCurrency.format(jsonResult["result"]["balance"]);
          } else if (result.statusCode == 401 || result.statusCode == 403) {
            logout();
          } else {
            Logger.log(
                "WalletController error at getBalance: ${result.statusCode}");
          }
        },
      );
    } catch (e) {
      Logger.log("WalletController error at getBalance: ${e.toString()}");
    }
  }

  Future<void> getListTransaction() async {
    try {
      int pageNumber = 1;
      int maxPageSize = 5;
      await ApiClient.getTransactionHistory(pageNumber, maxPageSize).then(
        (result) {
          if (result.statusCode == 200) {
            List<TransactionModel> listTransaction =
                TransactionModel.listFromJson(
                    jsonDecode(result.body)["result"]);
            listTransactionObj.value = listTransaction;
            listTransactionObj.refresh();
          } else if (result.statusCode == 401 || result.statusCode == 403) {
            logout();
          } else {
            Logger.log(
                "WalletController error at getListTransaction: ${result.statusCode}");
          }
        },
      );
    } on Exception catch (e) {
      Logger.log(
          "WalletController error at getListTransaction: ${e.toString()}");
    }
  }

  void logout() async {
    PrefUtils.clearPreferencesData();
    Map<String, bool> arg = {"timeOut": true};
    Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
  }

  void getBack() {
    Get.back();
  }

  void transactionScreen() {
    Get.toNamed(AppRoutes.transactionScreen);
  }
}

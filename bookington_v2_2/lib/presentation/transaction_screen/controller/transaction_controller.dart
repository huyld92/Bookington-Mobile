import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/transaction_model.dart';
import 'package:bookington_v2_2/presentation/profile_screen/controller/profile_controller.dart';

class TransactionController extends GetxController
    with StateMixin, ScrollMixin {
  RxList<TransactionModel> listTransactionObj = <TransactionModel>[].obs;
  int pageNumber = 1;
  int totalCount = 0;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  getBack() {
    Get.back();
  }

  void loadData() {
    getTransactionHistory();
  }

  Future<void> getTransactionHistory() async {
    try {
      if (pageNumber == 1) {
        change(null, status: RxStatus.loading());
      }
      int maxPageSize = 10;
      await ApiClient.getTransactionHistory(pageNumber, maxPageSize)
          .then((result) {
        if (result.statusCode == 200) {
          var jsonResult = jsonDecode(result.body);
          // totalCount = jsonResult["pagination"]["totalCount"];
          totalCount = 30;
          if (totalCount == 0) {
            listTransactionObj.clear();
          } else {
            if (pageNumber == 1) {
              listTransactionObj.value = TransactionModel.listFromJson(
                  jsonDecode(result.body)["result"]);
            } else {
              listTransactionObj
                  .addAll(TransactionModel.listFromJson(jsonResult["result"]));
            }
          }
          listTransactionObj.refresh();
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Logger.log(
              "TransactionController error at getTransactionHistory: ${result.statusCode}");
        }
      });
    } on Exception catch (e) {
      Logger.log(
          "TransactionController error at getListTransaction: ${e.toString()}");
    } finally {
      if (listTransactionObj.isNotEmpty) {
        change(null, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    }
  }

  void logout() async {
    PrefUtils.clearPreferencesData();
    Map<String, bool> arg = {"timeOut": true};
    Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
  }

  @override
  Future<void> onEndScroll() async {
      if (listTransactionObj.length < totalCount) {
      pageNumber++;
      await getTransactionHistory();
    }
  }

  @override
  Future<void> onTopScroll() async {}

  checkAddBalance(String refTo) {
    String userID = PrefUtils.getString("userID") ?? "";
    if (userID == refTo) {
      return true;
    }
    return false;
  }
}

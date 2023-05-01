import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/transaction_model.dart';
import 'package:bookington_v2_2/presentation/profile_screen/controller/profile_controller.dart';
import 'package:bookington_v2_2/presentation/wallet_screen/models/top_up_model.dart';
import 'package:bookington_v2_2/presentation/wallet_screen/widgets/top_up_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class WalletController extends GetxController with StateMixin {
  TextEditingController amountController = TextEditingController();
  var isTextFieldEmpty = false.obs;

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

  void addBalance() {
    Get.bottomSheet(TopUpWidget(), isDismissible: false).then((value) {
      // rating.value = 0.0;
    });
  }

  Future<void> topUpAmount() async {
    change(null, status: RxStatus.loading());
    print('topup');
    try {
      String amount = amountController.text;
      String orderInfo = "Test123125";
      await ApiClient.topUpAmount(amount, orderInfo).then(
        (result) async {
          if (result.statusCode == 200) {
            TopUpModel topUpModel =
                TopUpModel.fromJson(jsonDecode(result.body)["result"]);
            if (topUpModel.deeplink.isNotEmpty) {
              var url = Uri.parse(topUpModel.deeplink);

              if (await canLaunchUrl(url)) {
                print('can launch');
                // Launch the url which will open Spotify
                launchUrl(url);
              } else {
                Get.snackbar(
                  'Top up',
                  "Top up failed",
                  colorText: ColorConstant.black900,
                  duration: const Duration(seconds: 1),
                  backgroundColor: ColorConstant.whiteA700,
                  icon: CustomImageView(
                      width: 16, height: 16, svgPath: ImageConstant.imgNotify),
                );
              }
            }
          } else if (result.statusCode == 401 || result.statusCode == 403) {
            logout();
          } else {
            Logger.log(
                "WalletController error at topUpAmount: ${result.statusCode}");
          }
        },
      );
    } on Exception catch (e) {
      Logger.log("WalletController error at topUpAmount: ${e.toString()}");
    } finally {
      change(null, status: RxStatus.success());
    }
  }
}

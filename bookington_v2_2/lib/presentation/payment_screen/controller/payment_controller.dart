// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/slot_model.dart';
import 'package:bookington_v2_2/data/models/voucher_model.dart';
import 'package:bookington_v2_2/presentation/payment_screen/models/payment_model.dart';
import 'package:bookington_v2_2/presentation/payment_screen/widgets/payment_successful_dialog.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentController extends GetxController with StateMixin {
  Rx<PaymentModel> paymentModelObj = PaymentModel.empty().obs;

  RxString selectedPayment = "Cash".obs;
  Rx<VoucherModel> voucher = VoucherModel.empty().obs;
  RxString balance = "".obs;
  RxDouble totalAmount = 0.0.obs;
  RxDouble total = 0.0.obs;
  RxBool isSuccess = false.obs;
  String courtId = "";

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    Map<String, dynamic> arg = Get.arguments;
    if (arg["paymentModel"] != null) {
      courtId = arg["courtId"];
      paymentModelObj.value = arg["paymentModel"];
      await calculateAmount();
    }
    await getBalance();
  }

  getBack() {
    Get.back();
  }

  void changePaymentMethod(value) {
    selectedPayment.value = value;
  }

  void getBackHome() {
    Get.offAllNamed(AppRoutes.homeScreen);
  }

  Future<void> chooseVoucher() async {
    Map<String, String> arg = {
      "voucherId": voucher.value.id,
      "courtId": courtId,
    };
    await Get.toNamed(AppRoutes.chooseVoucherScreen, arguments: arg)
        ?.then((result) {
      voucher.value = result["voucher"];
    });
    if (voucher.value.id.isNotEmpty) {
      total.value = totalAmount.value -
          totalAmount.value * (voucher.value.discount / 100);
    }
  }

  void choosePayment(String s) {
    selectedPayment.value = s;
  }

  Future<void> getBalance() async {
    change(null, status: RxStatus.loading());

    try {
      await ApiClient.getBalance().then(
        (result) {
          print('statusCode: ${result.statusCode}');
          if (result.statusCode == 200) {
            var jsonResult = jsonDecode(result.body);
            final formatCurrency = NumberFormat("#,###");
            balance.value =
                formatCurrency.format(jsonResult["result"]["balance"]);
          } else {
            Logger.log(
                "PaymentController error at getBalance: ${result.statusCode}");
          }
        },
      );
    } catch (e) {
      Logger.log("PaymentController error at getBalance: ${e.toString()}");
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  calculateAmount() {
    for (SlotModel p in paymentModelObj.value.listSlotBooking) {
      totalAmount.value += p.price;
    }
    total.value = totalAmount.value -
        totalAmount.value * (voucher.value.discount / 100) * 100;
  }

  Future<void> checkout() async {
    change(null, status: RxStatus.loading());
    try {
      String orderId = paymentModelObj.value.listBooking[0].refOrder;
      print('voucher.value.id: ${voucher.value.id}');
      print('orderId: ${orderId}');
      await ApiClient.checkout(voucher.value.voucherCode, orderId).then(
        (result) {
           if (result.statusCode == 200) {
            var jsonResult = jsonDecode(result.body);
            print('paymentResult: ${jsonResult.toString()}');
            isSuccess.value = true;
            Get.defaultDialog(
              barrierDismissible: false,
              title: "",
              content: PaymentSuccessfulDialog(this),
            );
          } else if (result.statusCode == 400) {
            Get.defaultDialog(
                barrierDismissible: false,
                title: "Your Payment failed!",
                content: Container(
                  padding: getPadding(all: 20),
                  height: getVerticalSize(150),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Text("This order has already been processed!",
                            style: AppStyle.txtManropeMedium14),
                      ),
                      Padding(
                        padding: getPadding(top: 15),
                        child: CustomButton(
                          height: 50,
                          width: 220,
                          text: "lbl_back_home".tr,
                          margin: getMargin(
                            top: 10,
                          ),
                          fontStyle: ButtonFontStyle.ManropeBold14,
                          variant: ButtonVariant.FillGray300,
                          onTap: () {
                            getBackHome();
                          },
                        ),
                      ),
                    ],
                  ),
                ));
          } else if (result.statusCode == 401 || result.statusCode == 403) {
            logout();
          } else {
            Logger.log(
                "PaymentController error at confirmPayment: ${result.statusCode}");
          }
        },
      );
    } on Exception catch (e) {
      Logger.log("PaymentController error at confirmPayment: ${e.toString()}");
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  void logout() {
    PrefUtils.clearPreferencesData();
    Map<String, bool> arg = {"timeOut": true};
    Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
  }

  void viewBooking() {
    Get.offAllNamed(AppRoutes.historyBookingScreen);
  }
}

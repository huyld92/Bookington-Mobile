import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/booking_model.dart';
import 'package:bookington_v2_2/data/models/slot_model.dart';
import 'package:bookington_v2_2/presentation/payment_screen/models/payment_model.dart';
import 'package:bookington_v2_2/presentation/payment_screen/widgets/payment_successful_dialog.dart';
import 'package:intl/intl.dart';

class PaymentController extends GetxController {
  Rx<PaymentModel> paymentModelObj = PaymentModel.empty().obs;

  RxString selectedPayment = "Cash".obs;
  RxString voucherID = ''.obs;
  RxString balance = "".obs;
  RxDouble totalAmount = 0.0.obs;
  RxString resultMessage = "".obs;

  @override
  void onReady() {
    loadData();
    super.onReady();
  }

  getBack() {
    Get.back();
  }

  void changePaymentMethod(value) {
    selectedPayment.value = value;
  }

  void getBackHome() {
    // Get.back();
    Get.offNamed(AppRoutes.homeScreen);
  }

  void chooseVoucher() {
    Map<String, String> voucher = {'id': ''};
    Get.toNamed(AppRoutes.chooseVoucherScreen, arguments: voucher)
        ?.then((result) {
      voucherID.value = result["id"] ?? "";
    });
  }

  void choosePayment(String s) {
    selectedPayment.value = s;
  }

  Future<void> getBalance() async {
    try {
      ApiClient.getBalance().then(
        (result) {
          print('statusCode: ${result.statusCode}');
          if (result.statusCode == 200) {
            var jsonResult = jsonDecode(result.body);
            final formatCurrency = NumberFormat("#,###");
            balance.value =
                formatCurrency.format(jsonResult["result"]["balance"]);
           } else {
            print(result.headers);
          }
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  calculateAmount() {
    for(SlotModel p in paymentModelObj.value.listSlotBooking){
      totalAmount.value += p.price;
    }
  }

  void loadData() {
    getBalance();
    Map<String, dynamic> arg = Get.arguments;
    if (arg["paymentModel"] != null) {
      paymentModelObj.value = arg["paymentModel"];
      calculateAmount();
    }
  }

  void confirmPayment() {

    String orderId = paymentModelObj.value.orderId;
    ApiClient.checkout("voucherCode", orderId).then(
          (result) {
        print('confirmPayment statusCode: ${result.statusCode}');
        if (result.statusCode == 200) {
          var jsonResult = jsonDecode(result.body);
          resultMessage.value = jsonResult["result"];
          Get.defaultDialog(
            barrierDismissible: false,
            title: "",
            content: PaymentSuccessfulDialog(this),
          );
        } else {
          print(result.headers);
        }
      },
    );

  }

  void viewBooking() {
    Get.offAllNamed(AppRoutes.historyBookingScreen);
  }
}

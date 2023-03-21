import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
 import 'package:bookington_v2_2/presentation/payment_screen/models/payment_model.dart';
import 'package:intl/intl.dart';

class PaymentController extends GetxController {
  Rx<PaymentModel> paymentModelObj = PaymentModel().obs;

  RxString selectedPayment = "Cash".obs;
  RxString voucherID = ''.obs;
  RxString balance = "".obs;

  @override
  void onReady() {
    loadData();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getBack() {
    Get.back();
  }

  void changePaymentMethod(value) {
    selectedPayment.value = value;
  }

  void getBackHome() {
    Get.offNamed(AppRoutes.homeScreen);
  }

  void chooseVoucher() {
    Map<String, String> voucher = {'id': '3'};
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
            print('balance:$balance');
          } else {
            print(result.headers);
          }
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  void loadData() {
    getBalance();
    // Map<String, dynamic> arg = Get.arguments;
    // if (arg["listBooking"]!=null) {
    //   List<BookingModel>? listBooking = arg["listBooking"];
    //   paymentModelObj.value.listBooking?.value = listBooking!;
    //  }
  }
}

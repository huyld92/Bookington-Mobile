

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/payment_screen/models/payment_model.dart';

class PaymentController extends GetxController {
  Rx<PaymentModel> paymentModelObj = PaymentModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getBack(){
    print("payment back");
    // Get.back();
  }
}

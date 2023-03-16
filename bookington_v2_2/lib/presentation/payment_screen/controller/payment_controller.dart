import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/booking_model.dart';
import 'package:bookington_v2_2/presentation/payment_screen/models/payment_model.dart';

class PaymentController extends GetxController {
  Rx<PaymentModel> paymentModelObj = PaymentModel().obs;

  RxString selectedPayment = "Momo".obs;
  RxString voucherID = ''.obs;

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

  void loadData() {
    // Map<String, dynamic> arg = Get.arguments;
    // if (arg["listBooking"]!=null) {
    //   List<BookingModel>? listBooking = arg["listBooking"];
    //   paymentModelObj.value.listBooking?.value = listBooking!;
    //  }
  }
}

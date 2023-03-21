 import 'package:bookington_v2_2/presentation/phone_send_otp_screen/controller/phone_send_otp_controller.dart';
import 'package:get/get.dart';

class PhoneSendOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhoneSendOtpController(), fenix: true);
  }
}

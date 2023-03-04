

import 'package:bookington_v2_2/presentation/choose_voucher_screen/controller/voucher_controller.dart';
import 'package:get/get.dart';

class VoucherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VoucherController());
  }

}
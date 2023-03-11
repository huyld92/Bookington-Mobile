import 'package:bookington_v2_2/presentation/wallet_screen/controller/wallet_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class WalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalletController(), fenix: true);
  }
}

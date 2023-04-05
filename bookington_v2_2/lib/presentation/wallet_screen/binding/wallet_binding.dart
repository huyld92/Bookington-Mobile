import 'package:bookington_v2_2/presentation/transaction_screen/controller/transaction_controller.dart';
import 'package:bookington_v2_2/presentation/wallet_screen/controller/wallet_controller.dart';
import 'package:get/get.dart';

class WalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalletController(), fenix: true);
    Get.lazyPut(() => TransactionController(), fenix: true);
  }
}

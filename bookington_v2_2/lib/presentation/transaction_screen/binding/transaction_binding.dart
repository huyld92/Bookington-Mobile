

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/transaction_screen/controller/transaction_controller.dart';

class TransactionBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TransactionController());
  }

}
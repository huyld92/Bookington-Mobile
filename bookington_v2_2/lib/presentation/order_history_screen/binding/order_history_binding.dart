import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/order_history_screen/controller/order_history_controller.dart';

class OrderHistoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OrderHistoryController(), fenix: true);
  }

}
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/order_details_screen/controller/order_details_controller.dart';

class OrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderDetailsController(), fenix: true);
  }
}

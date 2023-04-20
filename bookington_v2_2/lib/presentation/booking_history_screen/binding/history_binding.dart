
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/booking_history_screen/controller/booking_history_controller.dart';


class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryController());
  }
}
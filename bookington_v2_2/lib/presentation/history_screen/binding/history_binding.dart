
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/history_screen/controller/history_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryController());
  }
}


import 'package:bookington_v2_2/presentation/report_screen/controller/report_controller.dart';
import 'package:get/get.dart';

class ReportBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ReportController(),fenix: true);
  }

}
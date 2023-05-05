import 'package:bookington_v2_2/core/utils/notify.dart';
import 'package:bookington_v2_2/core/utils/signalr_connection.dart';
import 'package:bookington_v2_2/main.dart';

import '../controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}

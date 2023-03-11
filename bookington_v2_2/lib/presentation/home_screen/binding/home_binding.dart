import 'package:bookington_v2_2/presentation/profile_screen/controller/profile_controller.dart';

import '../controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(),fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}

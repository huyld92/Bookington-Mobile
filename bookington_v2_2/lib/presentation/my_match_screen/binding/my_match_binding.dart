import 'package:bookington_v2_2/presentation/my_match_screen/controller/my_match_controller.dart';
import 'package:get/get.dart';

class MyMatchBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => MyMatchController(), fenix: true);
  }
}

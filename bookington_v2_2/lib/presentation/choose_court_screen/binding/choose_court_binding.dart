
import 'package:bookington_v2_2/presentation/choose_court_screen/controller/choose_court_controller.dart';
import 'package:get/get.dart';

class ChooseCourtBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseCourtController(),fenix: true);
  }
}


import 'package:bookington_v2_2/presentation/choose_slot_screen/controller/choose_slot_controller.dart';
import 'package:get/get.dart';

class ChooseSlotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseSlotController(),fenix: true);
  }
}

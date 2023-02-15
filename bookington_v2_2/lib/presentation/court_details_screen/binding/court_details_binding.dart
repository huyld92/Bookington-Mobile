import '../controller/court_details_controller.dart';
import 'package:get/get.dart';

class CourtDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CourtDetailsController(),fenix: true);
  }
}

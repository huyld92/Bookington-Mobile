import '../controller/registration_phone_controller.dart';
import 'package:get/get.dart';

class RegistrationPhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationPhoneController(),fenix: true);
  }
}

import 'package:bookington_v2_2/presentation/create_new_password_screen/controller/create_new_password_controller.dart';
import 'package:get/get.dart';

class CreateNewPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateNewPasswordController(), fenix: true);
  }
}

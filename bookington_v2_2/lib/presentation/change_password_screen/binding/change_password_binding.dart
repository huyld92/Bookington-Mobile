

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/change_password_screen/controller/change_password_controller.dart';

class ChangePasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController(), fenix: true);
  }

}
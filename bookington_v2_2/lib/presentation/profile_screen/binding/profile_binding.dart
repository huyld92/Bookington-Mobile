import 'package:bookington_v2_2/presentation/profile_screen/controller/profile_controller.dart';

import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(), fenix: true);
   }
}

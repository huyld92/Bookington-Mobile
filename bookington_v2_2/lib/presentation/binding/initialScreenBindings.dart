import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/home_screen/controller/home_controller.dart';
import 'package:bookington_v2_2/presentation/profile_screen/controller/profile_controller.dart';
import 'package:bookington_v2_2/presentation/search_page/controller/search_controller.dart';

class InitialScreenBindings implements Bindings {
  // String tag;
  //
  // InitialScreenBindings({required this.tag});

  @override
  void dependencies() {
    Get.lazyPut(() => SearchController(),fenix: true );
    Get.lazyPut(() => HomeController(),fenix: true );
    Get.lazyPut(() => ProfileController(),fenix: true );
  }
}

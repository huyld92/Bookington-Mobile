


import 'package:bookington_v2_2/presentation/%20favourite_court_screen/controller/%20favourite_court_controller.dart';
import 'package:get/get.dart';

class FavouriteCourtBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FavouriteCourtController(),fenix: true);
  }

}
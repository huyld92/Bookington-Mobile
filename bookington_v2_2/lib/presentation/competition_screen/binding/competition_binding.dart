

import 'package:bookington_v2_2/presentation/competition_screen/controller/competition_controller.dart';
import 'package:get/get.dart';

class CompetitionBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CompetitionController(), fenix: true);
  }
}
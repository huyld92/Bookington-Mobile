

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/forum_screen/controller/forum_controller.dart';

class ForumBinding extends Bindings{
  @override
  void dependencies() {
Get.lazyPut(() => ForumController(),fenix: true);
  }

}
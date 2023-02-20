

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/messages_screen.dart/controller/messages_controller.dart';

class MessagesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MessagesController());
  }

}
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/messages_container_screen/controller/messages_container_controller.dart';

class MessagesContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessagesContainerController());
  }
}

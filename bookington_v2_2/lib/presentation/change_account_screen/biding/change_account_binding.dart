

import 'package:get/get.dart';

import '../controller/change_account_controller.dart';

class ChangeAccountBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ChangeAccountController(),fenix: true);
  }

}
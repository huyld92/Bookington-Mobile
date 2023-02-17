
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/messages_container_screen/controller/messages_container_controller.dart';
import 'package:bookington_v2_2/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class MessagesContainerScreen extends GetWidget<MessagesContainerController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: AppRoutes.messagesScreen,
                onGenerateRoute: (routeSetting) => GetPageRoute(
                    page: () => getCurrentPage(routeSetting.name!),
                    transition: Transition.noTransition)),
            bottomNavigationBar:
            CustomBottomBar(onChanged: (BottomBarEnum type) {})));
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.messagesScreen:
        return MessagesContainerScreen();
      default:
        return MessagesContainerScreen();
    }
  }
}

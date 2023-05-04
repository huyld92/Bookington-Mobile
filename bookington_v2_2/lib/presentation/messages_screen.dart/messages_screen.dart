import 'package:bookington_v2_2/presentation/messages_screen.dart/widgets/messages_item_widget.dart';
import 'package:bookington_v2_2/widgets/coming_soon_widget.dart';
import 'package:bookington_v2_2/widgets/custom_bottom_bar.dart';

import 'controller/messages_controller.dart';
import 'models/messages_item_model.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';

// ignore_for_file: must_be_immutable
class MessagesScreen extends GetWidget<MessagesController> {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CustomBottomBar.selectedIndex = 1.obs;

    return SafeArea(
        child: GestureDetector(
      onTap: () {
        print('focus');
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: const ComingSoonWidget(),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            Get.toNamed(getCurrentRoute(type));
          },
        ),
      ),
    ));
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreen;
      case BottomBarEnum.Message:
        return AppRoutes.messageChatScreen;
      case BottomBarEnum.Search:
        return AppRoutes.searchScreen;
      case BottomBarEnum.Forum:
        return AppRoutes.forumScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.profileScreen;
      default:
        return "/";
    }
  }
}

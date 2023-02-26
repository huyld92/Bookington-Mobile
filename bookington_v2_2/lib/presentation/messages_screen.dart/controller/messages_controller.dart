import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/messages_screen.dart/models/messages_model.dart';
import 'package:flutter/material.dart';

class MessagesController extends GetxController {

  TextEditingController searchController = TextEditingController();

  Rx<MessagesModel> messagesModelObj = MessagesModel().obs;


  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  void getChatScreen() {
    Get.toNamed(AppRoutes.messageChatScreen);
    print("Message chat screen");
  }
}

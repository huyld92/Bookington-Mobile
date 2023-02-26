import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/message_chat_screen/models/message_chat_model.dart';
import 'package:flutter/material.dart';

class MessageChatController extends GetxController {
  Rx<MessageChatModel> messageChatModelObj = MessageChatModel().obs;
  TextEditingController messagesController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getBack() {
    print("chat get back");
    Get.back();
  }
}

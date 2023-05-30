// ignore_for_file: avoid_print

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/message_chat_screen/models/message_chat_model.dart';
import 'package:flutter/material.dart';

class MessageChatController extends GetxController {
  Rx<MessageChatModel> messageChatModelObj = MessageChatModel("aaa", false).obs;
  TextEditingController messagesController = TextEditingController();
  final messages = <MessageChatModel>[].obs;

  @override
  onInit() {

    messages.add(MessageChatModel("text", true));
    messages.add(MessageChatModel("text2", false));
    messages.add(MessageChatModel("text3", true));
    messages.add(MessageChatModel("text4", true));
    messages.add(MessageChatModel("text5", false));
    messages.add(MessageChatModel("text6", false));
    messages.add(MessageChatModel("text7", true));
    super.onInit();

  }

  getBack() {
    print("chat get back");
    Get.back();
  }

  void sendMessage(String text) {}
}

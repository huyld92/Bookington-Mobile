import 'package:get/get.dart';
import 'messages_item_model.dart';

class MessagesModel {
  RxList<MessagesItemModel> messagesItemList =
      RxList.generate(5, (index) => MessagesItemModel());
}

 import 'package:bookington_v2_2/data/models/notification_model.dart';
import 'package:get/get.dart';
import 'home_item_model.dart';

class HomeModel {
  late String fullName;
  late List<NotificationModel> listNotification;


  RxList<HomeItemModel> homeItemList = RxList.filled(3, HomeItemModel());

}

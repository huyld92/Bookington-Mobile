 import 'package:bookington_v2_2/data/models/account_model.dart';
import 'package:bookington_v2_2/data/models/notification_model.dart';
import 'package:get/get.dart';
import 'home_item_model.dart';

class HomeModel {
  late AccountModel accountModel;
  late List<NotificationModel> listNotification;


  HomeModel.empty(){
    accountModel = AccountModel.empty();
    listNotification = List.filled(1, NotificationModel.empty());
   }

  RxList<HomeItemModel> homeItemList = RxList.filled(3, HomeItemModel());

}

 import 'package:bookington_v2_2/data/models/account_model.dart';
import 'package:bookington_v2_2/data/models/notification_model.dart';
import 'package:get/get.dart';
import 'home_court_item_model.dart';

class HomeModel {
  late AccountModel accountModel;
  late List<NotificationModel> listNotification;
  late List<HomeCourtItemModel> homeCourtItemList;


  HomeModel.empty(){
    accountModel = AccountModel.empty();
    listNotification = List.filled(1, NotificationModel.empty());
    homeCourtItemList = List.empty();
   }


}

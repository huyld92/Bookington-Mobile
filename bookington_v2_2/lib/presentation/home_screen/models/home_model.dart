 import 'package:get/get.dart';
import 'home_item_model.dart';

class HomeModel {
  String fullName;


  HomeModel(this.fullName);

  RxList<HomeItemModel> homeItemList = RxList.filled(3, HomeItemModel());

}

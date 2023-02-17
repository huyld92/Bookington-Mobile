import 'package:get/get.dart';
import 'slidericon_item_model.dart';
import 'listfive_item_model.dart';
import 'listdate_item_model.dart';
import 'listrectangle4224_item_model.dart';

class CourtDetailsModel {
  RxList<SlidericonItemModel> slidericonItemList =
      RxList.filled(2, SlidericonItemModel());

  RxList<ListfiveItemModel> listfiveItemList =
      RxList.filled(5, ListfiveItemModel());

  RxList<ListdateItemModel> listdateItemList =
      RxList.filled(5, ListdateItemModel());

  RxList<Listrectangle4224ItemModel> listrectangle4224ItemList =
      RxList.filled(3, Listrectangle4224ItemModel());
}

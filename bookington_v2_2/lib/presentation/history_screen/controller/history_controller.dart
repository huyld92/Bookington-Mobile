import 'package:bookington_v2_2/core/app_export.dart';
  import 'package:flutter/material.dart';

class HistoryController extends GetxController with GetSingleTickerProviderStateMixin,ScrollMixin {

  final List<Tab> historyTabs = <Tab>[
    const Tab(text: 'UpComing'),
    const Tab(text: 'Completed'),
    const Tab(text: 'Canceled'),
  ];

  late TabController tabController;

  RxList listBooking = RxList.filled(10,"aaa");

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: historyTabs.length);
    print(tabController.toString());
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void filter() {

  }

  @override
  Future<void> onEndScroll() async {
   // if(tabcontroller.)
  }

  @override
  Future<void> onTopScroll() {
    // TODO: implement onTopScroll
    throw UnimplementedError();
  }

  void getBack() {
    Get.back();
  }
}

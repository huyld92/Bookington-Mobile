import 'package:bookington_v2_2/core/app_export.dart';
  import 'package:flutter/material.dart';

class HistoryController extends GetxController with GetSingleTickerProviderStateMixin,ScrollMixin {
  // late TabController group125Controller =  Get.put(TabController(vsync: this, length: 3));

  final List<Tab> historyTabs = <Tab>[
    const Tab(text: 'UpComing'),
    const Tab(text: 'Completed'),
    const Tab(text: 'Canceled'),
  ];

  late TabController tabcontroller;

  RxList listBooking = RxList.filled(10,"aaa");

  @override
  void onInit() {
    tabcontroller = TabController(vsync: this, length: historyTabs.length);

    super.onInit();
  }

  @override
  void onClose() {
    tabcontroller.dispose();
    super.onClose();
  }

  void filter() {

  }

  @override
  Future<void> onEndScroll() {
    // TODO: implement onEndScroll
    throw UnimplementedError();
  }

  @override
  Future<void> onTopScroll() {
    // TODO: implement onTopScroll
    throw UnimplementedError();
  }
}

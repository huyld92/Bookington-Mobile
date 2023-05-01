// ignore_for_file: avoid_print

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/my_match_screen/models/my_match_model.dart';
import 'package:bookington_v2_2/presentation/my_match_screen/widgets/form_create_match.dart';
import 'package:flutter/material.dart';

class MyMatchController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController matchNameController = TextEditingController();

  final List<Tab> myMatchTabs = <Tab>[
    const Tab(text: 'Upcoming'),
    const Tab(text: 'Completes'),
  ];

  late TabController tabController;

  RxList<MyMatchModel> listMatchesUpcoming = RxList.filled(1, MyMatchModel());

  RxList<MyMatchModel> listMatchesCompletes = RxList.filled(1, MyMatchModel());

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: myMatchTabs.length);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void getBack() {
    Get.back();
  }

  void createMatch() {
    print('create match');
  }

  void createMatchDialog() {
     Get.dialog(ForumCreateMatch());
    // Get.defaultDialog(title: "Create match", content: FormCreateMatch(), barrierDismissible: false);
  }

  void matchDetails() {
    Get.toNamed(AppRoutes.matchDetailsScreen);
  }
}



// ignore_for_file: avoid_print

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/match_details_screen/model/members_model.dart';
import 'package:bookington_v2_2/presentation/match_details_screen/model/round_model.dart';
import 'package:flutter/material.dart';

class MatchDetailsController extends GetxController with GetSingleTickerProviderStateMixin{

  final List<Tab> matchDetailsTabs = <Tab>[
    const Tab(text: 'Score'),
    const Tab(text: 'Members'),
  ];

  late TabController tabController;

  late List<RoundModel> listMatches;

  RxList<MemberModel> listMember = RxList.filled(
      6,
      MemberModel( ));



  @override
  void onInit() {
    tabController = TabController(vsync: this, length: matchDetailsTabs.length);
    listMatches=generateItems(3);
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

  List<RoundModel> generateItems(int numberOfItems) {
    return List.generate(numberOfItems, (int index) {
      return RoundModel(
         'Round - $index', false.obs);
    });
  }

  void setScore(RoundModel model) {
    print('setScore');
    Get.defaultDialog(

    );
  }

}
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/matches_model.dart';
import 'package:flutter/material.dart';

class CompetitionDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> competitionTabs = <Tab>[
    const Tab(text: 'Details'),
    const Tab(text: 'Teams'),
    const Tab(text: 'Matches'),
  ];
  late TabController tabController;
  RxString appbarTitle = "Details".obs;
  RxList<MatchesModel> listMatches = RxList.filled(4,
      MatchesModel("id", "host_by", "ref_booking", 12, 6, "matchCode", false));

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: competitionTabs.length);
    tabController.addListener(_handleSelected);

    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void _handleSelected() {
    if (!tabController.indexIsChanging) {
      appbarTitle.value = competitionTabs[tabController.index].text ?? "";
    }
  }

  void location() {
    print("location");
  }

  void date() {
    print("date");
  }

  void getBack() {
    Get.back();
  }
}

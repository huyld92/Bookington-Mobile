// ignore_for_file: avoid_print

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/competition_model.dart';
import 'package:bookington_v2_2/data/models/team_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CompetitionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> competitionTabs = <Tab>[
    const Tab(text: 'Competition'),
    const Tab(text: 'Team'),
  ];
  late TabController tabController;

  RxList<TeamModel> listTeamModel = RxList.filled(
      3,
      TeamModel(
          "id", "refAccoount", "refCompetition", "Team 1", "teamCode", true));

  RxList<CompetitionModel> listCompetition = RxList.filled(
      3,
      CompetitionModel(
          "id",
          "hostBy",
          "Giải cầu lông năng khiếu - trẻ TPHCM 2023",
          "description",
          "competitionCode",
          10,
          DateFormat("dd-MM-yyyy").parse("12-12-2022"),
          DateFormat("dd-MM-yyyy").parse("30-12-2022"),
          DateFormat("dd-MM-yyyy").parse("20-12-2022"),
          true));

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: competitionTabs.length);
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

  void shareCompetition() {
    print('Share Competition');
  }

  void deleteCompetition() {
    print('Delete Competition');
  }

  void createButton() {
    if (tabController.index == 0) {
      print('create Competition');
    } else {
      print('create Team');
    }
  }

  void competitionDetails() {
    print('Competition details');
Get.toNamed(AppRoutes.competitionScreen);
  }

  void deleteTeam() {
    print('Delete Team');
  }

  void teamDetails() {
    print('Team details');

  }
}

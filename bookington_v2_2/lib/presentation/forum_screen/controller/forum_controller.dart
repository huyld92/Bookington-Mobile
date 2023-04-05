import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/competition_model.dart';
import 'package:bookington_v2_2/presentation/forum_screen/model/forum_match_model.dart';
import 'package:bookington_v2_2/presentation/my_match_screen/widgets/form_create_match.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ForumController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController joinMatchController = TextEditingController();

  final List<Tab> forumTabs = <Tab>[
    const Tab(text: 'Competition'),
    const Tab(text: 'Matches'),
  ];
  late TabController tabController;

  RxList<CompetitionModel> listCompetition = RxList.filled(
      6,
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

  RxList<ForumMatchModel> listMatches = RxList.filled(
      6,
      ForumMatchModel(
          "courtName",
          DateFormat("dd-MM-yyyy").parse("12-12-2022"),
          DateFormat("KK:mm").parse("12:00"),
          DateFormat("KK:mm").parse("14:00"),
          5,
          "description",
          true),);

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: forumTabs.length);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void joinMatch() {
    print('Join Match');
  }

  void createMatchDialog() {
    Get.dialog(ForumCreateMatch());
  }
}

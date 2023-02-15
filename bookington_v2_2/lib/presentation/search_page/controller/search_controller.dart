import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/court_model.dart';
import 'package:bookington_v2_2/presentation/search_page/models/search_model.dart';
import 'package:flutter/material.dart';

class SearchController extends GetxController {
  final String searchUrl = "/bookington/courts/query";
  TextEditingController searchController = TextEditingController();
  Rx<String> totalCount = "0".obs;
  late RxList<SearchModel> listSearchMode = <SearchModel>[].obs;

  @override
  void onInit() {
    print('Init');
    searchByName(1, "");
    super.onInit();
  }

  @override
  void onReady() {
    print('redy');
    super.onReady();
  }

  @override
  void onClose() {
    print('close');

    super.onClose();
    searchController.dispose();
  }

  void searchByName(int pageNumber, String searchValue) {
    listSearchMode.clear();
    ApiClient.searchCourt(pageNumber, searchValue).then((result) {
      listSearchMode.value = SearchModel.listFromJson(result["result"]).obs;
      totalCount = result["pagination"]["totalCount"].toString().obs;

      print("object: " + listSearchMode.toString());
      listSearchMode.refresh();
    });
  }
}

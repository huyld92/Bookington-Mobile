import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
 import 'package:bookington_v2_2/data/models/district_model.dart';
import 'package:bookington_v2_2/data/models/province_model.dart';
import 'package:bookington_v2_2/presentation/search_page/models/search_model.dart';
import 'package:flutter/material.dart';

class SearchController extends GetxController  with StateMixin, ScrollMixin {
  TextEditingController searchController = TextEditingController();

  Rx<String> totalCount = "0".obs;

  late RxList<SearchModel> listSearchMode = <SearchModel>[].obs;

  late RxList<ProvinceModel> province = <ProvinceModel>[].obs;

  late RxList<DistrictModel> dictrict = <DistrictModel>[].obs;
  final selectedProvince = ProvinceModel("-1", "Choose province").obs;
  final selectedDistrict = DistrictModel("-1", "Choose district").obs;

  onSelectedProvince(ProvinceModel value) {
    selectedProvince.value = value;
    getDistrictById(value.id);

    print('province value: ' + "${value.id}-" + value.provinceName);
  }

  onSelectedDistrict(DistrictModel value) {
    selectedDistrict.value = value;
    print('selectedDistrict:  ' + "${value.id}-" + value.districtName);
  }

  @override
  void onInit() {

    print('Init');
    loadData();
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

  void loadData() async{

    searchByName(1);
    getListProvince();
    dictrict.add(DistrictModel("-1", "Choose district"));
    province.add(ProvinceModel("-1", "Choose province"));

  }

  void searchByName(int pageNumber) async{
    change(null, status: RxStatus.loading());

    listSearchMode.clear();
    // default value
    if (selectedProvince.value.provinceName == "Choose province") {
      selectedProvince.value.provinceName = "";
      selectedDistrict.value.districtName = "";
    } else if (selectedDistrict.value.districtName == "Choose district") {
      selectedDistrict.value.districtName = "";
    }
    SearchModel courtModel = SearchModel.search(
        searchController.text.trim(),
        selectedDistrict.value.districtName,
        selectedProvince.value.provinceName);
    ApiClient.searchCourt(pageNumber, courtModel).then((result) {
      if (result.statusCode == 200) {
        final jsonResult = jsonDecode(result.body);
        totalCount = jsonResult["pagination"]["totalCount"].toString().obs;
        if (totalCount.value == '0') {

           change(null, status: RxStatus.empty());
        }
        // else if (getFirstData && emptyRepositories) {
        //   lastPage = true;
        // }
        else {
          // getFirstData = true;
           listSearchMode.value =
              SearchModel.listFromJson(jsonResult["result"]).obs;
          change(listSearchMode, status: RxStatus.success());
        }
        // Future.delayed(Duration(seconds: 1), () {
        //   change(listSearchMode, status: RxStatus.success());
        //  });
        listSearchMode.refresh();
      }
    }
    );

    if (selectedProvince.value.provinceName.isEmpty) {
      selectedProvince.value.provinceName = "Choose province";
    }
    if (selectedDistrict.value.districtName.isEmpty) {
      selectedDistrict.value.districtName = "Choose district";
    }
   }

  void getListProvince() {
    ApiClient.getAllProvince().then((result) {
      print('status coe: ' + result.statusCode.toString());
      if (result.statusCode == 200) {
        List jsonResult = jsonDecode(result.body)["result"];

        province.value =
            ProvinceModel.listNameFromJson(jsonDecode(result.body)["result"]);
        // jsonResult.map((e) => e["provinceName"].toString()).toList();
        //     jsonResult.map((e) => e[""].obs);
        province.add(ProvinceModel("-1", "Choose province"));
        province.refresh();
      }
    });
  }

  void getDistrictById(String id) {
    dictrict.clear();
    ApiClient.getDistrictById(id).then((result) {
      print('status coe: ' + result.statusCode.toString());
      if (result.statusCode == 200) {
        dictrict.value =
            DistrictModel.listNameFromJson(jsonDecode(result.body)["result"]);
        //     jsonResult.map((e) => e[""].obs);
        dictrict.add(DistrictModel("-1", "Choose district"));
        dictrict.refresh();
      }
    });
    selectedDistrict.value = DistrictModel("-1", "Choose district");
  }

  courtDetailsScreen(int index) {
    Map<String,String> arg = {
      "courtId": listSearchMode[index].id,
    };
    // PrefUtils.setString("courtId", listSearchMode[index].id);
    Get.toNamed(AppRoutes.courtDetailsScreen,arguments: arg);

   }

  @override
  Future<void> onEndScroll() async {
    print('onEndScroll');

  }

  @override
  Future<void> onTopScroll() async {
    print('onTopScroll');
  }



 }

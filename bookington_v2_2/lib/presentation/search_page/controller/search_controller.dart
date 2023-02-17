import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/court_model.dart';
import 'package:bookington_v2_2/data/models/district_model.dart';
import 'package:bookington_v2_2/data/models/province_model.dart';
import 'package:bookington_v2_2/presentation/search_page/models/search_model.dart';
import 'package:flutter/material.dart';

class SearchController extends GetxController {
  final String searchUrl = "/bookington/courts/query";
  TextEditingController searchController = TextEditingController();
  Rx<String> totalCount = "0".obs;
  late RxList<SearchModel> listSearchMode = <SearchModel>[].obs;

  late RxList<ProvinceModel> province = <ProvinceModel>[].obs;

  late RxList<DistrictModel> dictrict = <DistrictModel>[].obs;
  final selectedProvince = ProvinceModel("-1", "Choose province").obs;
  final selectedDistrict = DistrictModel("-1", "Choose district").obs;

  // List listType = ["Ho Chi Minh", "Thua Thien Hue", "Tien Giang", "Ba Ria-Vung Tau", "Ba Ria-Vung Tau", "Ba Ria-Vung Tau", "Ba Ria-Vung Tau", "Ba Ria-Vung Tau", "Ba Ria-Vung Tau", "Ba Ria-Vung Tau", "Ba Ria-Vung Tau", "Ba Ria-Vung Tau", "Ba CCCC-Vung Tau", "Ba Ria-Vung Tau", "Ba Ria-Vung Tau", "Ba Ria-Vung Tau", "Ba Ria-Vung Tau", "BBBBBBBBBB", "AAAAA"];
  // // It is mandatory initialize with one value from listType
  // final selected = "Ho Chi Minh".obs;
  //
  // void setSelected(String value) {
  //   selected.value = value;
  //   print(selected.value);
  // }

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

  void loadData() {
    searchByName(1);
    getListProvince();
    dictrict.add(DistrictModel("-1", "Choose district"));
    province.add(ProvinceModel("-1", "Choose province"));
  }

  void searchByName(int pageNumber) {
    listSearchMode.clear();
    if (selectedProvince.value.provinceName == "Choose province") {
      selectedProvince.value.provinceName = "";
      selectedDistrict.value.districtName = "";
    } else if (selectedDistrict.value.districtName == "Choose district") {
      selectedDistrict.value.districtName = "";
    }
    CourtModel courtModel = CourtModel.search(
        searchController.text.trim(),
        selectedDistrict.value.districtName,
        selectedProvince.value.provinceName);
    ApiClient.searchCourt(pageNumber, courtModel).then((result) {
      if (result.statusCode == 200) {
        final jsonResult = jsonDecode(result.body);
        listSearchMode.value =
            SearchModel.listFromJson(jsonResult["result"]).obs;
        totalCount = jsonResult["pagination"]["totalCount"].toString().obs;

        listSearchMode.refresh();
      }
    });

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

    // Map<String,String> params = {
    //   "id": listSearchMode[index].id,
    // };
    PrefUtils.setString("courtId", listSearchMode[index].id);
     Get.offNamed(AppRoutes.courtDetailsScreen);

    print("Court Details");
  }
}

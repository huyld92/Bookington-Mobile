import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/district_model.dart';
import 'package:bookington_v2_2/data/models/province_model.dart';
import 'package:bookington_v2_2/presentation/profile_screen/controller/profile_controller.dart';
import 'package:bookington_v2_2/presentation/search_page/models/search_model.dart';
import 'package:flutter/material.dart';

class SearchController extends GetxController with StateMixin, ScrollMixin {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();


  late RxList<SearchModel> listSearchMode = <SearchModel>[].obs;

  late RxList<ProvinceModel> province = <ProvinceModel>[].obs;

  late RxList<DistrictModel> district = <DistrictModel>[].obs;
  final selectedProvince = ProvinceModel("-1", "Choose province").obs;
  final selectedDistrict = DistrictModel("-1", "Choose district").obs;
  RxInt pageNumber = 1.obs;
  Rx<String> totalCourt = "0".obs;

  onSelectedProvince(ProvinceModel value) {
    selectedProvince.value = value;
    getDistrictById(value.id);

    FocusManager.instance.primaryFocus?.unfocus();
  }

  onSelectedDistrict(DistrictModel value) {
    FocusManager.instance.primaryFocus?.unfocus();
    selectedDistrict.value = value;
   }

  @override
  void onInit() {
     loadData();
    super.onInit();
  }


  @override
  void onClose() {
    searchController.dispose();
    super.onDelete();
  }

  void loadData() async {
    // addItems();
    searchByName(1);
    getListProvince();
    district.add(DistrictModel("-1", "Choose district"));
    province.add(ProvinceModel("-1", "Choose province"));
  }

  void searchByName(int pageNumber) async {
    change(null, status: RxStatus.loading());
    if(pageNumber == 0) {
      this.pageNumber.value = 1;
      pageNumber = 1;
     }
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
        totalCourt = jsonResult["pagination"]["totalCount"].toString().obs;
        if (totalCourt.value == '0') {
          change(null, status: RxStatus.empty());
        }
        else {
          if(pageNumber==1){
           listSearchMode.value =
              SearchModel.listFromJson(jsonResult["result"]).obs;
          } else{
            listSearchMode.addAll(SearchModel.listFromJson(jsonResult["result"]));
          }
          change(listSearchMode, status: RxStatus.success());
        }
        listSearchMode.refresh();
      } else if(result.statusCode == 401 || result.statusCode == 403){
        ProfileController profileController = Get.find();
        Map<String, bool> arg = {"timeOut": true};
        profileController.logout(arg);
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
      print('status coe: ${result.statusCode}');
      if (result.statusCode == 200) {
        List jsonResult = jsonDecode(result.body)["result"];

        province.value =
            ProvinceModel.listNameFromJson(jsonResult);
        province.add(ProvinceModel("-1", "Choose province"));
        province.refresh();
      }else if(result.statusCode == 401 || result.statusCode == 403){
        ProfileController profileController = Get.find();
        Map<String, bool> arg = {"timeOut": true};
        profileController.logout(arg);
      }
    });
  }

  void getDistrictById(String id) {
    district.clear();
    ApiClient.getDistrictById(id).then((result) {
      print('status coe: ${result.statusCode}');
      if (result.statusCode == 200) {
        district.value =
            DistrictModel.listNameFromJson(jsonDecode(result.body)["result"]);
        //     jsonResult.map((e) => e[""].obs);
        district.add(DistrictModel("-1", "Choose district"));
        district.refresh();
      }else if(result.statusCode == 401 || result.statusCode == 403){
        ProfileController profileController = Get.find();
        Map<String, bool> arg = {"timeOut": true};
        profileController.logout(arg);
      }
    });
    selectedDistrict.value = DistrictModel("-1", "Choose district");
  }

  courtDetailsScreen(int index) {
    Map<String, String> arg = {
      "courtId": listSearchMode[index].id,
    };
    // PrefUtils.setString("courtId", listSearchMode[index].id);
    Get.toNamed(AppRoutes.courtDetailsScreen, arguments: arg);
  }

  // addItems() async {
  //   scrollController.addListener(() {
  //     print(scrollController.position.maxScrollExtent);
  //     if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
  //        if(listSearchMode.length < int.parse(totalCourt.value)){
  //          pageNumber.value++;
  //          print('pageNumber: $pageNumber');
  //          searchByName(pageNumber.value);
  //        }
  //     }
  //   });
  // }

  @override
  Future<void> onEndScroll() async {
    if(listSearchMode.length < int.parse(totalCourt.value)){
      pageNumber.value++;
      print('pageNumber: $pageNumber');
      searchByName(pageNumber.value);
    }
  }

  @override
  Future<void> onTopScroll() async {

  }

}

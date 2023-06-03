import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/core/utils/map_utils.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/district_model.dart';
import 'package:bookington_v2_2/data/models/province_model.dart';
import 'package:bookington_v2_2/presentation/search_screen/models/query_model.dart';
import 'package:bookington_v2_2/presentation/search_screen/models/search_model.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  bool searchByLocation = true;

  var selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .obs;
  var selectedTime = DateTime.now().obs;

  Map<String, String?> positionAddress = {
    "districtName": "Choose district",
    "provinceName": "Choose province",
  };

  onSelectedProvince(ProvinceModel value) {
    searchByLocation = false;
    selectedProvince.value = value;
    getDistrictById(value.id);
    pageNumber.value = 1;
    FocusManager.instance.primaryFocus?.unfocus();
  }

  onSelectedDistrict(DistrictModel value) {
    searchByLocation = false;
    FocusManager.instance.primaryFocus?.unfocus();
    pageNumber.value = 1;
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

  Future<void> getPosition() async {
    positionAddress = await MapUtils.getCurrentPosition();
    if (positionAddress["districtName"] == null) {
      positionAddress["districtName"] = "Choose district";
      positionAddress["provinceName"] = "Choose province";
    }
  }

  Future<void> loadData() async {
    // await getPosition();
    await getListProvince();
    await searchByName(1);
  }

  Future<void> searchByName(int pageNumber) async {
    if (pageNumber == 1) {
      this.pageNumber.value = 1;
    }
    if (pageNumber == 1) {
      change(null, status: RxStatus.loading());
    }
    // default value
    if (selectedProvince.value.provinceName == "Choose province") {
      selectedProvince.value.provinceName = "";
      selectedDistrict.value.districtName = "";
    } else if (selectedDistrict.value.districtName == "Choose district") {
      selectedDistrict.value.districtName = "";
    }
    int maxPageSize = 5;

    QueryModel queryModel = QueryModel(
        searchText: searchController.text.trim(),
        district: selectedDistrict.value.districtName,
        province: selectedProvince.value.provinceName,
        playDate: DateFormat("yyyy-MM-dd").format(selectedDate.value),
        // playDate: "",
        playTime: DateFormat("HH:mm").format(selectedTime.value),
        pageNumber: pageNumber,
        maxPageSize: maxPageSize);
    try {
      await ApiClient.searchCourt(pageNumber, maxPageSize, queryModel)
          .then((result) {
        if (result.statusCode == 200) {
          final jsonResult = jsonDecode(result.body);
          totalCourt = jsonResult["pagination"]["totalCount"].toString().obs;
          if (totalCourt.value == '0') {
            listSearchMode.clear();
          } else {
            if (pageNumber == 1) {
              listSearchMode.value =
                  SearchModel.listFromJson(jsonResult["result"]).obs;
            } else {
              listSearchMode
                  .addAll(SearchModel.listFromJson(jsonResult["result"]));
            }
          }
          listSearchMode.refresh();
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Logger.log(
              "SearchController error at searchByName: ${result.statusCode} \n ${result.body}");
        }
      });

      if (selectedProvince.value.provinceName.isEmpty) {
        selectedProvince.value.provinceName = "Choose province";
      }
      if (selectedDistrict.value.districtName.isEmpty) {
        selectedDistrict.value.districtName = "Choose district";
      }
    } on Exception catch (e) {
      Logger.log("SearchController error at searchByName: ${e.toString()}");
    } finally {
      if (listSearchMode.isNotEmpty) {
        change(null, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    }
  }

  Future<void> getListProvince() async {
    try {
      await ApiClient.getAllProvince().then((result) async {
        if (result.statusCode == 200) {
          List jsonResult = jsonDecode(result.body)["result"];
          province.value = ProvinceModel.listNameFromJson(jsonResult);
          province.add(ProvinceModel("-1", "Choose province"));
          district.add( DistrictModel("-1", "Choose district"));
          province.refresh();
          district.refresh();
          if (searchByLocation) {
            for (ProvinceModel p in province) {
              if (p.provinceName == positionAddress["provinceName"]) {
                selectedProvince.value = p;
                await getDistrictById(selectedProvince.value.id);
                return;
              }
            }
          }
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Logger.log(
              "SearchController error at getListProvince: ${result.statusCode}");
        }
      });
    } on Exception catch (e) {
      Logger.log("SearchController error at getListProvince: ${e.toString()}");
    }
  }

  Future<void> getDistrictById(String id) async {
    try {
      district.clear();
      await ApiClient.getDistrictById(id).then((result) async {
        if (result.statusCode == 200) {
          district.value =
              DistrictModel.listNameFromJson(jsonDecode(result.body)["result"]);
          district.add(DistrictModel("-1", "Choose district"));
          district.refresh();
          if (searchByLocation) {
            for (DistrictModel d in district) {
              if (d.districtName == positionAddress["districtName"]) {
                selectedDistrict.value = d;
                return;
              }
            }
          }
          selectedDistrict.value = DistrictModel("-1", "Choose district");
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Logger.log(
              "SearchController error at getDistrictById: ${result.statusCode}");
        }
      });
    } on Exception catch (e) {
      Logger.log("SearchController error at getDistrictById: ${e.toString()}");
    }
  }

  void logout() async {
    PrefUtils.clearPreferencesData();
    Map<String, bool> arg = {"timeOut": true};
    Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
  }

  courtDetailsScreen(int index) {
    Map<String, dynamic> arg = {
      "courtId": listSearchMode[index].id,
      "playDate": selectedDate.value,
      "playTime": selectedTime.value
    };
    Get.toNamed(AppRoutes.courtDetailsScreen, arguments: arg);
  }

  @override
  Future<void> onEndScroll() async {
    // change(null, status: RxStatus.loadingMore());
    if (listSearchMode.length < int.parse(totalCourt.value)) {
      pageNumber.value++;
      await searchByName(pageNumber.value);
    }
  }

  @override
  Future<void> onTopScroll() async {}

  presentDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select Date',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Date',
      fieldHintText: 'Month/Date/Year',
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      DateTime now = DateTime.now();
      DateTime date = DateTime(now.year, now.month, now.day);
      if (pickedDate.isAtSameMomentAs(date)) {
        selectedDate.value = pickedDate;
        selectedTime.value = now;
      } else {
        selectedDate.value = pickedDate;
        selectedTime.value = DateFormat("KK:mm").parse("00:00");
      }
    }
  }

  void timePicker(DateTime time) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    if (date.isAtSameMomentAs(selectedDate.value)) {
      if (now.isAfter(time)) {
        Get.defaultDialog(
          title: "Error pick time",
          content: Text("msg_cannot_select_previous_time".tr),
        );
      } else {
        selectedTime.value = time;
      }
    } else {
      selectedTime.value = time;
    }
  }

  void filterDialog() {
    Get.defaultDialog(
        title: "lbl_filter".tr,
        content: Column(
          children: [
            Obx(
              () => Container(
                width: getVerticalSize(200),
                height: getVerticalSize(40),
                decoration: BoxDecoration(
                  border: BorderRadiusStyle.border2Gray500,
                  borderRadius: BorderRadiusStyle.roundedBorder16,
                ),
                padding: getPadding(top: 5, left: 5, right: 5, bottom: 5),
                margin: getMargin(all: 10),
                child: DropdownButton<ProvinceModel>(
                  underline: const SizedBox(),
                  isExpanded: true,
                  items: province.map((ProvinceModel dropDownStringItem) {
                    return DropdownMenuItem<ProvinceModel>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem.provinceName,
                        style: AppStyle.txtManropeRegular14,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) => onSelectedProvince(value!),
                  value: selectedProvince.value,
                ),
              ),
            ),
            Obx(
              () => Container(
                width: getVerticalSize(200),
                height: getVerticalSize(40),
                margin: getPadding(top: 10, bottom: 10),
                padding: getPadding(top: 5, left: 5, right: 5, bottom: 5),
                decoration: BoxDecoration(
                  border: BorderRadiusStyle.border2Gray500,
                  borderRadius: BorderRadiusStyle.roundedBorder16,
                ),
                child: DropdownButton<DistrictModel>(
                  underline: const SizedBox(),
                  isExpanded: true,
                  items: district.map((DistrictModel dropDownStringItem) {
                    return DropdownMenuItem<DistrictModel>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem.districtName,
                        style: AppStyle.txtManropeRegular14,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) => onSelectedDistrict(value!),
                  value: selectedDistrict.value,
                ),
              ),
            ),
            CustomButton(
              height: 40,
              width: 355,
              margin: getMargin(left: 10, right: 10),
              padding: ButtonPadding.PaddingAll8,
              text: "lbl_search".tr,
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                searchByName(1);
                Get.back();
              },
            )
          ],
        ));
  }
}

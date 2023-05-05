// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/presentation/choose_court_screen/models/choose_court_model.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/profile_screen/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChooseCourtController extends GetxController with StateMixin {
  var selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .obs;
  var selectedTime = DateTime.now().obs;
  RxString selectedIndex = "".obs;

  RxList<ChooseCourtModel> subCourtList = <ChooseCourtModel>[].obs;
  String courtId = "";

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() {
    Map<String, dynamic>? arg = Get.arguments!;
    if (arg != null) {
      courtId = arg["courtId"]!;
      selectedDate.value = arg["playDate"];
      selectedTime.value = arg["playTime"];
    }
     getAvailableSubCourt();
  }

  void getAvailableSubCourt() {
    try {
      change(null, status: RxStatus.loading());

      String playDate = DateFormat("yyy-MM-dd").format(selectedDate.value);
      String startTime =
          DateFormat("HH:mm").format(selectedTime.value); //'13:45:42.0000000';
      ApiClient.getAvailableSubCourt(courtId, playDate, startTime)
          .then((result) {
        print('statusCode: ${result.statusCode}');
        if (result.statusCode == 200) {
          subCourtList.clear();
          final jsonResult = jsonDecode(result.body);
          subCourtList.value =
              ChooseCourtModel.listFromJson(jsonResult["result"]);
          subCourtList.refresh();
          if (subCourtList.isEmpty) {
            change(null, status: RxStatus.empty());
          } else {
            change(null, status: RxStatus.success());
          }
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Logger.log(
              "ChooseCourtController error at getAvailableSubCourt: ${result.statusCode}");        }
        change(null, status: RxStatus.success());
      });
    } catch (e) {
      Logger.log(
          "ChooseCourtController ERROR at getAvailableSubCourt: ${e.toString()}");
    }
  }


  void logout()  {
    PrefUtils.clearPreferencesData();
    Map<String, bool> arg = {"timeOut": true};
    Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
  }

  void selectCourt(int index) {
    for (ChooseCourtModel subCourt in subCourtList) {
      subCourt.isSelected = false;
    }
    selectedIndex.value = index.toString();
    subCourtList[index].isSelected = true;
    subCourtList.refresh();
  }

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
        getAvailableSubCourt();
      } else {
        selectedDate.value = pickedDate;
        selectedTime.value = DateFormat("KK:mm").parse("00:00");
        getAvailableSubCourt();
      }
      selectedIndex.value = "";
    }
  }

  void timePicker(DateTime time) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    if (date.isAtSameMomentAs(selectedDate.value)) {
      if (now.isAfter(time)) {
        Get.defaultDialog(
            title: "Error pick time",
            content: Text("msg_cannot_select_previous_time".tr));
      } else {
        selectedTime.value = time;
        getAvailableSubCourt();
      }
    } else {
      selectedTime.value = time;

      getAvailableSubCourt();
    }
    selectedIndex.value = "";

  }

  void nextChooseSlot() {
    if (selectedIndex.isNotEmpty) {
      int index = int.parse(selectedIndex.value);
      Map<String, String> arg = {
        "courtId": courtId,
        "subCourtId": subCourtList[index].id,
        "name": subCourtList[index].name,
        "playDate": DateFormat('dd-MM-yyyy').format(selectedDate.value),
      };
      Get.toNamed(AppRoutes.chooseSlotScreen, arguments: arg);
    }
  }

  getBack() {
     Get.back();
  }
}

import 'dart:convert';

import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/presentation/choose_court_screen/models/choose_court_model.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/profile_screen/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChooseCourtController extends GetxController with StateMixin {
  var selectedDate = DateTime.now().obs;
  var selectedTime = DateTime.now().obs;
  RxString selectedIndex = "".obs;

  RxList<ChooseCourtModel> subCourtList = <ChooseCourtModel>[].obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() {
    getAvailableSubCourt();
  }

  void getAvailableSubCourt() {
    try {
      change(null, status: RxStatus.loading());

      String courtId = "";
      Map<String, String> arg = Get.arguments;
      if (arg["courtId"] != null) {
        courtId = arg["courtId"]!;
      }
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
        }else if(result.statusCode == 401 || result.statusCode == 403){
          ProfileController profileController = Get.find();
          profileController.logout();
        } else {
          print(result.headers);
        }
        change(null, status: RxStatus.success());

      });
    } catch (error) {
      print(error.toString());
    }
  }

  void selectCourt(int index) {
    for (ChooseCourtModel slot in subCourtList) {
      slot.isSelected = false;
    }
    selectedIndex.value = index.toString();
    subCourtList[index].isSelected = true;
    subCourtList.refresh();
  }

  presentDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
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
      selectedDate.value = pickedDate;
      getAvailableSubCourt();
    }
  }

  void timePicker(DateTime date) {
    selectedTime.value = date;
    getAvailableSubCourt();
  }

  void nextChooseSlot() {
    if (selectedIndex.isNotEmpty) {
      int index = int.parse(selectedIndex.value);
      Map<String, String> arg = {
        "id": subCourtList[index].id,
        "name": subCourtList[index].name,
        "playDate": DateFormat('yyyy-MM-dd').format(selectedDate.value),
      };
      Get.toNamed(AppRoutes.chooseSlotScreen, arguments: arg);
    }
  }

  getBack() {
    print("Choose court back");
    Get.back();
  }
}

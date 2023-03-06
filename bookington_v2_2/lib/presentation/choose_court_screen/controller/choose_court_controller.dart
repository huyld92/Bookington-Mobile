import 'dart:convert';

import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/presentation/choose_court_screen/models/choose_court_model.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChooseCourtController extends GetxController {
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
    // subCourtList.add(ChooseCourtModel("1", false, false));
    // subCourtList.add(ChooseCourtModel("2", true, false));
    // subCourtList.add(ChooseCourtModel("3", true, false));
    // subCourtList.add(ChooseCourtModel("4", true, false));
    // subCourtList.add(ChooseCourtModel("5", false, false));
    // subCourtList.add(ChooseCourtModel("6", true, false));
    // subCourtList.add(ChooseCourtModel("7", true, false));
    // subCourtList.add(ChooseCourtModel("8", true, false));
    // subCourtList.add(ChooseCourtModel("9", true, false));
    // subCourtList.add(ChooseCourtModel("10", false, false));
    getAvailableSubCourt();
  }

  void getAvailableSubCourt() {
    try {
      String courtId = "";
      Map<String, String> arg = Get.arguments;
      if (arg["courtId"] != null) {
        courtId = arg["courtId"]!;
        print('courtId: ${arg["courtId"]}');
      } else {
        print('NUlll');
      }
      // String playDate = DateFormat("yyy-MM-dd").format(selectedDate.value);
      String playDate = "2023-03-06";
      // String startTime = '13:45:42.0000000'; //'13:45:42.0000000';
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
        } else {
          print(result.headers);
        }
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
       Get.toNamed(AppRoutes.chooseSlotScreen,arguments: arg);
    }
  }

  getBack() {
    print("Choose court back");
    Get.back();
  }
}

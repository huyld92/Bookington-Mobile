import 'package:bookington_v2_2/presentation/choose_court_screen/models/choose_court_model.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:flutter/material.dart';

class ChooseCourtController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;
  String isSelected = "";

  RxList<ChooseCourtModel> subCourtList = <ChooseCourtModel>[].obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() {
    subCourtList.add(ChooseCourtModel("1", false, false));
    subCourtList.add(ChooseCourtModel("2", true, false));
    subCourtList.add(ChooseCourtModel("3", true, false));
    subCourtList.add(ChooseCourtModel("4", true, false));
    subCourtList.add(ChooseCourtModel("5", false, false));
    subCourtList.add(ChooseCourtModel("6", true, false));
    subCourtList.add(ChooseCourtModel("7", true, false));
    subCourtList.add(ChooseCourtModel("8", true, false));
    subCourtList.add(ChooseCourtModel("9", true, false));
    subCourtList.add(ChooseCourtModel("10", false, false));
  }

  void selectCourt(int index) {
    for (ChooseCourtModel slot in subCourtList.value) {
      slot.isSelected = false;
    }
    isSelected = subCourtList[index].id;
    subCourtList[index].isSelected = true;
    subCourtList.refresh();
  }

  void nextChooseSlot() {
    // Map<String,String> params = {
    //   "id": idSlected,
    //   "date":selectedDate.toString(),
    // };
    // Get.toNamed(AppRoutes.chooseSlotScreen);
    Get.toNamed(AppRoutes.chooseSlotScreen);
  }

  presentDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
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
      print("Date" + pickedDate.toString());
    }
  }

  presentTimePicker() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dialOnly,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select Time',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorInvalidText: 'Enter valid time range',

    );
    if (pickedTime != null && pickedTime != selectedTime.value) {
      selectedTime.value = pickedTime;
      print("Time" + pickedTime.toString());
    }
  }

  getBack() {
    print("Choose court back");
    Get.back();
  }
}



import 'package:bookington_v2_2/presentation/choose_court_screen/models/choose_court_model.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:flutter/material.dart';

class ChooseCourtController extends GetxController{

  var selectedDate = DateTime.now().obs;
  String idSlected = "";

  RxList<ChooseSlotModel> subCourtList = <ChooseSlotModel>[].obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

  }

  void loadData(){
    subCourtList.value.add(ChooseSlotModel("1", false, false));
    subCourtList.value.add(ChooseSlotModel("2", true, false));
    subCourtList.value.add(ChooseSlotModel("3", true, false));
    subCourtList.value.add(ChooseSlotModel("4", true, false));
    subCourtList.value.add(ChooseSlotModel("5", false, false));
    subCourtList.value.add(ChooseSlotModel("6", true, false));
    subCourtList.value.add(ChooseSlotModel("7", true, false));
    subCourtList.value.add(ChooseSlotModel("8", true, false));
    subCourtList.value.add(ChooseSlotModel("9", true, false));
    subCourtList.value.add(ChooseSlotModel("10", false, false));
  }

  void selectCourt(int indext){
    for(ChooseSlotModel slot in subCourtList.value){
      slot.isSelected= false;
    }
    idSlected = subCourtList.value[indext].id;
    subCourtList.value[indext].isSelected = true;
    subCourtList.refresh();
  }

  void nextChooseSlot(){
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
        fieldHintText: 'Month/Date/Year',);
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      print("Date"  + pickedDate.toString());
    }
  }

  getBack(){

    print("Choose court back");
    // Get.back();
  }

}
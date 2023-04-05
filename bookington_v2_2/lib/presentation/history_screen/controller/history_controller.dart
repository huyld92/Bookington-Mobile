import 'package:bookington_v2_2/core/app_export.dart';
  import 'package:flutter/material.dart';

class HistoryController extends GetxController with GetSingleTickerProviderStateMixin,ScrollMixin {

  final List<Tab> historyTabs = <Tab>[
    const Tab(text: 'UpComing'),
    const Tab(text: 'Previous'),
  ];
  var selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .obs;
  late TabController tabController;

  RxList listBooking = RxList.filled(10,"aaa");

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: historyTabs.length);
    print(tabController.toString());
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void filter() {

  }

  @override
  Future<void> onEndScroll() async {
   // if(tabcontroller.)
  }

  @override
  Future<void> onTopScroll() {
    // TODO: implement onTopScroll
    throw UnimplementedError();
  }

  void getBack() {
    // Get.back();
    Get.offAllNamed(AppRoutes.profileScreen);
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
      selectedDate.value = pickedDate;
    }
  }
}

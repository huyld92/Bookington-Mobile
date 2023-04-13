// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/booking_history_model.dart';
import 'package:bookington_v2_2/presentation/history_screen/models/booking_history_model.dart';
  import 'package:flutter/material.dart';

class HistoryController extends GetxController with GetSingleTickerProviderStateMixin,ScrollMixin, StateMixin {

  final List<Tab> historyTabs = <Tab>[
    const Tab(text: 'UpComing'),
    const Tab(text: 'Previous'),
  ];
  var selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .obs;
  late TabController tabController;
  RxInt pageNumber = 1.obs;

  RxList<BookingHistoryScreenModel> listBooking = RxList.empty();

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: historyTabs.length);
    loadData();
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  loadData() async {
    await getIncomingBookings(1);
  }

  getIncomingBookings(int pageNumber) async {
    change(null, status: RxStatus.loading());
    int maxPageSize = 5;
    if (pageNumber == 0) {
      this.pageNumber.value = 1;
      pageNumber = 1;
    }
    try{

      await ApiClient.getIncomingBookings(pageNumber,maxPageSize).then((result) {
        print('status court details: ${result.statusCode}');

        if (result.statusCode == 200) {
          List<BookingHistoryModel> listBookingHistoryModel =
          BookingHistoryModel.listFromJson(jsonDecode(result.body)["result"]);
          listBooking.addAll(Iterable.castFrom(listBookingHistoryModel));
          print(listBookingHistoryModel.asMap().toString());
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Logger.log(
              "HistoryController error at getIncomingBookings: ${result.statusCode}");
        }
      });
    } catch (e) {
      Logger.log(
          "HistoryController error at getIncomingBookings: ${e.toString()}");
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  void logout() {
    PrefUtils.clearPreferencesData();
    Map<String, bool> arg = {"timeOut": true};
    Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
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

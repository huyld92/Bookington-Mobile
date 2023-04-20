// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/booking_history_model.dart';
import 'package:bookington_v2_2/presentation/booking_history_screen/models/booking_history_model.dart';
import 'package:flutter/material.dart';

class HistoryController extends GetxController
    with GetSingleTickerProviderStateMixin, ScrollMixin, StateMixin {
  final List<Tab> historyTabs = <Tab>[
    const Tab(text: 'UpComing'),
    const Tab(text: 'Previous'),
  ];
  var selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .obs;
  late TabController tabController;
  int pageNumber = 1;

  RxList<BookingHistoryScreenModel> listUpcomingBooking = RxList.empty();
  RxList<BookingHistoryScreenModel> listPreviousBooking = RxList.empty();

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
    await getPreviousBookings(1);
    print(listPreviousBooking.length);
    print(listUpcomingBooking.length);
  }

  Future<void> getIncomingBookings(int pageNumber) async {
    change(null, status: RxStatus.loading());
    int maxPageSize = 20;
    if (pageNumber == 0) {
      this.pageNumber = 1;
      pageNumber = 1;
    }
    try {
      await ApiClient.getIncomingBookings(pageNumber, maxPageSize)
          .then((result) {
        if (result.statusCode == 200) {
          var jsonResult = jsonDecode(result.body);
          List<BookingHistoryModel> listBookingHistoryModel =
              BookingHistoryModel.listFromJson(jsonResult["result"]);
          listUpcomingBooking = RxList.generate(
              listBookingHistoryModel.length,
              (index) =>
                  BookingHistoryScreenModel(listBookingHistoryModel[index]));
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

  Future<void> getPreviousBookings(int pageNumber) async {
    change(null, status: RxStatus.loading());
    int maxPageSize = 30;
    if (pageNumber == 0) {
      this.pageNumber = 1;
      pageNumber = 1;
    }
    try {
      await ApiClient.getFinishedBookings(pageNumber, maxPageSize)
          .then((result) {
        if (result.statusCode == 200) {
          var jsonResult = jsonDecode(result.body);
          List<BookingHistoryModel> listBookingHistoryModel =
              BookingHistoryModel.listFromJson(jsonResult["result"]);
          listPreviousBooking = RxList.generate(
              listBookingHistoryModel.length,
              (index) =>
                  BookingHistoryScreenModel(listBookingHistoryModel[index]));
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

  void filter() {}

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

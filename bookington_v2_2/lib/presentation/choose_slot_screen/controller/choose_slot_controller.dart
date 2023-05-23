// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/booking_model.dart';
import 'package:bookington_v2_2/data/models/slot_model.dart';
import 'package:bookington_v2_2/presentation/payment_screen/models/payment_model.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChooseSlotController extends GetxController with StateMixin {
  late RxList<bool> listSelected = <bool>[].obs;

  RxList<SlotModel> slotList = <SlotModel>[].obs;
  String courtId = "";
  String subCourtID = "";
  RxString courtName = "".obs;
  Rx<DateTime> playDate = DateTime.now().obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    try {
      Map<String, String> arg = Get.arguments;
      if (arg["courtId"] != null) {
        courtId = arg["courtId"]!;
        subCourtID = arg["subCourtId"]!;
        courtName.value = arg["name"]!;
        playDate.value = DateFormat("dd-MM-yyyy").parse(arg["playDate"]!);
        await getAvailableSlot();
      } else {
        getBack();
      }
    } catch (e) {
      Logger.log("ChooseSlotController error at loadData: ${e.toString()}");
    }
  }

  void selectSlot(int index) {
    if (listSelected.contains(true)) {
      int firstIndex = listSelected.indexOf(true);
      int lastIndex = listSelected.lastIndexOf(true);
      if (index == firstIndex || index == lastIndex) {
        listSelected[index] = !listSelected[index];
      } else if (index == firstIndex - 1 || index == lastIndex + 1) {
        listSelected[index] = !listSelected[index];
      } else if (index > firstIndex && index < lastIndex) {
        listSelected.fillRange(index, lastIndex + 1, false);
      } else if (index < firstIndex - 1 || index > lastIndex + 1) {
        listSelected.fillRange(0, listSelected.length, false);
        listSelected[index] = !listSelected[index];
      }
    } else {
      listSelected[index] = !listSelected[index];
    }
    listSelected.refresh();
  }

  Future<void> getAvailableSlot() async {
    bool isError = false;
    try {
      change(null, status: RxStatus.loading());
      String strPlayDate = DateFormat("yyyy-MM-dd").format(playDate.value);
      print(subCourtID + "  " + strPlayDate);

      await ApiClient.getAvailableSlot(subCourtID, strPlayDate).then((result) {
        if (result.statusCode == 200) {
          var jsonResult = jsonDecode(result.body);
          slotList.value =
              SlotModel.listFromJson(jsonResult["result"]["slots"]);
          listSelected.value = RxList.filled(slotList.length, false);
          validateSlot(strPlayDate);
           slotList.refresh();
          listSelected.refresh();
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        }  else if (result.statusCode == 500){
          isError= true;
          Logger.log(
              "ChooseSlotController error at getAvailableSlot: ${result.statusCode}\n ${result.body}");
        } else {
          Logger.log(
              "ChooseSlotController error at getAvailableSlot: ${result.statusCode}");
        }
      });
    } catch (e) {
      Logger.log(
          "ChooseSlotController error at getAvailableSlot: ${e.toString()}");
    } finally {
      if(!isError) {
        change(null, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }

    }
  }

  void logout() {
    PrefUtils.clearPreferencesData();
    Map<String, bool> arg = {"timeOut": true};
    Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
  }

  // void nextPaymentScreen() {Get.toNamed(AppRoutes.paymentScreen );}
  Future<void> nextPaymentScreen() async {
    change(null, status: RxStatus.loading());

    try {
      if (listSelected.contains(true)) {
        List<Map<String, String>> listSlot = [];
        List<SlotModel> listSlotBooking = List.empty(growable: true);
        for (int i = 0; i < listSelected.length; i++) {
          if (listSelected[i]) {
            listSlotBooking.add(slotList[i]);
            Map<String, String> body = {
              "refSubCourt": subCourtID,
              "refSlot": slotList[i].id,
              // "playDate": DateFormat("yyyy-MM-ddTHH:mm:ss").format(playDate.value),
              "playDate": DateFormat("yyyy-MM-dd").format(playDate.value),
            };
            listSlot.add(body);
            print(body.toString());
          }
        }
        await ApiClient.createNewBooking(listSlot).then((result) {
          print('createNewBooking statusCode: ${result.statusCode}');
          if (result.statusCode == 201) {
            var jsonResult = jsonDecode(result.body);
            List<BookingModel> listBooking =
                BookingModel.listFromJson(jsonResult["result"]);

            PaymentModel paymentModel =
                PaymentModel(listBooking, listSlotBooking);

            Map<String, dynamic> arg = {
              "courtId": courtId,
              "paymentModel": paymentModel,
            };
            Get.toNamed(AppRoutes.paymentScreen, arguments: arg);
          } else if (result.statusCode == 400) {
            String errorMessage = jsonDecode(result.body)["Message"];
            Get.defaultDialog(
                barrierDismissible: false,
                title: "Cannot booking!",
                content: Container(
                  padding: getPadding(all: 20),
                  height: getVerticalSize(250),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(errorMessage,
                            style: AppStyle.txtManropeMedium14),
                      ),
                      Padding(
                        padding: getPadding(top: 15),
                        child: CustomButton(
                          height: 50,
                          width: 220,
                          text: "lbl_back".tr,
                          margin: getMargin(
                            top: 10,
                          ),
                          fontStyle: ButtonFontStyle.ManropeBold14,
                          variant: ButtonVariant.FillGray300,
                          onTap: () async {
                            getBack();
                            await getAvailableSlot();
                          },
                        ),
                      ),
                    ],
                  ),
                ));
          } else if (result.statusCode == 401 || result.statusCode == 403) {
            logout();
          }   else if (result.statusCode == 500){
            print('error 500: ${result.body}');
          } else {
            "ChooseSlotController error at nextPaymentScreen: ${result.statusCode} \n ${result.body}";
          }
        });
      }
    } on Exception catch (e) {
      Logger.log(
          "ChooseSlotController error at nextPaymentScreen: ${e.toString()}");
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  getBack() {
    Get.back();
  }

  void validateSlot(String strPlayDate) {
    DateTime now = DateTime.now();
    String strNow = DateFormat("yyyy-MM-dd").format(now);
    if (strPlayDate == strNow) {
      for (int i = 0; i < slotList.length; i++) {
        if (now.hour > slotList[i].startTime.hour) {
          slotList[i].isActive = false;
        } else if (now.hour == slotList[i].startTime.hour) {
          if (now.minute > slotList[i].startTime.minute) {
            slotList[i].isActive = false;
          }
        }
      }
    }
    slotList.refresh();
  }
}

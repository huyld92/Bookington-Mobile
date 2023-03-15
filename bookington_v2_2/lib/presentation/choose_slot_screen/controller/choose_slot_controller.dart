import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/booking_model.dart';
import 'package:bookington_v2_2/data/models/slot_model.dart';
import 'package:bookington_v2_2/presentation/profile_screen/controller/profile_controller.dart';
import 'package:flutter/cupertino.dart';

class ChooseSlotController extends GetxController with StateMixin {
  late RxList<bool> listSelected = <bool>[].obs;

  RxList<SlotModel> slotList = <SlotModel>[].obs;
  String courtID = "";
  RxString courtName = "".obs;
  RxString playDate = "".obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() {
    change(null, status: RxStatus.loading());

    try {

      Map<String, String> arg = Get.arguments;
      if (arg["id"] != null) {
        courtID = arg["id"]!;
        courtName.value = arg["name"]!;
        playDate.value = arg["playDate"]!;
        getAvailableSlot();
      } else {
        getBack();
      }
      change(null, status: RxStatus.success());

      Future.delayed(const Duration(milliseconds: 1000), () {
        change(null, status: RxStatus.success());
      });
    } catch (e) {
      e.printError();
     }
   }

  void selectSlot(int index) {
    listSelected[index] = !listSelected[index];
    // listSelected.value = listSelected;
    listSelected.refresh();
  }

  void getAvailableSlot() {
    try {
      ApiClient.getAvailableSlot(courtID, playDate.value).then((result) {
        print('statusCode: ${result.statusCode}');
        if (result.statusCode == 200) {
          var jsonResult = jsonDecode(result.body);
          slotList.value =
              SlotModel.listFromJson(jsonResult["result"]["slots"]);
          listSelected.value = RxList.filled(slotList.length, false);
          slotList.refresh();
          listSelected.refresh();
        } else if(result.statusCode == 401 || result.statusCode == 403){
          ProfileController profileController = Get.find();
          Map<String, bool> arg = {"timeOut": true};
          profileController.logout(arg);
        } else {
          print(result.headers);
        }
      });
    } catch (error) {
      print("Choose slot: " + error.toString());
    }
  }

  void nextPaymentScreen() {
    if (listSelected.contains(true)) {
      List<Map<String, String>> listSlotBooking = [];
      for (int i = 0; i < listSelected.length; i++) {
        if (listSelected[i]) {
          Map<String, String> body = {
            "refSlot": slotList[i].id,
            "playDate": playDate.value
          };
          listSlotBooking.add(body);
        }
      }
      print('listBooking: $listSlotBooking');

      ApiClient.createNewBooking(listSlotBooking)
          .then((result) {
        print('createNewBooking statusCode: ${result.statusCode}');
        if (result.statusCode == 201) {
          var jsonResult = jsonDecode(result.body);
          List<BookingModel> listBooking =
              BookingModel.listFromJson(jsonResult["result"]);
           Map<String,dynamic> arg = {
            "listBooking":listBooking,
          };
          print('listBooking: $listBooking');
          Get.toNamed(AppRoutes.paymentScreen,arguments: arg);
        } else if(result.statusCode == 401 || result.statusCode == 403){
          ProfileController profileController = Get.find();
          Map<String, bool> arg = {"timeOut": true};

          profileController.logout(arg);
        } else if(result.statusCode == 500){
          print('error 500');
          Get.defaultDialog(title: "Error 500", content: Text("This slot cannot be selected"));
        } else {
          print(result.headers);
        }
      });
    }
  }

  getBack() {
    print("choose slot back");
    Get.back();
  }
}

import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/voucher_model.dart';
import 'package:flutter/cupertino.dart';

class VoucherController extends GetxController with StateMixin {
  TextEditingController voucherController = TextEditingController();
  RxList<VoucherModel> listVoucherMode =  [VoucherModel.empty()].obs;
  RxString selectedVoucher = "".obs;
  String courtId = "";

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  @override
  void onClose() {
    voucherController.dispose();
    super.onClose();
  }

  Future<void> loadData() async {
    Map<String, String> arg = Get.arguments;
    if (arg["courtId"] != null) {
      courtId = arg["courtId"]!;
      selectedVoucher.value = arg['voucherId']!;
    }
     await getAllVoucherOfCourt();
  }

  Future<void> getAllVoucherOfCourt() async {
    change(null, status: RxStatus.loading());
    try {
      await ApiClient.getAllVoucherOfCourt(courtId).then((result) {
        if (result.statusCode == 200) {
          listVoucherMode.value =
              VoucherModel.listFromJson(jsonDecode(result.body)["result"]);
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Logger.log(
              "VoucherController error at getAllVoucherOfCourt: ${result.statusCode}");
        }
      });
    } on Exception catch (e) {
      Logger.log(
          "VoucherController error at getAllVoucherOfCourt: ${e.toString()}");
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  void getBack() {
    VoucherModel voucher = VoucherModel.empty();
    if (selectedVoucher.value != "-1") {
       for(VoucherModel v in listVoucherMode){
        if(v.id == selectedVoucher.value){
          voucher = v;
          break;
        }
      }
    }
    Map<String, dynamic> backValue = {
      'voucher': voucher,
    };
     Get.back(result: backValue);
  }

  void changeVoucher(int index) {
    if (selectedVoucher.value == listVoucherMode[index].id) {
      selectedVoucher.value = "-1";
    } else {
      selectedVoucher.value = listVoucherMode[index].id;
    }
  }

  void logout() {
    PrefUtils.clearPreferencesData();
    Map<String, bool> arg = {"timeOut": true};
    Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
  }
}

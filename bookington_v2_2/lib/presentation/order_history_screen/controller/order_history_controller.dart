import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/order_model.dart';
import 'package:bookington_v2_2/presentation/order_history_screen/models/order_history_model.dart';

class OrderHistoryController extends GetxController
    with ScrollMixin, StateMixin {
  RxList<OrderHistoryModel> listOrderHistory = RxList.empty();
  int pageNumber = 1;
  int totalOrder = 0;

  @override
  void onInit() {
    loadData();

    super.onInit();
  }

  void loadData() {
    getOrderHistory(1);
  }

  Future<void> getOrderHistory(int pageNumber) async {
    if (pageNumber == 1) {
      change(null, status: RxStatus.loading());
    }
    if (pageNumber == 0) {
      this.pageNumber = 1;
      pageNumber = 1;
    }
    try {
      int maxPageSize = 6;
      String userId = PrefUtils.getString("userID") ?? "";
      await ApiClient.getOrderHistory(userId, pageNumber, maxPageSize)
          .then((result) {
        if (result.statusCode == 200) {
          var jsonResult = jsonDecode(result.body);
          totalOrder = jsonResult["pagination"]["totalCount"];
          if (totalOrder == 0) {
            listOrderHistory.clear();
          } else {
            if (pageNumber == 1) {
              List<OrderModel> listOrderModel =
                  OrderModel.listFromJson(jsonResult["result"]);
              listOrderHistory.value =
                  OrderHistoryModel.listFromListObject(listOrderModel);
            } else {
              List<OrderModel> listOrderModel =
                  OrderModel.listFromJson(jsonResult["result"]);
              listOrderHistory
                  .addAll(OrderHistoryModel.listFromListObject(listOrderModel));
            }
          }
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Logger.log(
              "OrderHistoryController error at getOrderHistory: ${result.statusCode}, \n${result.body}");
        }
      });
    } catch (e) {
      Logger.log(
          "OrderHistoryController ERROR at getOrderHistory: ${e.toString()}");
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  void logout() {
    PrefUtils.clearPreferencesData();
    Map<String, bool> arg = {"timeOut": true};
    Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
  }

  void getBack() {
    Get.back();
  }

  @override
  Future<void> onEndScroll() async {
    change(null, status: RxStatus.loadingMore());
    if (listOrderHistory.length < totalOrder) {
      pageNumber++;
      await getOrderHistory(pageNumber);
    }
  }

  @override
  Future<void> onTopScroll() async {}

  void orderDetailScreen(int index) {
    Map<String, dynamic> arg = {"orderDetails": listOrderHistory[index]};
    Get.toNamed(AppRoutes.orderDetailsScreen, arguments: arg)
        ?.then((value) => loadData());
  }
}

import 'dart:convert';
import 'dart:typed_data';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/core/utils/map_utils.dart';
import 'package:bookington_v2_2/core/utils/notify.dart';
import 'package:bookington_v2_2/core/utils/signalr_connection.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/account_model.dart';
import 'package:bookington_v2_2/data/models/notification_model.dart';
import 'package:bookington_v2_2/main.dart';
import 'package:bookington_v2_2/presentation/home_screen/models/home_court_item_model.dart';
import 'package:bookington_v2_2/presentation/home_screen/models/home_model.dart';
import 'package:bookington_v2_2/presentation/search_screen/models/query_model.dart';
import 'package:bookington_v2_2/presentation/search_screen/models/search_model.dart';

import '../../../core/utils/deeplink_controller.dart';

class HomeController extends GetxController with StateMixin {
  late Rx<HomeModel> homeModelObj = HomeModel.empty().obs;
  RxInt totalUnread = 0.obs;

  // Rx<Uint8List> bytesImage = Uint8List(0).obs;

  @override
  void onInit() async {
    loadData();
    Get.put(SignalrConnection()).startConnection();
    Notify.initialize(flutterLocalNotificationsPlugin);
    super.onInit();
  }

  loadData() async {
    change(null, status: RxStatus.loading());
    final DeepLinkController deepLinkController = Get.find();
    if (deepLinkController.link.isNotEmpty) {
      deepLinkController.handleLink(deepLinkController.link);
      return;
    }
    await getProfile();
    await queryNotifications();
    await searchByName();

    // try {
    //   bytesImage.value = const Base64Decoder()
    //       .convert(homeModelObj.value.accountModel.imgBase);
    // } on Exception catch (e) {
    //   Logger.log("HomeController error at loadData: ${e.toString()}");
    // }
    change(null, status: RxStatus.success());
  }

  queryNotifications() async {
    try {
      change(null, status: RxStatus.loading());
      String userID = PrefUtils.getString("userID") ?? "null";
      int pageNumber = 1;
      int maxPageSize = 20;
      await ApiClient.queryNotifications(userID, pageNumber, maxPageSize)
          .then((result) {
        if (result.statusCode == 200) {
          var jsonResult = jsonDecode(result.body);
          List<NotificationModel> listNotification =
              NotificationModel.listFromJson(jsonResult["result"]);
          homeModelObj.value.listNotification = listNotification;
          totalUnread.value =
              listNotification.where((notify) => notify.isRead == false).length;
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Logger.log("queryNotifications: ${result.statusCode}");
        }
      });
    } on Exception catch (e) {
      Logger.log(e);
    } finally {
      change(null, status: RxStatus.loading());
    }
  }

  void checkLogin() {
    try {
      if (PrefUtils.getAccessToken() == null) {
        Get.toNamed(AppRoutes.loginScreen);
      } else {
        String? fullName = PrefUtils.getString("fullName") ?? "null";
        homeModelObj.value.accountModel.fullName = fullName;
      }
    } on Exception catch (e) {
      Logger.log(e);
    }
  }

  void notificationScreen() {
    Map<String, dynamic> arg = {
      "listNotification": homeModelObj.value.listNotification
    };
    Get.toNamed(AppRoutes.notificationScreen, arguments: arg)?.then((value) {
      loadData();
    });
  }

  Future<void> getProfile() async {
    change(null, status: RxStatus.loading());
    try {
      if (PrefUtils.getString("sysToken") == null) {
        Get.offAllNamed(AppRoutes.loginScreen);
      } else {
        String sysToken = PrefUtils.getAccessToken() ?? "-1";
        await ApiClient.getProfile(sysToken).then(
          (result) {
            if (result.statusCode == 200) {
              final jsonResult = (jsonDecode(result.body)["result"]);

              AccountModel accountModel = AccountModel.fromJson(jsonResult);
              homeModelObj.value.accountModel = accountModel;
            } else if (result.statusCode == 401 || result.statusCode == 403) {
              logout();
            } else {
              Logger.log(
                  "HomeController error at getProfile: ${result.statusCode}");
            }
          },
        );
      }
    } on Exception catch (e) {
      Logger.log("HomeController error at getProfile: ${e.toString()}");
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  void goRecommendScreen() {
    // Get.toNamed(AppRoutes.recommendScreen);
  }

  courtDetailsScreen(int index) {
    Map<String, dynamic> arg = {
      "courtId": homeModelObj.value.homeCourtItemList[index].id,
      "playDate": DateTime.now(),
      "playTime": DateTime.now(),
    };
    Get.toNamed(AppRoutes.courtDetailsScreen, arguments: arg);
  }

  void logout() async {
    PrefUtils.clearPreferencesData();
    Map<String, bool> arg = {"timeOut": true};
    Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
  }

  Future<void> searchByName() async {
    // Map<String, String?> positionAddress = await getPosition();

    int pageNumber = 1;
    int maxPageSize = 3;
    QueryModel queryModel = QueryModel(
        searchText: "",
        district: "",
        province: "",
        playDate: "",
        playTime: "",
        pageNumber: pageNumber,
        maxPageSize: maxPageSize);

    try {
      await ApiClient.searchCourt(pageNumber, maxPageSize, queryModel)
          .then((result) {
        if (result.statusCode == 200) {
          final jsonResult = jsonDecode(result.body);
          homeModelObj.value.homeCourtItemList =
              HomeCourtItemModel.listFromJson(jsonResult["result"]).obs;
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Logger.log(
              "HomeController error at searchByName: ${result.statusCode}");
        }
      });
    } on Exception catch (e) {
      Logger.log("HomeController error at searchByName: ${e.toString()}");
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  Future<Map<String, String?>> getPosition() async {
    Map<String, String?> positionAddress = {
      "districtName": "Choose district",
      "provinceName": "Choose province",
    };
    positionAddress = await MapUtils.getCurrentPosition();
    if (positionAddress["districtName"] == null) {
      positionAddress["districtName"] = "";
      positionAddress["provinceName"] = "";
    }
    return positionAddress;
  }
}

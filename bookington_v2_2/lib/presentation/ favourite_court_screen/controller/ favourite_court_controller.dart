// ignore_for_file: file_names

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/%20favourite_court_screen/model/favorite_model.dart';
import 'package:intl/intl.dart';

class FavouriteCourtController extends GetxController {
  RxList listFavoriteMode = <FavoriteModel>[].obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() {
    listFavoriteMode.add(FavoriteModel("1", "PHu", 4.9, "Quận 11",
        "123 Lý Thường Kiệt", 10000, 5, DateFormat("hh:mm").parse("12:00"),
        DateFormat("hh:mm").parse("13:00")));
    listFavoriteMode.add(FavoriteModel("1", "PHu", 4.9, "Quận 11",
        "123 Lý Thường Kiệt", 10000, 5, DateFormat("hh:mm").parse("12:00"),
        DateFormat("hh:mm").parse("13:00")));

    listFavoriteMode.add(FavoriteModel("1", "PHu", 4.9, "Quận 11",
        "123 Lý Thường Kiệt", 10000, 5, DateFormat("hh:mm").parse("12:00"),
        DateFormat("hh:mm").parse("13:00")));

    listFavoriteMode.add(FavoriteModel("1", "PHu", 4.9, "Quận 11",
        "123 Lý Thường Kiệt", 10000, 5, DateFormat("hh:mm").parse("12:00"),
        DateFormat("hh:mm").parse("13:00")));
    listFavoriteMode.add(FavoriteModel("1", "PHu", 4.9, "Quận 11",
        "123 Lý Thường Kiệt", 10000, 5, DateFormat("hh:mm").parse("12:00"),
        DateFormat("hh:mm").parse("13:00")));
  }

  void courtDetailsScreen(int index) {
    Map<String, String> arg = {
      "courtId": listFavoriteMode[index].id,
    };
    // PrefUtils.setString("courtId", listSearchMode[index].id);
    Get.toNamed(AppRoutes.courtDetailsScreen, arguments: arg);
  }

  void getBack() {
    Get.back();
  }
}

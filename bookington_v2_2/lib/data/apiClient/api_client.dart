// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/core/utils/app_url.dart';
import 'package:bookington_v2_2/data/models/comment_rating_model.dart';
import 'package:bookington_v2_2/data/models/court_model.dart';
import 'package:bookington_v2_2/data/models/notification_model.dart';
import 'package:bookington_v2_2/data/models/report_model.dart';
import 'package:bookington_v2_2/presentation/search_screen/models/query_model.dart';
import 'package:http/http.dart' as http;

class ApiClient extends GetConnect {
  late String token = "";

  ApiClient();

  static Future<List<CourtModel>> fetchCourt() async {
    http.Response response = await http.get(Uri.parse(AppUrl.courtEndPoint));

    var responseJson = json.decode(response.body);
    return (responseJson['result'] as List)
        .map((p) => CourtModel.fromJson(p))
        .toList();
  }

  static Future<http.Response> loginWithPhone(
      String phone, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var url = Uri.parse(AppUrl.loginEndPoint);
    Map body = {'phone': phone, 'password': password};
    http.Response response =
        await http.post(url, body: jsonEncode(body), headers: headers);
    return response;
  }

  static Future<http.Response> register(
      String phone, String password, fullName) async {
    var headers = {'Content-Type': 'application/json'};
    var url = Uri.parse(AppUrl.signUpEndPoint);
    Map body = {'phone': phone, 'password': password, 'fullName': fullName};

    http.Response response =
        await http.post(url, headers: headers, body: jsonEncode(body));

    return response;
  }

  static Future<http.Response> forgotPasswordVerify(String phone) async {
    var url =
        Uri.parse("${AppUrl.forgotPasswordVerifyEndPoint}?phoneNumber=$phone");

    http.Response response = await http.post(url);
    return response;
  }

  static Future<http.Response> forgotPasswordVerifyOtp(
      String phone, String otp) async {
    var url = Uri.parse(
        "${AppUrl.forgotPasswordVerifyOtpEndPoint}?phoneNumber=$phone&otp=$otp");

    http.Response response = await http.post(url);
    return response;
  }

  static Future<http.Response> updateNewPassword(
      String phone, String newPassword) async {
    var url = Uri.parse(
        "${AppUrl.updateNewPasswordEndPoint}?phoneNumber=$phone&newPassword=$newPassword");

    http.Response response = await http.post(url);
    return response;
  }

  static Future<dynamic> verifyOtp(String phone, String otp) async {
    String body = "?phoneNumber=$phone&otp=$otp";
    var url = Uri.parse(AppUrl.verifyEndPoint + body);
    // Map body = {'phoneNumber': phone, 'otp': otp};
    http.Response response = await http.put(url);
    // http.Response response = await http.put(url);

    print(response.statusCode);
    return response;
  }

  static Future<http.Response> resendOtp(String phone) async {
    var url = Uri.parse('${AppUrl.resendOtpEndPoint}?phone=$phone');
    http.Response response = await http.get(url);

    return response;
  }

  static Future<http.Response> sendOtp(String phone) async {
    var url = Uri.parse('${AppUrl.sendOtpEndPoint}$phone');
    http.Response response = await http.post(url);

    return response;
  }

  static Future<http.Response> getProfile(String sysToken) async {
    var headers = {'Authorization': 'Bearer $sysToken'};
    var url = Uri.parse(AppUrl.getProfileByIDEndPoint);
    http.Response response = await http.get(url, headers: headers);
    return response;
  }

  static Future<http.Response> searchCourt(
      int pageNumber, int maxPageSize, QueryModel searchValue) async {
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> header = {
      "Authorization": "Bearer $sysToken",
    };
    var url = Uri.parse(
        "${AppUrl.searchCourtEndPoint}?SearchText=${searchValue.searchText}&District="
        "${searchValue.district}&PlayDate=${searchValue.playDate}&PlayTime="
        "${searchValue.playTime}&PageNumber=$pageNumber&MaxPageSize=$maxPageSize");
    http.Response response = await http.get(url, headers: header);
    return response;
  }

  static Future<http.Response> reportCourt(
      String courtId, String reportContent) async {
    String? sysToken = PrefUtils.getAccessToken();
    var headers = {
      'Authorization': 'Bearer $sysToken',
      'Content-Type': 'application/json'
    };
    var url = Uri.parse(AppUrl.reportCourtEndPoint);
    Map body = {'refCourt': courtId, 'content': reportContent};
    http.Response response =
        await http.post(url, body: jsonEncode(body), headers: headers);

    return response;
  }

  static Future<http.Response> getAllProvince() async {
    var url = Uri.parse(AppUrl.getAllProvinceEndPoint);
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> header = {
      "Authorization": "Bearer $sysToken",
    };
    http.Response response = await http.get(url, headers: header);

    return response;
  }

  static Future<http.Response> getDistrictById(String id) async {
    var url = Uri.parse("${AppUrl.getDistrictByIdProvinceEndPoint}?id=$id");
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> header = {
      "Authorization": "Bearer $sysToken",
    };
    http.Response response = await http.get(url, headers: header);

    return response;
  }

  static Future<http.Response> getCourtDetails(String id) async {
    var url = Uri.parse(AppUrl.getCourtDetailsEndPoint + id);
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> header = {
      "Authorization": "Bearer $sysToken",
    };
    http.Response response = await http.get(url, headers: header);

    return response;
  }

  static Future<http.Response> updateProfile(
      String userID, String fullName, String date, String description) async {
    var url = Uri.parse(AppUrl.updateProfile + userID);
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> header = {
      "Authorization": "Bearer $sysToken",
      "Content-Type": "application/json",
    };
    Map<String, String> body = {
      "fullName": fullName,
      "dateOfBirth": date,
      "description": description
    };
    http.Response response =
        await http.put(url, body: jsonEncode(body), headers: header);

    return response;
  }

  static Future<http.Response> getTransactionHistory(
      int pageNumber, int maxPageSize) async {
    var url = Uri.parse(
        "${AppUrl.getTransactionEndPoint}?PageNumber=$pageNumber&MaxPageSize=$maxPageSize");
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> header = {
      "Authorization": "Bearer $sysToken",
    };
    http.Response response = await http.get(url, headers: header);

    return response;
  }

  static Future<http.Response> getAvailableSubCourt(
      String courtId, String playDate, String startTime) async {
    var url = Uri.parse(
        "${AppUrl.getAvailableSubCourtEndPoint}?CourtId=$courtId&PlayDate=$playDate&StartTime=$startTime&EndTime=23:59:59.0000000");
    String? sysToken = PrefUtils.getAccessToken();

    Map<String, String> headers = {
      "Authorization": "Bearer $sysToken",
      'Content-Type': 'application/json',
    };

    Map<String, String> body = {
      "courtId": courtId,
      "playDate": playDate,
      "startTime": startTime,
      "endTime": "23:59:59.0000000"
    };
    print('body choose court: $body');

    http.Response response = await http.get(url, headers: headers);

    return response;
  }

  static Future<http.Response> getAvailableSlot(
      String subCourtId, String playDate) async {
    var url = Uri.parse(
        "${AppUrl.getAvailableSlotEndPoint}?SubCourtId=$subCourtId&PlayDate=$playDate");
    String? sysToken = PrefUtils.getAccessToken();

    Map<String, String> headers = {
      "Authorization": "Bearer $sysToken",
      'Content-Type': 'application/json',
    };

    http.Response response = await http.get(url, headers: headers);

    return response;
  }

  static Future<http.Response> createNewBooking(
      List<Map<String, String>> listSlotBooking) async {
    var url = Uri.parse(AppUrl.createNewBookingEndPoint);
    String? sysToken = PrefUtils.getAccessToken();

    Map<String, String> headers = {
      "Authorization": "Bearer $sysToken",
      'Content-Type': 'application/json',
    };

    http.Response response = await http.post(url,
        body: jsonEncode(listSlotBooking), headers: headers);

    return response;
  }

  static Future<http.Response> queryNotifications(
      String userID, int pageNumber, int maxPageSize) async {
    var url = Uri.parse(
        "${AppUrl.queryNotificationsEndPoint}?UserId=$userID&PageNumber=$pageNumber&MaxPageSize=$maxPageSize");
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> headers = {
      "Authorization": "Bearer $sysToken",
      'Content-Type': 'application/json',
    };

    http.Response response = await http.get(url, headers: headers);

    return response;
  }

  static Future<http.Response> markAllAsRead(
      List<Map<String, String>> listNotification) async {
    var url = Uri.parse(AppUrl.markAllAsReadEndPoint);
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> headers = {
      "Authorization": "Bearer $sysToken",
      'Content-Type': 'application/json',
    };

    http.Response response = await http.put(url,
        body: jsonEncode(listNotification), headers: headers);

    return response;
  }

  static Future<http.Response> getAllVoucherOfCourt(String courtID) async {
    var url =
        Uri.parse("${AppUrl.getAllVoucherOfCourtEndPoint}?courtId=$courtID");
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> headers = {
      "Authorization": "Bearer $sysToken",
      'Content-Type': 'application/json',
    };

    http.Response response = await http.get(url, headers: headers);

    return response;
  }

  static Future<http.Response> getBalance() async {
    var url = Uri.parse(AppUrl.getBalanceEndPoint);
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> headers = {
      "Authorization": "Bearer $sysToken",
      'Content-Type': 'application/json',
    };

    http.Response response = await http.get(url, headers: headers);

    return response;
  }

  static Future<http.Response> changePassword(String userId, String oldPassword,
      String newPassword, String confirmPassword) async {
    var url = Uri.parse(AppUrl.changePasswordEndPoint);
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> headers = {
      "Authorization": "Bearer $sysToken",
      'Content-Type': 'application/json',
    };
    Map<String, String> body = {
      "userId": userId,
      'oldPassword': oldPassword,
      'newPassword': newPassword,
      'confirmPassword': confirmPassword,
    };

    http.Response response =
        await http.put(url, headers: headers, body: jsonEncode(body));

    return response;
  }

  static Future<http.Response> checkout(
      String voucherCode, String orderId) async {
    var url = Uri.parse(AppUrl.checkoutEndPoint);
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> headers = {
      "Authorization": "Bearer $sysToken",
      'Content-Type': 'application/json',
    };
    Map<String, String> body = {
      "voucherCode": voucherCode,
      'orderId': orderId,
    };

    http.Response response =
        await http.post(url, headers: headers, body: jsonEncode(body));

    return response;
  }

  static Future<http.Response> momo() async {
    var url = Uri.parse(
        "momo://app?action=payWithApp&isScanQR=false&serviceType=app&sid=TU9NTzVSR1gyMDE5MTEyOHxjZGQ1NGM0ZS0zOTYzLTRmOTUtOTA3OC0zZDI4MWJkNzM4ZmM&v=2.3");
    // String? sysToken = PrefUtils.getAccessToken();
    // Map<String, String> headers = {
    //   "Authorization": "Bearer $sysToken",
    //   'Content-Type': 'application/json',
    // };

    http.Response response = await http.post(url);

    return response;
  }

  static Future<http.Response> getIncomingBookings(
      int pageNumber, int maxPageSize) async {
    var url = Uri.parse(
        "${AppUrl.getIncomingBookings}?PageNumber=$pageNumber&MaxPageSize=$maxPageSize");
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> headers = {
      "Authorization": "Bearer $sysToken",
      'Content-Type': 'application/json',
    };

    http.Response response = await http.get(url, headers: headers);

    return response;
  }

  static Future<http.Response> topUpAmount(
      String amount, String orderInfo) async {
    var url = Uri.parse(AppUrl.topUpEndPoint);
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> headers = {
      "Authorization": "Bearer $sysToken",
      'Content-Type': 'application/json',
    };
    Map<String, String> body = {
      "amount": amount,
      'orderInfo': orderInfo,
    };
    http.Response response =
        await http.post(url, body: jsonEncode(body), headers: headers);

    return response;
  }

  static Future<http.Response> getFinishedBookings(
      int pageNumber, int maxPageSize) async {
    var url = Uri.parse(
        "${AppUrl.getFinishedBookings}?PageNumber=$pageNumber&MaxPageSize=$maxPageSize");
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> headers = {
      "Authorization": "Bearer $sysToken",
      'Content-Type': 'application/json',
    };

    http.Response response = await http.get(url, headers: headers);

    return response;
  }

  static Future<http.Response> createComment(
      CommentRatingModel commentRatingModel) async {
    var url = Uri.parse(AppUrl.postComment);
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> headers = {
      "Authorization": "Bearer $sysToken",
      'Content-Type': 'application/json',
    };
    Map<String, String> body = {
      "commentWriterId": commentRatingModel.commentWriterId,
      "refCourt": commentRatingModel.refCourt,
      "content": commentRatingModel.content,
      "rating": commentRatingModel.rating.toString(),
    };
    http.Response response =
        await http.post(url, body: jsonEncode(body), headers: headers);

    return response;
  }

  static Future<http.Response> queryComment(
      String courtId, int pageNumber, int maxPage) async {
    var url = Uri.parse(
        "${AppUrl.getListCommentsEndPoint}?CourtId=$courtId&PageNumber=$pageNumber&MaxPageSize=$maxPage");
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> headers = {
      "Authorization": "Bearer $sysToken",
      'Content-Type': 'application/json',
    };
    http.Response response = await http.get(url, headers: headers);

    return response;
  }

  static Future<http.Response> getOrderHistory(
      String userId, int pageNumber, int maxPage) async {
    var url = Uri.parse(
        "${AppUrl.getOrderHistoryEndPoint}?UserId=$userId&PageNumber=$pageNumber&MaxPageSize=$maxPage");
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> headers = {
      "Authorization": "Bearer $sysToken",
      'Content-Type': 'application/json',
    };
    http.Response response = await http.get(url, headers: headers);

    return response;
  }

  static Future<http.Response> cancelOrder(String orderId) async {
    var url = Uri.parse("${AppUrl.cancelOrderEndPoint}?orderId=$orderId");
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> headers = {
      "Authorization": "Bearer $sysToken",
      'Content-Type': 'application/json',
    };
    http.Response response = await http.post(url, headers: headers);

    return response;
  }
}

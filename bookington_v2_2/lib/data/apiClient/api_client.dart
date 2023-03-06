import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/core/utils/app_url.dart';
import 'package:bookington_v2_2/data/models/court_model.dart';
import 'package:bookington_v2_2/data/models/report_model.dart';
import 'package:bookington_v2_2/presentation/search_page/models/search_model.dart';
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

  static Future<dynamic> loginWithPhone(String phone, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var url = Uri.parse(AppUrl.loginEndPoint);
    Map body = {'phone': phone, 'password': password};
    http.Response response =
        await http.post(url, body: jsonEncode(body), headers: headers);

    print(response.statusCode);

    if (response.statusCode == 200) {
      final jsonResult = jsonDecode(response.body);
      if (!jsonResult['isError']) {
        return jsonResult;
      } else {
        final jsonResult = jsonDecode(response.body);
        return jsonResult;
      }
    } else {
      return jsonDecode(response.body);
    }
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

  static Future<http.Response> sendSms(String phone) async {
    var url = Uri.parse(AppUrl.smsEndPoint + phone);

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
    var url = Uri.parse('${AppUrl.resendOtpEndPoint}?phone=${phone}');
    http.Response response = await http.get(url);

    return response;
  }

  static Future<http.Response> getProfile(String sysToken) async {
    var headers = {'Authorization': 'Bearer $sysToken'};
    var url = Uri.parse(AppUrl.getProfileByIDEndPoint);
    http.Response response = await http.get(url, headers: headers);
    return response;
  }

  static Future<http.Response> searchCourt(
      int pageNumber, SearchModel searchValue) async {
    int maxPageSize = 5;
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> header = {
      "Authorization": "Bearer $sysToken",
    };
    var url = Uri.parse(
        "${AppUrl.searchCourtEndPoint}?SearchText=${searchValue.name}&District=${searchValue.districtName}&PageNumber=$pageNumber&MaxPageSize=$maxPageSize");
    http.Response response = await http.get(url, headers: header);

    return response;
  }

  static Future<dynamic> reportCourt(
      String reportUrl, ReportModel reportModel) async {
    String? sysToken = PrefUtils.getAccessToken();
    if (sysToken != null && sysToken.isNotEmpty) {
      var headers = {
        'Authorization': 'Bearer $sysToken',
        'Content-Type': 'application/json'
      };
      var url = Uri.parse(AppUrl.verifyEndPoint);
      Map body = {
        'refCourt': reportModel.refCourt,
        'content': reportModel.content
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      print(body.toString());
      if (response.statusCode == 201) {
        final jsonResult = jsonDecode(response.body);
        print("result ${jsonResult["result"]}");
        return jsonResult;
      } else {
        print(response.statusCode);
      }
    }
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
      String userID, String fullName, String date) async {
    var url = Uri.parse(AppUrl.updateProfile + userID);
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> header = {
      "Authorization": "Bearer $sysToken",
      "Content-Type": "application/json",
    };
    Map<String, String> body = {"fullName": fullName, "dateOfBirth": date};
    http.Response response =
        await http.put(url, body: jsonEncode(body), headers: header);

    return response;
  }

  static Future<http.Response> getTransactionHistory() async {
    var url = Uri.parse(AppUrl.getTransactionEndPoint);
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> header = {
      "Authorization": "Bearer $sysToken",
    };
    http.Response response = await http.get(url, headers: header);

    return response;
  }

  static Future<http.Response> getAvailableSubCourt(
      String courtId, String playDate, String startTime) async {
    var url = Uri.parse(AppUrl.getAvailableSubCourtEndPoint);
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
    print('body choose court: ${body}');

    http.Response response =
        await http.post(url, body: jsonEncode(body), headers: headers);

    return response;
  }

  static Future<http.Response> getAvailableSlot(
      String subCourtId, String playDate) async {
    var url = Uri.parse('${AppUrl.getAvailableSlotEndPoint}');
    String? sysToken = PrefUtils.getAccessToken();

    Map<String, String> headers = {
      "Authorization": "Bearer $sysToken",
      'Content-Type': 'application/json',
    };

    Map<String, String> body = {
      "subCourtId": subCourtId,
      "playDate": playDate,
    };
    print('urlL: ${body}');

    http.Response response =
        await http.post(url, body: jsonEncode(body), headers: headers);

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
}

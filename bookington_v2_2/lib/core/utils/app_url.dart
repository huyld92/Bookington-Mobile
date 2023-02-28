
class AppUrl {
  static const String baseUrl = "https://10.0.2.2:7179";

  static const String loginEndPoint = "$baseUrl/auth/login";

  static const String smsEndPoint =  "$baseUrl/sms/sent/";

  static const String verifyEndPoint =  "$baseUrl/accounts/verify";

  static const String signUpEndPoint=  "$baseUrl/accounts/signUp";

  static const String updateProfile=  "$baseUrl/accounts/";

  static const String searchCourtEndPoint=  "$baseUrl/courts/query";

  static const String reportEndPoint=  "$baseUrl/reports/courtreports";

  static const String courtEndPoint=  "$baseUrl/courts";

  static const String getAllProvinceEndPoint=  "$baseUrl/province/getAll/";

  static const String getDistrictByIdProvinceEndPoint=  "$baseUrl/districts/province";

  static const String getProfileByIDEndPoint=  "$baseUrl/accounts/profile";

  static const String getCourtDetailsEndPoint=  "$baseUrl/courts/";

}
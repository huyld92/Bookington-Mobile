
class AppUrl {
  static const String baseUrl = "https://10.0.2.2:7179";

  static const String loginEndPoint = "$baseUrl/auth/login";

  static const String smsEndPoint =  "$baseUrl/sms/sent/";

  static const String verifyEndPoint =  "$baseUrl/bookington/accounts/verify";

  static const String signUpEndPoint=  "$baseUrl/bookington/accounts/signUp";

  static const String searchCourtEndPoint=  "$baseUrl/bookington/courts/query";

  static const String reportEndPoint=  "$baseUrl/bookington/reports/courtreports";

  static const String courtEndPoint=  "$baseUrl/bookington/courts";

  static const String getAllProvinceEndPoint=  "$baseUrl/bookington/province/getAll/";

  static const String getDistrictByIdProvinceEndPoint=  "$baseUrl/bookington/districts/province";

  static const String getProfileByIDEndPoint=  "$baseUrl/bookington/accounts/profile";

  static const String getCourtDetailsEndPoint=  "$baseUrl/bookington/courts/";

}

class AppUrl {
  // static const String baseUrl = "https://bookingtonbackend.azurewebsites.net";
  static const String baseUrl = "https://10.0.2.2:7179";

  static const String loginEndPoint = "$baseUrl/auth/login";

  // static const String sendOtpEndPoint =  "$baseUrl/sms/sent/";

  static const String verifyEndPoint =  "$baseUrl/accounts/verify";

  static const String resendOtpEndPoint =  "$baseUrl/auth/resend-otp";

  static const String signUpEndPoint=  "$baseUrl/accounts/signUp";

  static const String updateProfile=  "$baseUrl/accounts/";

  static const String searchCourtEndPoint=  "$baseUrl/courts/query";

  static const String reportEndPoint=  "$baseUrl/reports/courtreports";

  static const String courtEndPoint=  "$baseUrl/courts";

  static const String getAllProvinceEndPoint=  "$baseUrl/province/getAll/";

  static const String getDistrictByIdProvinceEndPoint=  "$baseUrl/districts/province";

  static const String getProfileByIDEndPoint=  "$baseUrl/accounts/profile";

  static const String getCourtDetailsEndPoint=  "$baseUrl/courts/";

  static const String getTransactionEndPoint=  "$baseUrl/transactionhistory/self";

  static const String getAvailableSubCourtEndPoint=  "$baseUrl/bookings/subcourts/available";

  static const String getAvailableSlotEndPoint=  "$baseUrl/bookings/slots/available";

  static const String createNewBookingEndPoint=  "$baseUrl/bookings";

  static const String queryNotificationsEndPoint=  "$baseUrl/notifications";

  static const String getAllVoucherOfCourtEndPoint=  "$baseUrl/vouchers/court";

  static const String getBalanceEndPoint=  "$baseUrl/userbalances/self";

}
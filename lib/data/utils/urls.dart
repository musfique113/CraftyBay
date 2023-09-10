class Urls {
  Urls._();
  static const String _baseUrl = 'https://craftybay.teamrabbil.com/api';
  static String sendOtpToEmail(String email) => '$_baseUrl/UserLogin/$email';
  static String verifyLogin = '$_baseUrl/VerifyLogin/';

}

class Urls {
  Urls._();

  static const String _baseUrl = 'https://craftybay.teamrabbil.com/api';

  static String sendOtpToEmail(String email) => '$_baseUrl/UserLogin/$email';

  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';

  static String getCarouselSliders = "$_baseUrl/ListProductSlider";


  static String getCategories = '$_baseUrl/CategoryList';
}

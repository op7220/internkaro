class ApiConstant{
  //urls
  static const String BASE_URL = 'https://internkro.com/api/';

  //apis

  static String UPDATE_USER_URL=BASE_URL + "UpdateUser";

  static final String REGISTER = "registrationService";
  static final String LOGIN = "loginService";
  static final String FORGET_PASSWORD = "forgetPasswordService";
  static final String GET_MAIN_CATEGORIES = "getMainCategories";
  static final String GET_SUBCATEGORY = "getSubCategories";
  static final String GET_SLIDER_IMAGE = "slider";
  static final String GET_MAIN_SUB_CATEGORIES  ="getMainSubCategories";
  static final String GET_CITIES  ="get_locations_icon";
  static final String GET_ONLINE_COURSES  ="get_online_trainings_icons";
  static final String GET_JOBLIST  ="get_internship";

  // flutter build appbundle --target-platform android-arm,android-arm64,android-x64



  //webview urls
  static final String CONTACT_US_URL="https://internkro.com/contact-us";
  static final String FREQUENTLY_ASKED_QUESTION="https://internkro.com/frequently-asked-questions";
  static final String PRIVACY_POLICY="https://internkro.com/privacy-policy";
  static final String ABOUT_US="https://internkro.com/about-us";


  static String getBaseURL(String api)
  {
    return BASE_URL+api.toString();
  }
}
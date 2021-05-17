class ApiConstant{
  //urls
  static const String BASE_URL = 'https://internkro.com/api/';

  //apis

  static String UPDATE_USER_URL=BASE_URL + "UpdateUser";

  static final String LOGIN = "login";
  static final String GET_SLIDER_IMAGE = "slider";
  static final String GET_CITIES  ="get_locations_icon";
  static final String GET_JOBLIST  ="get_internship";
  static final String GET_DETAILS  ="get_internship_pofile";
  static final String GET_COURSE  ="get_online_trainings_icons";
  static final String GET_POPULAR_CATEGORIES  ="get_online_trainings";

  // flutter build appbundle --target-platform android-arm,android-arm64,android-x64



  //webview urls
  static final String CONTACT_US_URL="https://internkro.com/contact-us";
  static final String FREQUENTLY_ASKED_QUESTION="https://internkro.com/frequently-asked-questions";
  static final String PRIVACY_POLICY="https://internkro.com/privacy-policy";
  static final String ABOUT_US="https://internkro.com/about-us";
  static final String INTERNSHIP="https://internkro.com/internship";
  static final String JOBS="https://internkro.com/apply-jobs";
  static final String TRAINING="https://internkro.com";


  static String getBaseURL(String api)
  {
    return BASE_URL+api.toString();
  }
}
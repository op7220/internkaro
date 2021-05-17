import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:internkro/network/ApiConstants.dart';
import 'package:internkro/ui/detailscreen/model/details_screen_model.dart';
import 'package:internkro/ui/home/model/get_cities_model.dart';
import 'package:internkro/ui/home/model/get_course_model.dart';
import 'package:internkro/ui/home/model/get_slider_model.dart';
import 'package:internkro/ui/job_listting/model/job_listingmodel.dart';
import 'package:internkro/ui/login/model/login_model.dart';


class ApiService {
  var responseBody;

  static Future<LoginModel> login(String email,String password) async {
    final response = await http.post(ApiConstant.getBaseURL(ApiConstant.LOGIN)
        ,body: {
          "key": "4259d2281a1b3a3ffc46480aacdca0cf",
          "email": email,
          "password": password,
        });
    if (response.statusCode == 200) {
      print("response:${response.body}");
      var responseBody= jsonDecode(response.body);
      return LoginModel.fromJson(responseBody);
    } else {
      throw Exception("Api is not running");
    }
  }

  static Future<CitiesModel> getCities() async {
    final response = await http.get(ApiConstant.getBaseURL(ApiConstant.GET_CITIES));
    if (response.statusCode == 200) {
      print("response:${response.body}");
      var responseBody= jsonDecode(response.body);
      return CitiesModel.fromJson(responseBody);
    } else {
     throw Exception("Api is not running");
    }
  }

  static Future<SliderModel> getSlider() async {
    final response = await http.get(ApiConstant.getBaseURL(ApiConstant.GET_SLIDER_IMAGE));
    if (response.statusCode == 200) {
      print("response:${response.body}");
      var responseBody= jsonDecode(response.body);
      return SliderModel.fromJson(responseBody);
    } else {
     throw Exception("Api is not running");
    }
  }

  static Future<CourseModel> getCourses() async {
    final response = await http.get(ApiConstant.getBaseURL(ApiConstant.GET_POPULAR_CATEGORIES));
    if (response.statusCode == 200) {
      print("response:${response.body}");
      var responseBody= jsonDecode(response.body);
      return CourseModel.fromJson(responseBody);
    } else {
      throw Exception("Api is not running");
    }
  }

  static Future<JobListingModel> getJobList(String selectedList) async {
    final response = await http.post(ApiConstant.getBaseURL(ApiConstant.GET_JOBLIST)
    ,body: {
        "subcategory_url": selectedList,
        });
    if (response.statusCode == 200) {
      print("response:${response.body}");
      var responseBody= jsonDecode(response.body);
      return JobListingModel.fromJson(responseBody);
    } else {
      throw Exception("Api is not running");
    }
  }

  static Future<JobListingModel> getLocationList(String selectedCity) async {
    final response = await http.post(ApiConstant.getBaseURL(ApiConstant.GET_JOBLIST)
        ,body: {
          "location_url": selectedCity,
        });
    if (response.statusCode == 200) {
      print("response:${response.body}");
      var responseBody= jsonDecode(response.body);
      return JobListingModel.fromJson(responseBody);
    } else {
      throw Exception("Api is not running");
    }
  }

  static Future<JobListingModel> getPopularCategoriesList(String selectedCity) async {
    final response = await http.post(ApiConstant.getBaseURL(ApiConstant.GET_POPULAR_CATEGORIES)
        ,body: {
          "location_url": selectedCity,
        });
    if (response.statusCode == 200) {
      print("response:${response.body}");
      var responseBody= jsonDecode(response.body);
      return JobListingModel.fromJson(responseBody);
    } else {
      throw Exception("Api is not running");
    }
  }

    static Future<DetailsScreenModel> getDetails(String comany_details_url) async {
    final response = await http.post(ApiConstant.getBaseURL(ApiConstant.GET_DETAILS)
        ,body: {
          "comany_details_url": comany_details_url,
        });
    if (response.statusCode == 200) {
      print("response:${response.body}");
      var responseBody= jsonDecode(response.body);
      return DetailsScreenModel.fromJson(responseBody);
    } else {
      throw Exception("Api is not running");
    }
  }



}
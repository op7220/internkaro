import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:internkro/network/ApiConstants.dart';
import 'package:internkro/ui/home/model/get_cities_model.dart';
import 'package:internkro/ui/home/model/get_course_model.dart';
import 'package:internkro/ui/job_listting/model/job_listingmodel.dart';


class ApiService {
  CitiesModel citiesModel;
  var responseBody;

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

  static Future<CourseModel> getCourses() async {

    final response = await http.get(ApiConstant.getBaseURL(ApiConstant.GET_ONLINE_COURSES));
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
}
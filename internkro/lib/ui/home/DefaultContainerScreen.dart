import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:internkro/network/rest_api.dart';
import 'package:internkro/style/constant_values.dart';
import 'package:internkro/ui/home/model/get_cities_model.dart';
import 'package:internkro/ui/home/model/get_course_model.dart';
import 'package:internkro/ui/job_listting/listing_jobscreen.dart';
import 'package:internkro/ui/job_listting/model/job_listingmodel.dart';
import 'package:internkro/ui/location_listing/location_listing.dart';
import 'package:velocity_x/velocity_x.dart';

class DefaultContainerScreen extends StatefulWidget {
  DefaultContainerScreen();

  @override
  _DefaultContainerScreenState createState() => _DefaultContainerScreenState();
}

class _DefaultContainerScreenState extends State<DefaultContainerScreen> {
  CitiesModel citiesModel;
  CourseModel courseModel;
  JobListingModel jobListingModel;

  // List<Data> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCitiesApi();
    getCoursesApi();
  }

  //cities api
  void getCitiesApi() {
    ApiService.getCities().then((resp) {
      if (resp.data != null) {
        citiesModel = resp;
        //data=resp.data;
        setState(() {});
      }
    });
  }

  //coursees api
  void getCoursesApi() {
    ApiService.getCourses().then((resp) {
      if (resp.data != null) {
        courseModel = resp;
        //data=resp.data;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: citiesModel == null && courseModel == null
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                      decoration: BoxDecoration(
                        color: Colors.black38.withAlpha(10),
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                hintText: "Search",
                                contentPadding: EdgeInsets.all(20.0),
                                hintStyle: TextStyle(
                                  color: Colors.black.withAlpha(120),
                                ),
                                border: InputBorder.none,
                              ),
                              onChanged: (String keyword) {},
                            ),
                          ),
                          Icon(
                            Icons.search,
                            color: Colors.black.withAlpha(120),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 170.0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        aspectRatio: 16 / 9,
                      ),
                      items: [
                        "https://pic3.16pic.com/00/55/42/16pic_5542988_b.jpg",
                        "https://photo.16pic.com/00/38/88/16pic_3888084_b.jpg",
                        "https://pic3.16pic.com/00/55/42/16pic_5542988_b.jpg",
                        "https://photo.16pic.com/00/38/88/16pic_3888084_b.jpg"
                      ].map((i) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 7.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(i),
                                  scale: 1.0,
                                  fit: BoxFit.fill)),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Internships',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'POPULAR CITIES',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                    15.heightBox,
                    Container(
                      height: d_145,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          itemCount: citiesModel.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, position) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: d_145,
                                  width: d_130,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black12,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: d_52,
                                        width: d_52,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(citiesModel
                                                    .data[position].icons))),
                                      ),
                                      10.heightBox,
                                      citiesModel.data[position].locationName
                                          .text.black.center
                                          .make()
                                    ],
                                  )).onTap(() {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => LocationListing(
                                    subcategory:  citiesModel.data[position].locationName)));
                              }),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'POPULAR CATEGORIES',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                    15.heightBox,
                    Container(
                      height: d_145,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          itemCount: citiesModel.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, position) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: d_145,
                                  width: d_130,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black12,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: d_45,
                                        width: d_45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(citiesModel
                                                    .data[position].icons))),
                                      ),
                                      10.heightBox,
                                      citiesModel.data[position].locationName
                                          .text.center
                                          .make()
                                    ],
                                  )),
                            );
                          }),
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'View all internships',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        5.widthBox,
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blue,
                          size: 15,
                        )
                      ],
                    ),
                    20.heightBox,
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'InternKaro Trainings',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    10.heightBox,
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Learn new-age-skills on the go',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                    10.heightBox,
                    Container(
                        padding: EdgeInsets.all(12.0),
                        // height:200,
                        // width: MediaQuery.of(context).size.width,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: courseModel.data.programming.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 4.0),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                  height: d_145,
                                  width: d_100,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black12,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: d_55,
                                        width: d_55,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(courseModel
                                                    .data
                                                    .programming[index]
                                                    .icons))),
                                      ),
                                      10.heightBox,
                                      courseModel.data.programming[index]
                                          .subcategory.text.center
                                          .make()
                                    ],
                                  )).onTap(() {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => ListingJobScreen(
                                              subcategory: courseModel.data.programming[index].subcategory)));
                              }),
                            );
                          },
                        )),
                  ],
                ),
              ));
  }
}

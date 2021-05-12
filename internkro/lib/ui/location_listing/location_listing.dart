import 'package:flutter/material.dart';
import 'package:internkro/network/rest_api.dart';
import 'package:internkro/style/constant_values.dart';
import 'package:internkro/ui/home/main_drawer.dart';
import 'package:internkro/ui/job_listting/model/job_listingmodel.dart';
import 'package:velocity_x/velocity_x.dart';

class LocationListing extends StatefulWidget {
  var subcategory;
  LocationListing({this.subcategory});
  @override
  _LocationListingState createState() => _LocationListingState();
}

class _LocationListingState extends State<LocationListing> {

  JobListingModel jobListingModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callJobListingApi();
  }

  void callJobListingApi(){
    ApiService.getLocationList(widget.subcategory)
        .then((value) {
      setState(() {
        jobListingModel = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "InternKro",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: MainDrawer(),
      body: jobListingModel==null? Center(child: CircularProgressIndicator(),):ListView.builder(
          itemCount: jobListingModel.data.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    jobListingModel.data[index].interType.text.bold.xl.black.make(),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        jobListingModel.data[index].orgName.text.medium.make(),
                        Container(
                          height: d_45,
                          width: d_55,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(jobListingModel.data[index].orgLogo),
                                  fit: BoxFit.contain
                              )
                          ),
                        )
                      ],
                    ),
                    20.heightBox,
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,size: d_20,),
                        jobListingModel.data[index].city.text.make()
                      ],
                    ),

                    20.heightBox,
                    Row(
                      children: [
                        Icon(Icons.attach_money_outlined,size: d_18,),
                        "${jobListingModel.data[index].stipend}".text.make(),
                        20.widthBox,
                        Icon(Icons.add_business,size: d_18,),
                        "3 month".text.make()
                      ],
                    ),

                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        jobListingModel.data[index].interType.text.medium.make().box.margin(EdgeInsets.all(5)).rounded.color(Colors.black12).make(),
                        jobListingModel.data[index].endDate.text.make()
                      ],
                    ),
                  ],
                ),
              ).card.make(),
            );
          }),
    );
  }
}

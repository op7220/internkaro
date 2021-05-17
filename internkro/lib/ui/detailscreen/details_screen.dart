import 'package:flutter/material.dart';
import 'package:internkro/network/rest_api.dart';
import 'package:internkro/style/constant_values.dart';
import 'package:internkro/ui/detailscreen/model/details_screen_model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class DetailsScreen extends StatefulWidget {
  var detailCategory;

  DetailsScreen({this.detailCategory});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  DetailsScreenModel detailsScreenModel;

  @override
  void initState() {
    super.initState();
    callDetailsApi();
  }

  void callDetailsApi() {
    ApiService.getDetails(widget.detailCategory).then((value) {
      setState(() {
        detailsScreenModel = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Internship detail",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: detailsScreenModel == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: detailsScreenModel.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            detailsScreenModel
                                .data[index].interType.text.bold.xl.black
                                .make(),
                            5.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                detailsScreenModel
                                    .data[index].orgName.text.medium
                                    .make(),
                                Container(
                                  height: d_45,
                                  width: d_55,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(detailsScreenModel
                                              .data[index].orgLogo),
                                          fit: BoxFit.contain)),
                                )
                              ],
                            ),
                            5.heightBox,
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: d_20,
                                ),
                                detailsScreenModel.data[index].city.text.make()
                              ],
                            ),
                            20.heightBox,
                            Row(
                              children: [
                                Icon(
                                  Icons.date_range,
                                  size: d_18,
                                ),
                                "${detailsScreenModel.data[index].startDate}"
                                    .text
                                    .make(),
                                20.widthBox,
                                Icon(
                                  Icons.date_range_outlined,
                                  size: d_18,
                                ),
                                "${detailsScreenModel.data[index].endDate}"
                                    .text
                                    .make()
                              ],
                            ),
                            20.heightBox,
                            Row(
                              children: [
                                Icon(
                                  Icons.attach_money_outlined,
                                  size: d_18,
                                ),
                                "${detailsScreenModel.data[index].stipend}"
                                    .text
                                    .make(),
                                20.widthBox,
                                Icon(
                                  Icons.add_business,
                                  size: d_18,
                                ),
                                "3 month".text.make()
                              ],
                            ),
                            20.heightBox,
                            Row(
                              children: [
                                Icon(
                                  Icons.shopping_bag,
                                  size: d_18,
                                ),
                                " No. of Opening-  ${detailsScreenModel.data[index].noOfOpening}"
                                    .text
                                    .make(),
                              ],
                            ),

                            20.heightBox,
                            Row(
                              children: [
                                Flexible(
                                  child:
                                      "${detailsScreenModel.data[index].orgDescsription}"
                                          .text
                                          .make(),
                                )
                              ],
                            ),
                          ],
                        ),
                      ).backgroundColor(Colors.white),
                      10.heightBox,
                      Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                             Html(data: detailsScreenModel.data[index].responsibilities),
                              20.heightBox,
                              Container(
                                  height: 40,
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                    textColor: Colors.white,
                                    color: Colors.blue,
                                    child: Text('Apply Now'),
                                    onPressed: () {

                                    },
                                  )),
                              30.heightBox,

                            ],
                          )).backgroundColor(Colors.white),
                    ],
                  ),
                );
              }),
    );
  }
}

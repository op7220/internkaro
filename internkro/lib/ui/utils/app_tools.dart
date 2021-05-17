import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internkro/ui/utils/progressdialog.dart';



closeProgressDialog(BuildContext context) {
  Navigator.of(context).pop();
}

displayProgressDialog(BuildContext context) {
  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      barrierDismissible: true,
      pageBuilder: (BuildContext context, _, __) {
        return new ProgressDialog();
      }));
}

showToast(String msge) {
  Fluttertoast.showToast(
      msg: msge,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 14.0);
}


/*
showSnackBar(String message, final scaffoldKey) {
  scaffoldKey.currentState.showSnackBar(new SnackBar(
    backgroundColor: Colors.red[600],
    content: new Text(
      message,
      style: new TextStyle(color: Colors.white),
    ),
  ));
}


displayProgressDialog(BuildContext context) {
  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      barrierDismissible: true,
      pageBuilder: (BuildContext context, _, __) {
        return new ProgressDialog();
      }));
}
displayProgressDialogDetail(BuildContext context) {
  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      barrierDismissible: true,
      pageBuilder: (BuildContext context, _, __) {
        return new ProgressDialogDetailPage();
      }));
}

closeProgressDialog(BuildContext context) {
  Navigator.of(context).pop();
}

writeDataLocally({String key, String value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setString(key, value);
}

writeBoolDataLocally({String key, bool value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setBool(key, value);
}

getBoolDataLocally({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.getBool(key) == null ? false : localData.getBool(key);
}

Future<String> getDataLocally({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.get(key);
}

setSharedPreferenceUserName({String key, String value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setString(key, value);
}

Future<String> getSharedPreferenceUserName({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.get(key);
}

setSharedPreferenceUserMobileNo({String key, String value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setString(key, value);
}

getSharedPreferenceMobileNo({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.get(key);
}

setSharedPreferenceCountryCode({String key, String value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setString(key, value);
}

getSharedPreferenceCountryCode({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.get(key);
}

clearDataLocally() async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.clear();
}

Widget divider() {
  return Divider(
    height: d_1,
    color: whiteTwo,
  );
}

Widget listContent(String text) {
  return Container(
    height: 30.0,
    padding: pd_20_0_0_0,
    child: Center(
      child: Align(
        alignment: Alignment.centerLeft,
        child:
            Text(text, style: TextStyle(fontSize: d_18, color: greyishBrown)),
      ),
    ),
  );
}

Widget appbar(String text) {
  return AppBar(
    elevation: d_2,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Text(
      text,
      style: TextStyle(fontSize: d_20, fontWeight: FontWeight.w700),
    ),
    actions: <Widget>[
      Align(
        alignment: Alignment.centerRight,
        child: Container(
            //width: d_40,
            child: sailLogo
        ),
      ),
      Container(
        width: d_10,
      ),
    ],
  );
*/

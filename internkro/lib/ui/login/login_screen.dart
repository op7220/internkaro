import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internkro/constant.dart';
import 'package:internkro/network/rest_api.dart';
import 'package:internkro/style/color.dart';
import 'package:internkro/style/strings.dart';
import 'package:internkro/ui/home/home_screen.dart';
import 'package:internkro/ui/home/main_drawer.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:internkro/ui/login/model/login_model.dart';
import 'package:internkro/ui/utils/app_tools.dart';
import 'package:internkro/ui/utils/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  LoginModel loginModel;
  bool connectionResult = false;
  bool hidePassword = true;
  SharedPreferences logindata;
  bool _isGoogleLoggedIn = false;
  String email = "";
  String token = "";
  String name = "";

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  void initState() {
    super.initState();
    pref();
    _checkConnection();
  }

  void pref() async {
    logindata = await SharedPreferences.getInstance();
  }

  _checkConnection() async {
    connectionResult = await NetworkConnection().checkInternetConnection();
    print("==>${connectionResult}");
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  _loginGoogle() async {
    displayProgressDialog(context);
    try {
      await _googleSignIn.signIn().then((result) {
        result.authentication.then((googleKey) {
          print(googleKey.accessToken);
          print(googleKey.idToken);
          print(_googleSignIn.currentUser.displayName);
          name = _googleSignIn.currentUser.displayName;
          email = _googleSignIn.currentUser.email;
          token = googleKey.accessToken;
          logindata.setBool('isLogin', true);
          logindata.setString('email', email);
          logindata.setString('name', name);
          logindata.setString('mobile', "");
          showToast("Login Successfully");
          closeProgressDialog(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => HomeScreen()));
          setState(() {});

        }).catchError((err) {
          print('inner error');
        });
      }).catchError((err) {
        print('error occured');
      });

      setState(() {
        _isGoogleLoggedIn = true;
      });
    } catch (err) {
      print(err);
    }
  }

  void callLoginApi(email, password) {
    _checkConnection();
    if (connectionResult) {
      displayProgressDialog(context);
      ApiService.login(context,email, password).then((resp) {
        try {
          if (resp.data != null) {
                    String uEmail = resp.data[0].email;
                    String uMobile = resp.data[0].mobile;
                    String uFirstName = resp.data[0].firstName;
                    String uLastName = resp.data[0].lastName;
                    logindata.setBool('isLogin', true);
                    logindata.setString('email', uEmail);
                    logindata.setString('name', uFirstName +" "+ uLastName);
                    logindata.setString('mobile', uMobile);
                    showToast(resp.msg);
                    closeProgressDialog(context);
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => HomeScreen()));
                  }
        } catch (e) {
          print(e);
        }
      });
    } else {
      showToast(noConnection);
    }
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: MainDrawer(),
      backgroundColor: Colors.white,
      body: Form(
        autovalidate: true, //check for validation while typing
        key: formkey,
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(15),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: RaisedButton.icon(
                onPressed: () {
                  _loginGoogle();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
                label: Text(
                  'Login with Google',
                  style: TextStyle(color: Colors.black),
                ),
                icon: new Image.asset(
                  "assets/images/google.png",
                  height: 20,
                  width: 20,
                ),
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              'OR LOGIN USING EMAIL',
              style: TextStyle(color: Colors.black54),
            )),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email ID',
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "* Required"),
                    EmailValidator(errorText: "Enter valid email id"),
                  ])),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                  obscureText: hidePassword,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        color: dimBlack,
                        icon: Icon(hidePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      )
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "* Required"),
                    MinLengthValidator(6,
                        errorText: "Password should be atleast 6 characters"),
                    MaxLengthValidator(15,
                        errorText:
                            "Password should not be greater than 15 characters")
                  ])),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(FORGOT_SCREEN);
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
              ],
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Login'),
                  onPressed: () {
                    if (formkey.currentState.validate()) {
                      callLoginApi(emailController.text.toString(),
                          passwordController.text.toString());
                    } else {}
                  },
                )),
            Container(
                child: Row(
              children: <Widget>[
                Text('Does not have account?'),
                FlatButton(
                  textColor: Colors.blue,
                  child: Text(
                    'Signup',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(SIGNUP_SCREEN);
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ))
          ],
        ),
      ),
    );
  }
}

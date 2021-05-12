import 'package:flutter/material.dart';
import 'package:internkro/constant.dart';
import 'package:internkro/ui/home/home_screen.dart';
import 'package:internkro/ui/home/main_drawer.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
                  print('Button Clicked.');
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
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomeScreen()));
                      print("Validated");
                    } else {
                      print("Not Validated");
                    }
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

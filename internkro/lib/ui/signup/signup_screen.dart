import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:internkro/constant.dart';
import 'package:internkro/ui/home/main_drawer.dart';
import 'package:internkro/ui/login/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Signup",
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
              height: 60,
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: RaisedButton.icon(
                onPressed: () {
                  print('Button Clicked.');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
                label: Text(
                  'Signup with Google',
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
              height: 15,
            ),
            Center(
                child: Text(
              'OR SIGNUP USING EMAIL',
              style: TextStyle(color: Colors.black54),
            )),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email ID',
                ),
                validator: MultiValidator([
                  RequiredValidator(errorText: "* Required"),
                  EmailValidator(errorText: "Enter valid email id"),
                ]),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password (min 6 character)',
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
            Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: TextFormField(
                  controller: fnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "* Required"),
                    MinLengthValidator(3,
                        errorText: "First name should be atleast 3 characters"),
                    MaxLengthValidator(15,
                        errorText:
                            "First name should not be greater than 15 characters")
                  ])),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: TextFormField(
                  controller: lnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "* Required"),
                    MinLengthValidator(3,
                        errorText: "Last name should be atleast 3 characters"),
                    MaxLengthValidator(15,
                        errorText:
                            "Last name should not be greater than 15 characters")
                  ])),
            ),
            Container(
                height: 60,
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Signup'),
                  onPressed: () {
                    if (formkey.currentState.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginScreen()));
                      print("Validated");
                    } else {
                      print("Not Validated");
                    }
                  },
                )),
            Container(
                child: Row(
              children: <Widget>[
                Text('Already register?'),
                FlatButton(
                  textColor: Colors.blue,
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(LOGIN_SCREEN);
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
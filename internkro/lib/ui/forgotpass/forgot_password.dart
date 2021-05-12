import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Forgot Password",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
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
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                'Please enter your e-mail address.You will receive an e-mail along with a link which can be used to reset your password.',
                style: TextStyle(color: Colors.black54),
              ),
            ),
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
            SizedBox(height: 15),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Submit'),
                  onPressed: () {
                    if (formkey.currentState.validate()) {
                      print("Validated");
                    } else {
                      print("Not Validated");
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}

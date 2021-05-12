import 'package:flutter/material.dart';
import 'package:internkro/constant.dart';
import 'package:internkro/network/ApiConstants.dart';
import 'package:internkro/ui/webview/webscreen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          new Container(
            height: 90,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: new Image.asset(
                'assets/images/internkro.png',
                height: 90,
              ),
            ),
            color: Colors.white,
          ),
          ListTile(
            leading: new Icon(Icons.add),
            title: new Text("Login"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(LOGIN_SCREEN);
            },
          ),
          ListTile(
            leading: new Icon(Icons.add),
            title: new Text("Signup"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(SIGNUP_SCREEN);
            },
          ),
          Divider(
            color: Colors.black54,
          ),
          ListTile(
            title: new Text(
              "EXPLORE",
              style: TextStyle(color: Colors.black54),
            ),
          ),
          ListTile(
            leading: new Icon(Icons.add),
            title: new Text("Internships"),
            onTap: () {},
          ),
          ListTile(
            leading: new Icon(Icons.add),
            title: new Text("Online Trainings"),
            onTap: () {},
          ),
          ListTile(
            leading: new Icon(Icons.add),
            title: new Text("Fresher jobs"),
            onTap: () {},
          ),
          ListTile(
            title: new Text(
              "HELP & SUPPORT",
              style: TextStyle(color: Colors.black54),
            ),
          ),
          ListTile(
            leading: new Icon(Icons.add),
            title: new Text("Contact-Us"),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WebViewScreen(webUrl: ApiConstant.CONTACT_US_URL,)));
            },
          ),
          ListTile(
            leading: new Icon(Icons.add),
            title: new Text("Report a Complaint"),
            onTap: () {},
          ),
          ListTile(
            leading: new Icon(Icons.add),
            title: new Text("Terms and Conditions"),
            onTap: () {

            },
          ),
          ListTile(
            leading: new Icon(Icons.add),
            title: new Text("Privacy Policy"),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WebViewScreen(webUrl: ApiConstant.PRIVACY_POLICY,)));
            },
          ),
          ListTile(
            leading: new Icon(Icons.add),
            title: new Text("About"),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WebViewScreen(webUrl: ApiConstant.ABOUT_US,)));
            },
          ),
        ],
      ),
    );
  }
}

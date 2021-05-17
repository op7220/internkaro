import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:internkro/constant.dart';
import 'package:internkro/network/ApiConstants.dart';
import 'package:internkro/style/color.dart';
import 'package:internkro/ui/webview/webscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  bool isLoggedin=false;
  SharedPreferences logindata;

  String username;

  @override
  void initState() {
    super.initState();
    initial();
  }



  void initial() async {
    logindata = await SharedPreferences.getInstance();
    isLoggedin = (logindata.getBool('isLogin') ?? false);
    setState(() {
      if (isLoggedin == true) {
        username =logindata.getString('name');
      }else{
        username="LogIn";
      }

    });
  }

  _logOut() async {
    await logindata.clear();
 //   facebookLogin.logOut();
   // _googleSignIn.signOut();
    setState(() {
      isLoggedin=false;
      username="LogIn";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Colors.white, Colors.white])),
              child: Container(
                child: Column(
                  children: <Widget>[
                   // _profileImage(),
                    Container(
                      height: 90,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                        child: new Image.asset(
                          'assets/images/internkro.png',
                          height: 90,
                        ),
                      ),
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: '$username',
                            style: TextStyle(color: Colors.black, fontSize: 18.0),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                if(isLoggedin==false){
                                  Navigator.of(context).pushNamed(LOGIN_SCREEN);
                                }
                              })
                      ]),
                    ),

                  ],
                ),
              )),
          CustomListTile("Internships", 'assets/images/internship.png', () => {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WebViewScreen(webUrl: ApiConstant.INTERNSHIP,)))
          }),
          CustomListTile("Online Trainings",'assets/images/onlinetraining.png', () => {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WebViewScreen(webUrl: ApiConstant.TRAINING,)))
          }),
          CustomListTile("Fresher jobs", 'assets/images/job.png', () => {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WebViewScreen(webUrl: ApiConstant.JOBS,)))
          }),
       /*   CustomListTile("HELP & SUPPORT", 'assets/images/support.png', () => {

          }),*/
          CustomListTile("Contact-Us", 'assets/images/contact.png', () => {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WebViewScreen(webUrl: ApiConstant.CONTACT_US_URL,)))
          }),
          CustomListTile("Privacy Policy", 'assets/images/privacy.png', () => {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WebViewScreen(webUrl: ApiConstant.PRIVACY_POLICY,)))
          }),
          CustomListTile("FAQ", 'assets/images/faq.png', () => {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WebViewScreen(webUrl: ApiConstant.FREQUENTLY_ASKED_QUESTION,)))
          }),
          CustomListTile("About", 'assets/images/aboutus.png', () => {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WebViewScreen(webUrl: ApiConstant.ABOUT_US,)))
          }),
          Opacity(
            opacity: isLoggedin ? 1.0 : 0.0,
            child: CustomListTile("Logout", 'assets/images/exit.png', () {
              _logOut();
              Navigator.pop(context);
            }),
          ),
          SizedBox(height: 15,),

        ],
      ),
    );
  }
}


class CustomListTile extends StatelessWidget {
  String text;
  Function onTab;
  String icon;
  CustomListTile(this.text, this.icon, this.onTab);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
      BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
      child: InkWell(
        onTap: onTab,
        child: Container(
          height: 55,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0, 0.0, 0),
            child: Row(
              children: [
                Row(
                  children: [
                    Image.asset(
                      icon,
                      height: 18.0,
                      width: 18.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
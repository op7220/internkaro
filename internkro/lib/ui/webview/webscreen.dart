import 'package:flutter/material.dart';
import 'package:internkro/network/ApiConstants.dart';
import 'package:internkro/ui/home/DefaultContainerScreen.dart';
import 'package:internkro/ui/home/home_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class WebViewScreen extends StatelessWidget {
  String webUrl;

  WebViewScreen({this.webUrl});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return Navigator.pushReplacementNamed(context, '/homescreen');
        },
        child: SafeArea(
            child: Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.white, //Color(0xff0000a0),
            leading: new FlatButton(
              child: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            title: displayText(),
          ),
          body: WebView(
            initialUrl: webUrl,
            debuggingEnabled: true,
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: <JavascriptChannel>[].toSet(),
            onWebViewCreated: (WebViewController webViewController) {},
            onPageStarted: (String url) {
              print('Page started loading: 111 $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: 222 $url');
            },
          ),
        )));
  }

  displayText() {
    if (webUrl == ApiConstant.CONTACT_US_URL) {
      return "Contact-Us".text.black.make();
    }else if (webUrl == ApiConstant.FREQUENTLY_ASKED_QUESTION) {
      return "FAQ".text.black.make();
    }
    else if (webUrl == ApiConstant.TRAINING) {
      return "Online Training".text.black.make();
    }
    else if (webUrl == ApiConstant.JOBS) {
      return "Freshers Job".text.black.make();
    }
    else if (webUrl == ApiConstant.INTERNSHIP) {
      return "Internship".text.black.make();
    }
    else if (webUrl == ApiConstant.PRIVACY_POLICY) {
      return "Privacy Policy".text.black.make();
    } else {
      return "About".text.black.make();
    }
  }
}

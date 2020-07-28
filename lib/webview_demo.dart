import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WebViewDemo();
  }
}

class _WebViewDemo extends State<WebViewDemo> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    int count = 0;
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://namslay26.github.io/aestheticslay/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onPageStarted: (String url) {
           showAlertDialog(context);
          },
          onPageFinished: (String url) {
            print("fired");
            count++;
            if (count == 2) {
              Navigator.of(context).pop();
            }
          },
          gestureNavigationEnabled: true,
        );
      }),
    );
  }
}

showAlertDialog(var context) {
  var alertDialog = AlertDialog(
    title: Text("Loading..."),
    content: LinearProgressIndicator(),
  );

  showDialog(
      context: context, builder: (BuildContext context) => alertDialog);
}

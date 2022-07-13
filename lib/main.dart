// @dart=2.9
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: webView(),
    );
  }
}

class webView extends StatefulWidget {
  @override
  State<webView> createState() => _webViewState();
}

class _webViewState extends State<webView> {
  WebViewController controller;
  @override
  void initState(){
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  Widget build(BuildContext context)=> WillPopScope(onWillPop:() async{
    if (await controller.canGoBack()) {
      controller.goBack();

      // stay app
      return false;
    } else {
      return true;
    }
  },
  child : SafeArea(
    left: true,
    top: true,
    right: true,
    bottom: true,
    child: Scaffold(
    appBar: null,
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://akuhemat.com',
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
    ),
  )));
    
}

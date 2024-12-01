import 'package:flutter/material.dart';
import 'package:webview_universal/webview_universal.dart';

class WebViewScreen extends StatefulWidget {
  WebViewScreen({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState(url);
}

class _WebViewScreenState extends State<WebViewScreen> {
  _WebViewScreenState(this.url);
   WebViewController webViewController = WebViewController();

   final String url;
   @override
   void initState() {
     super.initState();
     task(url: url);
   }

   Future<void> task({required String url}) async {
     await webViewController.init(
       context: context,
       uri: Uri.parse(url), setState: (void Function() fn) {  },
     );
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        controller: webViewController ,
      ),
    );
  }
}

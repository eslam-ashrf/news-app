
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
 final  Map<String,dynamic> articles;
WebViewScreen(this.articles);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.only(top: 28),
        child: WebView(
          initialUrl: articles['url'],
        ),
      ),
    );
  }
}

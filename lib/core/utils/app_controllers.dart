import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppControllers {
  static final webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(
        'https://books.google.com.eg/books?id=TL9QDwAAQBAJ&printsec=frontcover&dq=%D8%A7%D9%84%D8%B3%D9%86%D9%87+%D8%A7%D9%84%D9%86%D8%A8%D9%88%D9%8A%D9%87&hl=&cd=1&source=gbs_api#v=onepage&q&f=false'));
}

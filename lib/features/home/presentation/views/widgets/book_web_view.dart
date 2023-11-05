import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';

class BookWebView extends StatefulWidget {
  const BookWebView({super.key, required this.bookUrl});
  final String bookUrl;

  @override
  State<BookWebView> createState() => _BookWebViewState();
}

class _BookWebViewState extends State<BookWebView> {
  bool isloading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                // Update loading bar.
              },
              onPageStarted: (String url) {},
              onPageFinished: (String url) {
                setState(() {
                  isloading = false;
                });
              },
              onWebResourceError: (WebResourceError error) {
                print(error.toString());
              },
              onNavigationRequest: (NavigationRequest request) {
                if (request.url.startsWith('https://www.youtube.com/')) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(
            Uri.parse(widget.bookUrl),
          ),
      ),
    );
  }
}

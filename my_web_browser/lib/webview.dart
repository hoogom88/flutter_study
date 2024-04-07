
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebview extends StatefulWidget {
  const MyWebview({Key? key}) : super(key: key);

  @override
  State<MyWebview> createState() => _MyWebviewState();
}

class _MyWebviewState extends State<MyWebview> {
  late WebViewController _webViewController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (String url) {
              setState(() {
                _isLoading = true;
              });
            },
            onPageFinished: (String url) {
              setState(() {
                _isLoading = false;
              });
            },
          )
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My WebBrowser'),
        actions: [
          InkWell(
              onTap: () {
                _webViewController.loadRequest(Uri.parse('https://github.com/hoogom88/TIL'));
              },
              child: Icon(Icons.home)
          ),
          PopupMenuButton(
              onSelected: ((value) {
                _webViewController.loadRequest(Uri.parse(value));
              }),
              itemBuilder: (context) => [
                const PopupMenuItem(
                    value: 'https://www.google.com', child: Text('구글')),
                const PopupMenuItem(
                    value: 'https://www.naver.com', child: Text('네이버')),
                const PopupMenuItem(
                    value: 'https://www.kakao.com', child: Text('카카오')),
              ])
        ],
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) async {
          if (didPop) return;
          if (await _webViewController.canGoBack()) {
            _webViewController.goBack();
            return;
          }
          SystemNavigator.pop();
        },
        child: Stack(
          children: [
            WebViewWidget(
              controller: _webViewController,
            ),
            Visibility(
                visible: _isLoading,
                child: const Center(child: CircularProgressIndicator(strokeWidth: 8.0, color: Colors.amber,))
            )
          ],
        ),
      ),
    );
  }
}
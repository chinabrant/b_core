import 'package:flutter/material.dart';
// import 'package:webview_flutter/platform_interface.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebPage extends StatefulWidget {
  final String url;
  final String title;
  WebPage({
    required this.url,
    this.title = '',
  });
  @override
  State<StatefulWidget> createState() {
    return _WebPageState();
  }
}

class _WebPageState extends State<WebPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(widget.title),
        ),
        body: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
        ));
  }
}

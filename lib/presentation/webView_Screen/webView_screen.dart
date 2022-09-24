import 'package:webview_flutter/webview_flutter.dart';

import 'controller/webView_controller.dart';
import 'package:codecalenderv2/core/app_export.dart';
import 'package:flutter/material.dart';

class WebViewScreen extends GetWidget<WebViewScreenController> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.black500,
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl : controller.data[0]
        )
      ));
  }
}

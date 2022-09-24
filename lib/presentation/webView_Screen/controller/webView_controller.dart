import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';
import '/core/app_export.dart';

class WebViewScreenController extends GetxController {
  @override
  void onInit() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  var data = Get.arguments;

  @override
  void onClose() {
    super.onClose();
  }
}

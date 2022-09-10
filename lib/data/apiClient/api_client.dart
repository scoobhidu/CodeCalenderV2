import 'package:codecalenderv2/core/app_export.dart';

class ApiClient extends GetConnect {
  var KontestURL = "https://kontests.net/api/v1";
  var CPurl = "https://competitive-coding-api.herokuapp.com/api";

  @override
  void onInit() {
    super.onInit();
    httpClient.timeout = Duration(seconds: 60);
    httpClient.addRequestModifier<dynamic>((request) {
      Map<String, String> headers = {
        "Content-type": "application/json",
      };
      request.headers.addAll(headers);
      return request;
    });
  }

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    return response.isOk;
  }
}

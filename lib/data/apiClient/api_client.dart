import 'dart:convert';

import 'package:codecalenderv2/core/app_export.dart';

import 'package:http/http.dart' as http;

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

  // Future PANPhotoPutResponse(Function onSuccess,
  //     Function(dynamic error)? onError,
  //     reqData) async {
  //   print("Putting PAN Photo using API");
  //
  //   late final Response response;
  //
  //   ProgressDialogUtils.showProgressDialog();
  //   try {
  //     await isNetworkConnected();
  //
  //     print(reqData);
  //
  //     response = await httpClient.post(
  //         '$url/onboarding/v2/signup/user/pan/upload',
  //         headers: <String, String>{
  //           "session_id": PrefUtils().getsessionid().toString()
  //         },
  //         body: reqData);
  //
  //     ProgressDialogUtils.hideProgressDialog();
  //     print('$url/onboarding/v2/signup/user/pan/upload');
  //     print(response.statusCode);
  //     print(response.body);
  //     print("got PAN Photo response");
  //
  //     if (_isSuccessCall(response)) {
  //       print("Successful Post Request for PAN photo");
  //       onSuccess();
  //     } else {
  //       onError!(
  //         response.hasError
  //             ? response.statusText
  //             : PANUploadResponse
  //             .fromJson(jsonDecode(response.body))
  //             .message,
  //       );
  //     }
  //   } catch (error) {
  //     ProgressDialogUtils.hideProgressDialog();
  //     onError!(error);
  //   }
  // }


  Future fetchCodechefContest() async {
    final http.Response response = await http.get(
      Uri.parse('$KontestURL/code_chef'),
    );

    if (response.statusCode == 200) {
      print("Fetched Codechef Contests");
      // print(jsonDecode(response.body));
      return response.body;
    } else {
      throw Exception("Error fetching CodeChef Contests");
    }
  }

  Future fetchCodeforcesContest() async {
    final http.Response response = await http.get(
      Uri.parse('$KontestURL/codeforces'),
    );

    if (response.statusCode == 200) {
      print("Fetched Codeforces Contests");
      // print(jsonDecode(response.body));
      return response.body;
    } else {
      throw Exception("Error fetching Codeforces Contests");
    }
  }

  Future fetchAtcoderContest() async {
    final http.Response response = await http.get(
      Uri.parse('$KontestURL/at_coder'),
    );

    if (response.statusCode == 200) {
      print("Fetched AtCoder Contests");
      // print(jsonDecode(response.body));
      return response.body;
    } else {
      throw Exception("Error fetching Atcoder Contests");
    }
  }

  Future fetchHackerRankContest() async {
    final http.Response response = await http.get(
      Uri.parse('$KontestURL/hacker_rank'),
    );

    if (response.statusCode == 200) {
      print("Fetched HackerRank Contests");
      // print(jsonDecode(response.body));
      return response.body;
    } else {
      throw Exception("Error fetching HackerRank Contests");
    }
  }

  Future fetchHackerearthContest() async {
    final http.Response response = await http.get(
      Uri.parse('$KontestURL/hacker_earth'),
    );

    if (response.statusCode == 200) {
      print("Fetched HackerEarth Contests");
      // print(jsonDecode(response.body));
      return response.body;
    } else {
      throw Exception("Error fetching HackerEarth Contests");
    }
  }
  Future fetchLeetCodeContest() async {
    final http.Response response = await http.get(
      Uri.parse('$KontestURL/leet_code'),
    );

    if (response.statusCode == 200) {
      print("Fetched Leetcode Contests");
      // print(jsonDecode(response.body));
      return response.body;
    } else {
      throw Exception("Error fetching LeetCode Contests");
    }
  }

  Future fetchKickstartContest() async {
    final http.Response response = await http.get(
      Uri.parse('$KontestURL/kick_start'),
    );

    if (response.statusCode == 200) {
      print("Fetched KickStart Contests");
      // print(jsonDecode(response.body));
      return response.body;
    } else {
      throw Exception("Error fetching KickStart Contests");
    }
  }

  // ********* Abhijeet_AR's API for getting User Progress ********** //

  Future fetchCodechefProgress(String username) async {
    final http.Response response = await http.get(
      Uri.parse('$CPurl/codechef/$username'),
    );

    if (response.statusCode == 200) {
      print("Fetched Codechef Progress");
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      throw Exception("Error fetching CodeChef Progress");
    }
  }

  Future fetchCodeforcesProgress(String username) async {
    final http.Response response = await http.get(
      Uri.parse('$CPurl/codeforces/$username'),
    );

    if (response.statusCode == 200) {
      print("Fetched CodeForces Progress");
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      throw Exception("Error fetching Codeforces Progress");
    }
  }

  Future fetchLeetcodeProgress(String username) async {
    final http.Response response = await http.get(
      Uri.parse('$CPurl/leetcode/$username'),
    );

    if (response.statusCode == 200) {
      print("Fetched Leetcode Progress");
      print (jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      throw Exception("Error fetching Leetcode Progress");
    }
  }

  Future fetchInterviewBitProgress(String username) async {
    final http.Response response = await http.get(
      Uri.parse('$CPurl/interviewbit/$username'),
    );

    if (response.statusCode == 200) {
      print("Fetched InterviewBit Progress");
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      throw Exception("Error fetching InterviewBit Progress");
    }
  }
  Future fetchSPOJProgress(String username) async {
    final http.Response response = await http.get(
      Uri.parse('$CPurl/spoj/$username'),
    );

    if (response.statusCode == 200) {
      print("Fetched SPOJ Progress");
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      throw Exception("Error fetching SPOJ Progress");
    }
  }
  Future fetchAtcoderProgress(String username) async {
    final http.Response response = await http.get(
      Uri.parse('$CPurl/atcoder/$username'),
    );

    if (response.statusCode == 200) {
      print("Fetched Atcoder Progress");
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      throw Exception("Error fetching Atcoder Progress");
    }
  }
}

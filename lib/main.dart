import 'dart:io';

import 'package:codecalenderv2/data/models/GoogleSigninObjectModel/googleSignInObjectModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'core/app_export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("Initializing Firebase");
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: 'AIzaSyBs8NWEFpZnPGfUeW-covxSMrtyahlRz3c',
    appId: 'com.codecalenderv.app',
    messagingSenderId: '180471297147',
    projectId: 'codecalenderv2',
  ));
  print("Initialized Firebase");

  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
      // navigate directly to competition Page or the loader screen to fetch user details and other data
    }
  });

  GoogleSignIn googleSignIn = GoogleSignIn();

  Get.put(GoogleSignInObjectModel(object: googleSignIn), tag: 'googleSignInObject');

  final Directory directory = await getApplicationDocumentsDirectory();

  Hive.init(directory.path);
  var state = await Hive.openBox('currentState');

  String? logState = state.get('loggedState');
  print(logState);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
  runApp(MyApp(loggedState: logState,));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  String? loggedState;
  MyApp({required this.loggedState});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'codecalenderv2',
      initialBinding: InitialBindings(),
      initialRoute: loggedState == null || loggedState == 'false'? AppRoutes.onboardingScreen : AppRoutes.contestLoadingScreen,
      getPages: AppRoutes.pages,
    );
  }
}

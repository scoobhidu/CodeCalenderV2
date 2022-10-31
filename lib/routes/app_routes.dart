import 'package:codecalenderv2/presentation/contestLoading_Screen/contestLoading_screen.dart';
import 'package:codecalenderv2/presentation/mainContestView_Screen/mainContestView_screen.dart';
import 'package:codecalenderv2/presentation/onboardingForm_screen/binding/onboardingForm_binding.dart';
import 'package:codecalenderv2/presentation/onboardingForm_screen/onboardingForm_screen.dart';
import 'package:codecalenderv2/presentation/onboarding_Screen/binding/onboarding_binding.dart';
import 'package:codecalenderv2/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:codecalenderv2/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:codecalenderv2/presentation/statsLoading_Screen/statsLoading_screen.dart';
import 'package:codecalenderv2/presentation/webView_Screen/webView_screen.dart';
import 'package:get/get.dart';

import '../presentation/contestLoading_Screen/binding/contestLoading_binding.dart';
import '../presentation/dashboard_Screen/binding/dashboard_binding.dart';
import '../presentation/dashboard_Screen/dashboard_screen.dart';
import '../presentation/mainContestView_Screen/binding/mainContestView_binding.dart';
import '../presentation/onboarding_Screen/onboarding_screen.dart';
import '../presentation/statsLoading_Screen/binding/statsLoading_binding.dart';
import '../presentation/webView_Screen/binding/webView_binding.dart';

class AppRoutes {
  static String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static String onboardingScreen = '/onboarding_Screen';

  static String onboardingFormScreen = '/onboardingForm_screen';

  static String mainContestViewScreen = '/mainContestView_Screen';

  static String contestLoadingScreen = '/contestLoading_Screen';

  static String webViewScreen = '/webView_Screen';

  static String statsLoadingScreen = '/statsLoading_Screen';

  static String dashboardScreen = '/dashboard_Screen';

  static List<GetPage> pages = [
    GetPage(
      name: onboardingScreen,
      page: () => OnboardingScreen(),
      bindings: [
        OnboardingBinding(),
      ],
    ),
    GetPage(
      name: onboardingFormScreen,
      page: () => OnboardingFormScreen(),
      bindings: [
        OnboardingFormBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: mainContestViewScreen,
      page: () => MainContestViewScreen(),
      bindings: [
        MainContestViewBinding(),
      ],
    ),
    GetPage(
      name: contestLoadingScreen,
      page: () => ContestLoadingScreen(),
      bindings: [
        ContestLoadingBinding(),
      ],
    ),
    GetPage(
      name: webViewScreen,
      page: () => WebViewScreen(),
      bindings: [
        WebViewBinding(),
      ],
    ),
    GetPage(
      name: statsLoadingScreen,
      page: () => StatsLoadingScreen(),
      bindings: [
        StatsLoadingBinding(),
      ],
    ),
    GetPage(
      name: dashboardScreen,
      page: () => DashboardScreen(),
      bindings: [
        DashboardBinding(),
      ],
    ),
  ];
}

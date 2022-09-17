import 'package:codecalenderv2/presentation/contestLoading_Screen/contestLoading_screen.dart';
import 'package:codecalenderv2/presentation/mainContestView_Screen/mainContestView_screen.dart';
import 'package:codecalenderv2/presentation/onboardingForm_screen/binding/onboardingForm_binding.dart';
import 'package:codecalenderv2/presentation/onboardingForm_screen/onboardingForm_screen.dart';
import 'package:codecalenderv2/presentation/onboarding_Screen/binding/onboarding_binding.dart';
import 'package:codecalenderv2/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:codecalenderv2/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

import '../presentation/contestLoading_Screen/binding/contestLoading_binding.dart';
import '../presentation/mainContestView_Screen/binding/mainContestView_binding.dart';
import '../presentation/onboarding_Screen/onboarding_screen.dart';

class AppRoutes {
  static String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static String onboardingScreen = '/onboarding_Screen';

  static String onboardingFormScreen = '/onboardingForm_screen';

  static String mainContestViewScreen = '/mainContestView_Screen';

  static String contestLoadingScreen = '/contestLoading_Screen';

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
  ];
}

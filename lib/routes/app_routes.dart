import 'package:codecalenderv2/presentation/onboardingForm_screen/binding/onboardingForm_binding.dart';
import 'package:codecalenderv2/presentation/onboardingForm_screen/onboardingForm_screen.dart';
import 'package:codecalenderv2/presentation/onboarding_Screen/binding/onboarding_binding.dart';
import 'package:codecalenderv2/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:codecalenderv2/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

import '../presentation/onboarding_Screen/onboarding_screen.dart';

class AppRoutes {
  static String dashboardForMobileScreen = '/dashboard_for_mobile_screen';

  static String transactionForMobileScreen = '/transaction_for_mobile_screen';

  static String accountsForMobileScreen = '/accounts_for_mobile_screen';

  static String investmentsForMobileScreen = '/investments_for_mobile_screen';

  static String creditCardsForMobileScreen = '/credit_cards_for_mobile_screen';

  static String loansForMobileScreen = '/loans_for_mobile_screen';

  static String servicesForMobileScreen = '/services_for_mobile_screen';

  static String settingPage1ForMobile1Screen =
      '/setting_page_1_for_mobile1_screen';

  static String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static String onboardingScreen = '/onboarding_Screen';

  static String onboardingFormScreen = '/onboardingForm_screen';

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
  ];
}

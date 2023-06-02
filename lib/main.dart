import 'package:emoney_app/shared/theme.dart';
import 'package:emoney_app/ui/pages/data_package_page.dart';
import 'package:emoney_app/ui/pages/data_provider_page.dart';
import 'package:emoney_app/ui/pages/data_success_page.dart';
import 'package:emoney_app/ui/pages/home_page.dart';
import 'package:emoney_app/ui/pages/onboarding_page.dart';
import 'package:emoney_app/ui/pages/pin_page.dart';
import 'package:emoney_app/ui/pages/profile_edit_page.dart';
import 'package:emoney_app/ui/pages/profile_edit_pin_page.dart';
import 'package:emoney_app/ui/pages/profile_edit_success_page.dart';
import 'package:emoney_app/ui/pages/profile_page.dart';
import 'package:emoney_app/ui/pages/sign_in_page.dart';
import 'package:emoney_app/ui/pages/sign_up_page.dart';
import 'package:emoney_app/ui/pages/sign_up_set_ktp_page.dart';
import 'package:emoney_app/ui/pages/sign_up_set_profile_page.dart';
import 'package:emoney_app/ui/pages/sign_up_success_page.dart';
import 'package:emoney_app/ui/pages/splash_page.dart';
import 'package:emoney_app/ui/pages/topup_amount_page.dart';
import 'package:emoney_app/ui/pages/topup_page.dart';
import 'package:emoney_app/ui/pages/topup_success.dart';
import 'package:emoney_app/ui/pages/transfer_amount_page.dart';
import 'package:emoney_app/ui/pages/transfer_page.dart';
import 'package:emoney_app/ui/pages/transfer_success_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: lightBgColor,
        appBarTheme: AppBarTheme(
            backgroundColor: lightBgColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: blackColor,
            ),
            titleTextStyle: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            )),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/onBoarding': (context) => const OnboardingPage(),
        '/sign-in': (context) => const SignInPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/sign-up-set-profile': (context) => const SignUpSetProfilePage(),
        '/sign-up-set-ktp-profile': (context) => const SignUpSetKtpPage(),
        '/sign-up-success': (context) => const SignUpSuccessPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/pin': (context) => const PinPage(),
        '/profile-edit': (context) => const ProfileEditPage(),
        '/profile-edit-pin': (context) => const ProfileEditPinPage(),
        '/profile-edit-success': (context) => const ProfileEditSuccessPage(),
        '/topup': (context) => const TopupPage(),
        '/topup-amount': (context) => const TopUpAmountPage(),
        '/topup-success': (context) => const TopupSuccessPage(),
        '/transfer': (context) => const TransferPage(),
        '/transfer-amount': (context) => const TransferAmountPage(),
        '/transfer-success': (context) => const TransferSuccessPage(),
        '/data-provider': (context) => const DataProviderPage(),
        '/data-package': (context) => const DataPackagePage(),
        '/data-success': (context) => const DataSuccessPage(),
      },
    );
  }
}

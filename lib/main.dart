
import 'package:event_app/app/presentation/booking_payment/booking_payment.dart';
import 'package:event_app/app/presentation/choose_%20interest/choose_interest.dart';
import 'package:event_app/app/presentation/choose_%20interest/provider/choose_interest_provider.dart';
import 'package:event_app/app/presentation/event_detail/event_detail.dart';
import 'package:event_app/app/presentation/forgot_password/forgot_password.dart';
import 'package:event_app/app/presentation/home_screen/home_Screen.dart';
import 'package:event_app/app/presentation/home_screen/provider/home_screen_provider.dart';
import 'package:event_app/app/presentation/home_screen/tab/tab_like.dart';
import 'package:event_app/app/presentation/intro_screen/intro_screen.dart';
import 'package:event_app/app/presentation/intro_screen/provider/intro_screen_provider.dart';
import 'package:event_app/app/presentation/location_screen/location_screen.dart';
import 'package:event_app/app/presentation/login_forgot_password/login_forgot_password.dart';
import 'package:event_app/app/presentation/nearby_event/nearby_event.dart';
import 'package:event_app/app/presentation/otp_verification/otp_verification.dart';
import 'package:event_app/app/presentation/payment_method/payment_method.dart';
import 'package:event_app/app/presentation/payment_method/provider/payment_method_provider.dart';
import 'package:event_app/app/presentation/register_step_one/register_step_one.dart';
import 'package:event_app/app/presentation/register_step_two/register_step_two.dart';
import 'package:event_app/app/presentation/search/provider/search_provider.dart';
import 'package:event_app/app/presentation/search/search.dart';
import 'package:event_app/app/presentation/select_location/select_location.dart';
import 'package:event_app/app/presentation/select_location_two/provider/select_location_provider.dart';
import 'package:event_app/app/presentation/select_location_two/select_location_two.dart';
import 'package:event_app/app/presentation/sign_in_inactive/provider/sing_in_inactive_provider.dart';
import 'package:event_app/app/presentation/sign_in_inactive/sign_in_inactive.dart';
import 'package:event_app/app/presentation/splash_screen/splash_screen.dart';
import 'package:event_app/app/presentation/ticket/ticket.dart';
import 'package:event_app/app/presentation/user_information/provider/user_imformation_provider.dart';
import 'package:event_app/app/presentation/user_information/user_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<IntroScreenProvider>(create: (context) => IntroScreenProvider()),
        ChangeNotifierProvider<SelectLocationProvider>(create: (context) => SelectLocationProvider()),
        ChangeNotifierProvider<HomeScreenProvider>(create: (context) => HomeScreenProvider()),
        ChangeNotifierProvider<SearchProvider>(create: (context) => SearchProvider()),
        ChangeNotifierProvider<ChooseInterestProvider>(create: (context) => ChooseInterestProvider()),
        ChangeNotifierProvider<SignInInactiveProvider>(create: (context) => SignInInactiveProvider()),
        ChangeNotifierProvider<UserInformationProvider>(create: (context) => UserInformationProvider()),
        ChangeNotifierProvider<PaymentMethodProvider>(create: (context) => PaymentMethodProvider()),
      ],
      child: ScreenUtilInit(
        designSize: Size(375,812),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: <String, WidgetBuilder>{
            "/" :(context) => SplashScreen(),
            "intro" :(context) => IntroScreen(),
            "signin" :(context) => SignInInactive(),
            "forgot" :(context) => ForgotPassword(),
            "login" :(context) => LoginForgotPassword(),
            "registerone" :(context) => RegisterStepOne(),
            "registerTwo" :(context) => RegisterStepTwo(),
            "otp" :(context) => OtpVerification(),
            "location" :(context) => LocationScreen(),
            "select" :(context) => SelectLocation(),
            "selecttwo" :(context) => SelectLocationTwo(),
            "choose" :(context) => ChooseInterest(),
            "home" :(context) => HomeScreen(),
            "event" :(context) => EventDetail(),
            "payment" :(context) => PaymentMethod(),
            "booking" :(context) => BookingPayment(),
            "user" :(context) => UserInformation(),
            "like" :(context) => TabLike(),
            "ticket" :(context) => Ticket(),
            "search" :(context) => Search(),
            "nearby" :(context) => NearbyEvent(),
          },
        ),
      ),
    );
  }
}

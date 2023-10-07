// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:masmix/controller/cubits/air_cubit.dart';
import 'package:masmix/controller/cubits/app_cubit.dart';
import 'package:masmix/controller/cubits/calculate_cubit.dart';
import 'package:masmix/controller/cubits/contact_cubit.dart';
import 'package:masmix/controller/cubits/easy2ship_cubit.dart';
import 'package:masmix/controller/cubits/easy2ship_settings_cubit.dart';
import 'package:masmix/controller/cubits/forget_password_cubit.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/cubits/land_cubit.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/cubits/mas4me_cubit.dart';
import 'package:masmix/controller/cubits/my_account_cubit.dart';
import 'package:masmix/controller/cubits/referral_code_cubit.dart';
import 'package:masmix/controller/cubits/sea_cubit.dart';
import 'package:masmix/controller/cubits/service_cubit.dart';
import 'package:masmix/controller/cubits/signup_cubit.dart';
import 'package:masmix/controller/cubits/storage_cubit.dart';
import 'package:masmix/controller/share/network/local/cache_helper/cache.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/controller/states/app_states.dart';
import 'package:masmix/stripe_payment/stripe_keys.dart';
import 'package:masmix/views/splash_screen/splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Stripe.publishableKey = ApiKeys.publishableKey;
  await CacheHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  int userId = CacheHelper.getData(key: 'userID') ?? 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => SignupCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => HomeCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..getCurrencys()
            ..getLanguage()
            ..getAccountType()
            ..getCountry()
            ..getCountryCode()
            ..getIPAddress()
            ..changeCity(),
        ),
        BlocProvider(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              MyAccountCubit()..getMyAddress(userId: userId),
        ),
        BlocProvider(
          create: (BuildContext context) => StorageCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => ServiceCubit()
            ..getWUnit()
            ..getLUnit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AirCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => LandCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => SeaCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => Mas4meCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => ReferralCodeCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => ContactCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => Easy2shipSettingsCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => ForgetPasswordCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => CalculateCubit()..getCountry(),
        ),
        BlocProvider(
          create: (BuildContext context) => Easy2ShipCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = AppCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: defaultColorWhite,
              textTheme: TextTheme(
                titleMedium: TextStyle(
                  color: defaultColorNavyBlue,
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                focusColor: defaultColorWhite,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: defaultColorOrange,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: defaultColorNavyBlue,
                  ),
                ),
                prefixIconColor: defaultColorNavyBlue,
                suffixIconColor: defaultColorNavyBlue,
                labelStyle: TextStyle(
                  color: defaultColorNavyBlue,
                ),
              ),
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: defaultColorNavyBlue, //<-- SEE HERE
              ),
              appBarTheme: AppBarTheme(
                foregroundColor: defaultColorBlack,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: defaultColorTransparent,
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: defaultColorWhite,
                iconTheme: IconThemeData(
                  color: defaultColorNavyBlue,
                ),
                elevation: 0.0,
              ),
            ),
            locale: Locale(cubit.appLanguage),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}

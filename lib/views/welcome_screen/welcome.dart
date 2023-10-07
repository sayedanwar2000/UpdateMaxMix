// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/network/local/cache_helper/cache.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/controller/states/login_states.dart';
import 'package:masmix/views/home_screen/home_screen.dart';
import 'package:masmix/views/sign_in_screen/signin.dart';
import 'package:masmix/views/sign_up_screen/first_sign_up.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//this class to check if user log in before
// if user is log in navigate to home screen
// else navigate to Welcome screen
class ShowScreen extends StatelessWidget {
  String username = CacheHelper.getData(key: 'username') ?? '';
  String password = CacheHelper.getData(key: 'password') ?? '';

  ShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      builder: (context, state) {
        if (username.isEmpty || password.isEmpty) {
          return const WelcomeScreen();
        } else {
          var cubit = LoginCubit.get(context);
          cubit.userLogin(email: username, password: password);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 20,
                end: 20,
              ),
              child: Center(child: Image.asset('asset/images/logoname.png')),
            ),
          );
        }
      },
      listener: (context, state) {
        if (state is LoginSuccessState) {
          navigateAndFinish(context, HomeScreen());
        }
      },
    );
  }
}

//This Class Display First Screen When you open the app
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20,
              end: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('asset/images/logoname.png'),
                const SizedBox(
                  height: 10,
                ),
                Lottie.asset('asset/lottie/fpage.json'),
                const SizedBox(
                  height: 10,
                ),
                defaultButton(
                  width: double.infinity,
                  text: AppLocalizations.of(context)!.login,
                  function: () {
                    navigateto(context, SigninScreen());
                  },
                  color: defaultColorOrange,
                ),
                const SizedBox(
                  height: 10,
                ),
                defaultButton(
                  width: double.infinity,
                  text: AppLocalizations.of(context)!.registerButton,
                  function: () {
                    navigateto(context, FirstSignupScreen());
                  },
                  color: defaultColorOrange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

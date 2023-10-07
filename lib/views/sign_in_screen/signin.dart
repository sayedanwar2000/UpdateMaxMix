// ignore_for_file: must_be_immutable

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/text_form_field.dart';
import 'package:masmix/controller/share/network/local/cache_helper/cache.dart';
import 'package:masmix/controller/states/login_states.dart';
import 'package:masmix/views/forget_password_screen/forget_password_screen.dart';
import 'package:masmix/views/sign_up_screen/first_sign_up.dart';
import 'package:masmix/views/home_screen/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../controller/share/style/colors.dart';

//this class to display log in screen
class SigninScreen extends StatelessWidget {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  var formKey = GlobalKey<FormState>();

  SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loginCubit = LoginCubit.get(context);

    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          CacheHelper.saveData(key: 'userID', value: loginCubit.loginModel.id)
              .then((value) {
            CacheHelper.saveData(key: 'username', value: username.text)
                .then((value) {
              if (value) {
                CacheHelper.saveData(key: 'password', value: password.text)
                    .then((value) {
                  if (value) {
                    navigateAndFinish(context, HomeScreen());
                  }
                });
              }
            });
          });
        } else if (state is LoginErrorState) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'ُError!',
              message: 'Incorrect E-mail or Password',
              contentType: ContentType.failure,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: Container(
              child: Center(
                child: SingleChildScrollView(
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: defaultColorOrange,
                      ),
                      borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: defaultColorOrange,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              bottom: 20,
                            ),
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.headerLogin,
                                style: TextStyle(
                                  color: defaultColorWhite,
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 40.0,
                            bottom: 40.0,
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                defaultTextFormField(
                                  controll: username,
                                  type: TextInputType.text,
                                  validat: (String? value) {
                                    if (value!.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .userNameError;
                                    }
                                  },
                                  label: AppLocalizations.of(context)!.userName,
                                  prefix: Icons.person,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                defaultTextFormField(
                                  controll: password,
                                  type: TextInputType.text,
                                  validat: (String? value) {
                                    if (value!.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .passwordError;
                                    }
                                  },
                                  label: AppLocalizations.of(context)!.password,
                                  prefix: Icons.lock,
                                  isPassword: loginCubit.isPassword,
                                  suffix: loginCubit.suffix,
                                  suffixPressed: () {
                                    loginCubit.changePasswordVisibility();
                                  },
                                ),
                                defaultTextButton(
                                  function: () {
                                    navigateto(context, ForgetPassword());
                                  },
                                  text: AppLocalizations.of(context)!
                                      .forgetPassword,
                                ),
                                state is! LoginLoadingState
                                    ? defaultButton(
                                        text:
                                            AppLocalizations.of(context)!.login,
                                        function: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            loginCubit.userLogin(
                                                email: username.text,
                                                password: password.text);
                                          }
                                        },
                                        width: double.infinity,
                                        color: defaultColorOrange,
                                      )
                                    : Center(
                                        child: CircularProgressIndicator(
                                          color: defaultColorOrange,
                                        ),
                                      ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(child: myDivider()),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                        start: 5,
                                        end: 5,
                                      ),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .continueWith,
                                      ),
                                    ),
                                    Expanded(
                                      child: myDivider(),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: InkWell(
                                        onTap: (){
                                          //todo log in with google
                                        },
                                        child: Image.asset(
                                          'asset/images/google.png',
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    InkWell(
                                      onTap: (){
                                        //todo log in with apple
                                      },
                                      child: Image.asset(
                                        'asset/images/apple.png',
                                        width: 33,
                                        height: 33,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(AppLocalizations.of(context)!.account),
                                    defaultTextButton(
                                      function: () {
                                        navigateto(
                                            context, FirstSignupScreen());
                                      },
                                      text:
                                          AppLocalizations.of(context)!.signUp,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

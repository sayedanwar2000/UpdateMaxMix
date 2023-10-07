// ignore_for_file: must_be_immutable

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/app_cubit.dart';
import 'package:masmix/controller/cubits/signup_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/text_form_field.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/controller/states/signup_states.dart';
import 'package:masmix/views/sign_in_screen/signin.dart';
import 'package:masmix/views/sign_up_screen/second_sign_up.dart';
import 'package:masmix/controller/share/function_share/functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstSignupScreen extends StatelessWidget {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  var formKey = GlobalKey<FormState>();

  // List of items in our dropdown menu

  FirstSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var signupCubit = SignupCubit.get(context);
        var appCubit = AppCubit.get(context);
        signupCubit.countryCode =
            signupCubit.countryCode ?? appCubit.countryCodeList[0];
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
                                AppLocalizations.of(context)!.headerSignUp,
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
                            left: 10.0,
                            right: 10.0,
                          ),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: defaultTextFormField(
                                        controll: firstName,
                                        type: TextInputType.text,
                                        validat: (String? value) {
                                          if (value!.isEmpty) {
                                            return AppLocalizations.of(context)!
                                                .firstNameError;
                                          }
                                        },
                                        label: AppLocalizations.of(context)!
                                            .firstName,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: defaultTextFormField(
                                        controll: lastName,
                                        type: TextInputType.text,
                                        validat: (String? value) {
                                          if (value!.isEmpty) {
                                            return AppLocalizations.of(context)!
                                                .lastNameError;
                                          }
                                        },
                                        label: AppLocalizations.of(context)!
                                            .lastName,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                defaultTextFormField(
                                  controll: email,
                                  type: TextInputType.emailAddress,
                                  validat: (String? value) {
                                    if (value!.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .emailError;
                                    }
                                  },
                                  label: AppLocalizations.of(context)!.email,
                                  prefix: Icons.email,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: defaultDropdownSearch(
                                        items: appCubit.countryCodeList,
                                        onChang: (value) {
                                          signupCubit.changeCountryCode(value);
                                        },
                                        isSearch: true,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: defaultTextFormField(
                                        controll: phone,
                                        type: TextInputType.phone,
                                        validat: (String? value) {
                                          if (value!.isEmpty) {
                                            return AppLocalizations.of(context)!
                                                .phoneError;
                                          }
                                        },
                                        label:
                                            AppLocalizations.of(context)!.phone,
                                        prefix: Icons.phone,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      value: signupCubit.checkbox,
                                      activeColor: defaultColorOrange,
                                      onChanged: (value) {
                                        signupCubit.changeCheckbox(value!);
                                      },
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .masMix,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                functionsShare.launchInBrowser(
                                                  launchTo: 1,
                                                );
                                              },
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .privacyPolicy,
                                                style: TextStyle(
                                                    color: defaultColorBlue,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)!.and,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                functionsShare.launchInBrowser(
                                                  launchTo: 2,
                                                );
                                              },
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .terms,
                                                style: TextStyle(
                                                  color: defaultColorBlue,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                defaultButton(
                                  width: double.infinity,
                                  text: AppLocalizations.of(context)!.register,
                                  function: () {
                                    if (formKey.currentState!.validate()) {
                                      signupCubit.firstName = firstName.text;
                                      signupCubit.lastName = lastName.text;
                                      signupCubit.phone = phone.text;
                                      signupCubit.email = email.text;
                                      if (!signupCubit.checkbox) {
                                        final snackBar = SnackBar(
                                          elevation: 0,
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            title: 'Error!',
                                            message:
                                                'You must agree to our terms!',
                                            contentType: ContentType.failure,
                                          ),
                                        );
                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(snackBar);
                                      } else {
                                        navigateAndFinish(
                                            context, SecondSignupScreen());
                                      }
                                    }
                                  },
                                  color: defaultColorOrange,
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
                                    Text(
                                        AppLocalizations.of(context)!.account1),
                                    defaultTextButton(
                                      function: () {
                                        navigateto(context, SigninScreen());
                                      },
                                      text: AppLocalizations.of(context)!.login,
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

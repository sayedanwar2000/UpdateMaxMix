// ignore_for_file: must_be_immutable, non_constant_identifier_names, override_on_non_overriding_member

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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SecondSignupScreen extends StatelessWidget {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController State = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController referralCode = TextEditingController();
  TextEditingController companyCode = TextEditingController();
  TextEditingController voucherCode = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  PageController page = PageController(initialPage: 0);
  dynamic countryKey;
  dynamic accountTypeKey;
  dynamic languageKey;
  dynamic cityKey;
  dynamic currencyKey;

  SecondSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var signupCubit = SignupCubit.get(context);
    var appCubit = AppCubit.get(context);
    firstName.text = signupCubit.firstName;
    lastName.text = signupCubit.lastName;
    email.text = signupCubit.email;
    phone.text = signupCubit.phone;
    var formKey = GlobalKey<FormState>();
    var formkey = GlobalKey<FormState>();
    return BlocConsumer<SignupCubit, SignupStates>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Oh Hey!!',
              message: '${signupCubit.State}',
              contentType: ContentType.success,
              // to configure for material banner
              inMaterialBanner: true,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
          navigateAndFinish(context, SigninScreen());
        } else if (state is SignupErrorState) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Error!',
              message: '${signupCubit.State}!',
              contentType: ContentType.failure,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        signupCubit.accountType =
            signupCubit.accountType ?? appCubit.accountTypeList[0];
        accountTypeKey = appCubit.getAccountTypKey(appCubit.accountTypeList[0]);
        signupCubit.language = signupCubit.language ?? appCubit.languageList[0];
        languageKey = appCubit.getLanguageKey(appCubit.languageList[0]);
        signupCubit.city = signupCubit.city ?? appCubit.city[0];
        cityKey = appCubit.getCityKey(appCubit.city[0]);
        signupCubit.country = signupCubit.country ?? appCubit.countryList[0];
        countryKey = appCubit.getCountryKey(appCubit.countryList[0]);
        signupCubit.currency = signupCubit.currency ?? appCubit.currencyList[0];
        currencyKey = appCubit.getCurrencyKey(appCubit.currencyList[0]);
        return Scaffold(
          appBar: AppBar(),
          body: PageView(
            controller: page,
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.accountInfo),
                        const SizedBox(
                          height: 20.0,
                        ),
                        myDivider(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: defaultField(
                                label: AppLocalizations.of(context)!.firstName,
                                widget: defaultTextFormField(
                                  controll: firstName,
                                  type: TextInputType.text,
                                  validat: (String? value) {
                                    if (value!.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .firstNameError;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: defaultField(
                                label: AppLocalizations.of(context)!.lastName,
                                widget: defaultTextFormField(
                                  controll: lastName,
                                  type: TextInputType.text,
                                  validat: (String? value) {
                                    if (value!.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .lastNameError;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: defaultField(
                                label:
                                    AppLocalizations.of(context)!.countryCode,
                                widget: defaultDropdownSearch(
                                  items: appCubit.countryCodeList,
                                  onChang: (value) {
                                    signupCubit.changeCountryCode(value);
                                  },
                                  isSearch: true,
                                  selected: signupCubit.countryCode,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: defaultField(
                                label: AppLocalizations.of(context)!.phoneNo,
                                widget: defaultTextFormField(
                                  controll: phone,
                                  type: TextInputType.phone,
                                  validat: (String? value) {
                                    if (value!.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .phoneError;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultField(
                          label: AppLocalizations.of(context)!.email,
                          widget: defaultTextFormField(
                            controll: email,
                            type: TextInputType.emailAddress,
                            validat: (String? value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!.emailError;
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultField(
                          label: AppLocalizations.of(context)!.password,
                          widget: defaultTextFormField(
                            controll: password,
                            type: TextInputType.visiblePassword,
                            validat: (String? value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .passwordError;
                              }
                              return null;
                            },
                            isPassword: signupCubit.isPassword,
                            suffix: signupCubit.suffix,
                            suffixPressed: () {
                              signupCubit.changePasswordVisibility();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultField(
                          label: AppLocalizations.of(context)!.confirmPassword,
                          widget: defaultTextFormField(
                            controll: confirmPassword,
                            type: TextInputType.visiblePassword,
                            validat: (String? value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .confirmPasswordError;
                              }
                              if (password.text != confirmPassword.text) {
                                return AppLocalizations.of(context)!
                                    .passwordError2;
                              }
                              return null;
                            },
                            isPassword: signupCubit.isPasswordConfirm,
                            suffix: signupCubit.confirmSuffix,
                            suffixPressed: () {
                              signupCubit.changePasswordConfirmVisibility();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: defaultField(
                                label:
                                    AppLocalizations.of(context)!.accountType,
                                widget: defaultDropdownSearch(
                                  items: appCubit.accountTypeList,
                                  height: 100,
                                  onChang: (value) {
                                    signupCubit.accountType = value;
                                    accountTypeKey =
                                        appCubit.getAccountTypKey(value);
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: defaultField(
                                label: AppLocalizations.of(context)!.language,
                                widget: defaultDropdownSearch(
                                  items: appCubit.languageList,
                                  height: 100,
                                  onChang: (value) {
                                    signupCubit.language = value;
                                    languageKey =
                                        appCubit.getLanguageKey(value);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                            children: [
                              const Spacer(),
                              defaultButton(
                                text: AppLocalizations.of(context)!.nextButton,
                                width: 100,
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    signupCubit.password = password.text;
                                    signupCubit.confirmPassword =
                                        confirmPassword.text;
                                    page.animateToPage(++signupCubit.pageIndex,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.linearToEaseOut);
                                  }
                                },
                                color: defaultColorOrange,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.addressInfo),
                        const SizedBox(
                          height: 20.0,
                        ),
                        myDivider(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: defaultField(
                                label: AppLocalizations.of(context)!.country,
                                widget: defaultDropdownSearch(
                                  items: appCubit.countryList,
                                  onChang: (value) {
                                    signupCubit.country = value;
                                    countryKey = appCubit.getCountryKey(value);
                                  },
                                  isSearch: true,
                                  selected: signupCubit.country,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: defaultField(
                                label: AppLocalizations.of(context)!.state,
                                widget: defaultTextFormField(
                                  controll: State,
                                  type: TextInputType.text,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: defaultField(
                                label: AppLocalizations.of(context)!.city,
                                widget: defaultDropdownSearch(
                                  items: appCubit.city,
                                  onChang: (value) {
                                    signupCubit.city = value;
                                    cityKey = appCubit.getCityKey(value);
                                  },
                                  isSearch: true,
                                  selected: signupCubit.city,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: defaultField(
                                label: AppLocalizations.of(context)!.zip,
                                widget: defaultTextFormField(
                                  controll: postalCode,
                                  type: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultField(
                          label: AppLocalizations.of(context)!.address,
                          widget: defaultTextFormField(
                            controll: address,
                            type: TextInputType.text,
                            validat: (String? value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .addressError;
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        myDivider(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: defaultField(
                                label: AppLocalizations.of(context)!.currency,
                                widget: defaultDropdownSearch(
                                  height: 160,
                                  items: appCubit.currencyList,
                                  onChang: (value) {
                                    signupCubit.currency = value;
                                    currencyKey =
                                        appCubit.getCurrencyKey(value);
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: defaultField(
                                label: AppLocalizations.of(context)!
                                    .titleReferralCodeScreen,
                                widget: defaultTextFormField(
                                  controll: referralCode,
                                  type: TextInputType.text,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: defaultField(
                                label:
                                    AppLocalizations.of(context)!.companyCode,
                                widget: defaultTextFormField(
                                  controll: companyCode,
                                  type: TextInputType.text,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: defaultField(
                                label:
                                    AppLocalizations.of(context)!.voucherCode,
                                widget: defaultTextFormField(
                                  controll: voucherCode,
                                  type: TextInputType.text,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                            children: [
                              defaultButton(
                                text: AppLocalizations.of(context)!.backButton,
                                width: 100,
                                function: () {
                                  page.animateToPage(--signupCubit.pageIndex,
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.linearToEaseOut);
                                },
                                color: defaultColorOrange,
                              ),
                              const Spacer(),
                              defaultButton(
                                text: AppLocalizations.of(context)!
                                    .registerButton,
                                width: 100,
                                function: () {
                                  if (formkey.currentState!.validate()) {
                                    signupCubit.userSigup(
                                      email: email.text,
                                      password: password.text,
                                      IPAddress: appCubit.ipAddress,
                                      country_code: '',
                                      account_type: accountTypeKey,
                                      account_type_name:
                                          signupCubit.accountType,
                                      default_language: languageKey,
                                      referral_code: referralCode.text,
                                      f_name: firstName.text,
                                      l_name: lastName.text,
                                      mob: phone.text,
                                      phone_country_code:
                                          signupCubit.countryCode,
                                      invoice_address: address.text,
                                      invoice_country_code: countryKey,
                                      invoice_state_code: State.text,
                                      invoice_city_code: cityKey,
                                      invoice_zip_postal_code: postalCode.text,
                                      currency: currencyKey,
                                      voucher_code: companyCode.text,
                                      company_code: voucherCode.text,
                                    );
                                  }
                                },
                                color: defaultColorOrange,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

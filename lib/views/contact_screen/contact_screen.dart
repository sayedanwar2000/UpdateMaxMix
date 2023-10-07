// ignore_for_file: must_be_immutable

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/contact_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/components/text_form_field.dart';
import 'package:masmix/controller/share/function_share/functions.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/controller/states/contact_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//this class to display contact us
class ContactScreen extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController message = TextEditingController();
  TextEditingController email = TextEditingController();
  var formKey = GlobalKey<FormState>();

  ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var contactCubit = ContactCubit.get(context);
    return BlocConsumer<ContactCubit, ContactStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: defaultColorNavyBlue,
          appBar: AppBar(
            backgroundColor: defaultColorNavyBlue,
            elevation: 0.0,
            iconTheme: IconThemeData(color: defaultColorWhite),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: defaultColorNavyBlue,
              statusBarIconBrightness: Brightness.light,
            ),
          ),
          endDrawer: defaultDrawer(context: context),
          body: SingleChildScrollView(
            child: Container(
              color: defaultColorNavyBlue,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 15.0,
                        left: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.contactDetails,
                            style: TextStyle(
                              color: defaultColorWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .contactDetailsDescription1,
                            style: TextStyle(
                              color: defaultColorWhite,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .contactDetailsDescription2,
                            style: TextStyle(
                              color: defaultColorWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadiusDirectional.only(
                            topEnd: Radius.circular(40),
                            topStart: Radius.circular(40),
                          ),
                          color: defaultColorWhite,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              //todo add whatsapp
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  defaultButton(
                                    function: () {
                                      functionsShare.launchInBrowser(
                                        launchTo: 5,
                                      );
                                    },
                                    color: defaultColoGreen,
                                    widget: Row(
                                      children: [
                                        Image.asset(
                                            "asset/images/whatsapp-24.png"),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'KSA',
                                          style: TextStyle(
                                              color: defaultColorWhite,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  defaultButton(
                                    function: () {
                                      functionsShare.launchInBrowser(
                                        launchTo: 4,
                                      );
                                    },
                                    color: defaultColoGreen,
                                    widget: Row(
                                      children: [
                                        Image.asset(
                                            "asset/images/whatsapp-24.png"),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'USA',
                                          style: TextStyle(
                                              color: defaultColorWhite,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: [
                                  Expanded(child: myDivider()),
                                  const Padding(
                                    padding: EdgeInsetsDirectional.only(
                                      start: 5,
                                      end: 5,
                                    ),
                                    child: Text(
                                      'OR',
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
                              defaultTextFormField(
                                controll: name,
                                type: TextInputType.text,
                                prefix: Icons.person_outline_outlined,
                                label: AppLocalizations.of(context)!.name,
                                validat: (String? value) {
                                  if (value!.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .nameError;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              defaultTextFormField(
                                controll: email,
                                type: TextInputType.emailAddress,
                                prefix: Icons.alternate_email_outlined,
                                label: AppLocalizations.of(context)!.email,
                                validat: (String? value) {
                                  if (value!.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .emailError;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              defaultTextFormField(
                                controll: message,
                                type: TextInputType.text,
                                prefix: Icons.email_outlined,
                                label: AppLocalizations.of(context)!.message,
                                maxline: 5,
                                validat: (String? value) {
                                  if (value!.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .messageError;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: contactCubit.checkbox,
                                    onChanged: (value) {
                                      contactCubit.changeCheckBox();
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
                                                  launchTo: 1);
                                            },
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .privacyPolicy,
                                              style: TextStyle(
                                                  color: defaultColorBlue,
                                                  fontWeight: FontWeight.w500),
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
                                                  launchTo: 2);
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
                              const SizedBox(
                                height: 20.0,
                              ),
                              //this button to submit message
                              defaultButton(
                                text:
                                    AppLocalizations.of(context)!.submitButton,
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    if (!contactCubit.checkbox) {
                                      final snackBar = SnackBar(
                                        elevation: 0,
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                          title: AppLocalizations.of(context)!
                                              .error,
                                          message: AppLocalizations.of(context)!
                                              .contactError,
                                          contentType: ContentType.failure,
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(snackBar);
                                    } else {
                                      contactCubit.submitContact(
                                        name: name.text,
                                        email: email.text,
                                        message: message.text,
                                      );
                                    }
                                  }
                                },
                                color: defaultColorNavyBlue,
                              ),
                              const SizedBox(
                                height: 40.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is SubmitContactSuccessState) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: AppLocalizations.of(context)!.success,
              message: contactCubit.returnMessage,
              contentType: ContentType.success,
              // to configure for material banner
              inMaterialBanner: true,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      },
    );
  }
}

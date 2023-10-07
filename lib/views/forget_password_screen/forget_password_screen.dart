// ignore_for_file: must_be_immutable

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/forget_password_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/text_form_field.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:masmix/controller/states/forget_password_states.dart';
import 'package:masmix/views/forget_password_screen/change_forget_password_screen.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    var forgetPassword = ForgetPasswordCubit.get(context);
    return BlocConsumer<ForgetPasswordCubit,ForgetPasswordStates>(
      listener: (context, state) {
        if (state is SuccessForgetPasswordStates) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Success',
              message: forgetPassword.messageSendCode,
              contentType: ContentType.success,
              // to configure for material banner
              inMaterialBanner: true,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
          navigateto(context, ChangeForgetPassword());
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.90,
              height: 400,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: defaultColorOrange,
                  ),
                  borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.findAccount,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        myDivider(),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          AppLocalizations.of(context)!.findAccount1,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultTextFormField(
                          controll: email,
                          type: TextInputType.emailAddress,
                          colorBorder: defaultColorOrange,
                          colorBorderFocuse: defaultColorOrange,
                          hintText: 'Email Address',
                          validat: (String? value){
                            if(value!.isEmpty) {
                              return AppLocalizations.of(context)!.emailError;
                            }
                            return null;
                          }
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        myDivider(),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            defaultButton(
                              function: () {
                                Navigator.pop(context);
                              },
                              color: defaultColorLightOrange,
                              width: 90,
                              text: AppLocalizations.of(context)!.cancel,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            defaultButton(
                              function: () {
                                navigateto(context, ChangeForgetPassword());
                                if(formKey.currentState!.validate()) {
                                  forgetPassword.changeEmail(email.text);
                                  forgetPassword.forgetPassword(email: email.text);
                                }
                              },
                              color: defaultColorLightOrange,
                              width: 90,
                              text: AppLocalizations.of(context)!.submitButton,
                            ),
                          ],
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

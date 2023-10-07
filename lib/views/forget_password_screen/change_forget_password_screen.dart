// ignore_for_file: must_be_immutable

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:masmix/controller/cubits/forget_password_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/text_form_field.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/controller/states/forget_password_states.dart';
import 'package:masmix/views/sign_in_screen/signin.dart';

class ChangeForgetPassword extends StatelessWidget {
  ChangeForgetPassword({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController code = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController reTypePassword = TextEditingController();
    var forgetPasswordCubit = ForgetPasswordCubit.get(context);
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
      listener: (context, state) {
        print(state);
        if (state is SuccessChangeForgetPasswordStates) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Success',
              message: forgetPasswordCubit.messageChangePassword,
              contentType: ContentType.success,
              // to configure for material banner
              inMaterialBanner: true,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
          navigateAndFinish(context, SigninScreen());
        } else if (state is ErrorChangeForgetPasswordStates) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Error',
              message: forgetPasswordCubit.messageChangePassword,
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
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.changePassword),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultTextFormField(
                        controll: code,
                        type: TextInputType.number,
                        label: AppLocalizations.of(context)!.code,
                        colorBorderFocuse: defaultColorNavyBlue,
                        prefix: Icons.code,
                        validat: (String? value) {
                          if (value!.isEmpty) {
                            return AppLocalizations.of(context)!.codeError;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultTextFormField(
                        controll: password,
                        type: TextInputType.text,
                        label: AppLocalizations.of(context)!.newPassword,
                        colorBorderFocuse: defaultColorNavyBlue,
                        prefix: Icons.key,
                        suffix: forgetPasswordCubit.suffix,
                        isPassword: forgetPasswordCubit.isPassword,
                        suffixPressed: () {
                          forgetPasswordCubit.changePasswordVisibility();
                        },
                        validat: (String? value) {
                          if (value!.isEmpty) {
                            return AppLocalizations.of(context)!.passwordError;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultTextFormField(
                        controll: reTypePassword,
                        type: TextInputType.text,
                        label: AppLocalizations.of(context)!.reTypePassword,
                        colorBorderFocuse: defaultColorNavyBlue,
                        prefix: Icons.key,
                        isPassword: forgetPasswordCubit.isReTypePassword,
                        suffix: forgetPasswordCubit.suffixReType,
                        suffixPressed: () {
                          forgetPasswordCubit.changeReTypePasswordVisibility();
                        },
                        validat: (String? value) {
                          if (value!.isEmpty) {
                            return AppLocalizations.of(context)!.passwordError;
                          } else if (password.text != reTypePassword.text) {
                            return AppLocalizations.of(context)!.passwordError2;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultButton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            forgetPasswordCubit.changeForgetPassword(
                              newPassword: password.text,
                              code: code.text,
                            );
                          }
                        },
                        color: defaultColorNavyBlue,
                        text: AppLocalizations.of(context)!.updatePassword,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultButton(
                        function: () {
                          Navigator.pop(context);
                        },
                        color: defaultColorGrey,
                        text: AppLocalizations.of(context)!.cancel,
                      ),
                    ],
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

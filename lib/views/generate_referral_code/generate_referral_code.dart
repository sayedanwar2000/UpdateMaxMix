import 'package:flutter/material.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/cubits/referral_code_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/text_form_field.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

generateReferralCode({
  required context,
  required referralCode,
}) {
  var loginCubit = LoginCubit.get(context);
  var referralCubit = ReferralCodeCubit.get(context);
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.generateReferralCode),
          content: SizedBox(
            height: 200,
            child: Center(
              child: Column(
                children: [
                  // const Text('sayed'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  defaultTextFormField(
                    controll: referralCode,
                    type: TextInputType.text,
                    showCursor: false,
                    readOnly: true,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  if (referralCode.text.isEmpty)
                    defaultButton(
                      text: AppLocalizations.of(context)!.create,
                      function: () {
                        referralCubit.generateReferralCode(
                          userId: loginCubit.loginModel.id,
                        );
                        // referralCode.text = loginCubit.loginModel.myReferralCode!;
                      },
                      color: defaultColorNavyBlue,
                    ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  defaultButton(
                    text: AppLocalizations.of(context)!.backButton,
                    function: () {
                      Navigator.of(context).pop();
                    },
                    color: defaultColorNavyBlue,
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//this function to return card service in services screen
Widget cardService({
  required context,
  required lottie,
  required title,
  required contact,
  required goPage,
  padding,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 20.0,
      right: 20.0,
    ),
    child: Center(
      child: Card(
        elevation: 10,
        shadowColor: defaultColorLightOrange,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: defaultColorOrange,
          ),
          borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
        ),
        child: Column(
          children: [
            Lottie.asset(lottie),
            Padding(
              padding: EdgeInsets.only(
                top: padding??0
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                contact,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            defaultButton(
              text: AppLocalizations.of(context)!.goButton,
              function: () {
                navigateto(context, goPage);
              },
              color: defaultColorOrange,
              width: 100,
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    ),
  );
}

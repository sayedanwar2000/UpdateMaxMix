// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/stripe_payment/payment_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstPaymentScreen extends StatelessWidget {
  String serviceName;
  String price;
  FirstPaymentScreen(this.price,this.serviceName, {super.key});

  @override
  Widget build(BuildContext context) {
    var userData = LoginCubit.get(context).loginModel;
    return Scaffold(
      backgroundColor: defaultColorNavyBlue,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: defaultColorTransparent,
        iconTheme: IconThemeData(
          color: defaultColorWhite,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 130,
              backgroundColor: defaultColorWhite,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      serviceName,
                      style: TextStyle(color: defaultColorGrey, fontSize: 30.0),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$$price',
                      style: TextStyle(
                        color: defaultColorNavyBlue,
                        fontSize: 50.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            defaultButton(
              text: AppLocalizations.of(context)!.payButton,
              width: 100.0,
              colorText: defaultColorNavyBlue,
              function: () => PaymentManager.makePayment(double.parse(price), "${userData.currencyName}" ,userData.userUname!),
              color: defaultColorWhite,
            ),
          ],
        ),
      ),
    );
  }
}

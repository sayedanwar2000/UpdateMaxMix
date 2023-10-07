// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:masmix/controller/share/components/alert_dialog.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/views/my_quotation_pending_screen/my_quotation_pending_screen.dart';
import 'package:masmix/views/my_quotation_to_pay_screen/my_quotation_to_pay_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyQuotationScreen extends StatelessWidget {
  List quotation;
  List package;

  MyQuotationScreen(this.quotation, this.package, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Card(
                  elevation: 10,
                  // color: defaultColorNavyBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          IconButton(
                            onPressed: () => alertDialog(
                              context: context,
                              title: 'Pending Booking',
                            ),
                            icon: Icon(
                              Icons.help_outline,
                              color: defaultColorNavyBlue,
                            ),
                          ),
                        ],
                      ),
                      Lottie.asset('asset/lottie/pending.json'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      defaultButton(
                        width: double.infinity,
                        function: () {
                          navigateto(context, MyQuotationPending(quotation));
                        },
                        color: defaultColorOrange,
                        text: AppLocalizations.of(context)!.pendingBooking,
                        colorText: defaultColorWhite,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          IconButton(
                            onPressed: () => alertDialog(
                                context: context, title: 'Booking To Pay'),
                            icon: Icon(
                              Icons.help_outline,
                              color: defaultColorNavyBlue,
                            ),
                          ),
                        ],
                      ),
                      Lottie.asset('asset/lottie/BookingsToPay.json'),
                      const SizedBox(
                        height: 15.0,
                      ),
                      defaultButton(
                        function: () {
                          navigateto(context, MyQuotationToPay(package));
                        },
                        color: defaultColorOrange,
                        text: AppLocalizations.of(context)!.bookingsToPay,
                        colorText: defaultColorWhite,
                        width: 200,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

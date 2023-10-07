import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/views/payment_screen/first_payment_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//this function to return mas4me card in submit mas4me screen
Widget cardMas4me({
  required context,
  required mas4Me,
  required functionDetails,
  required functionBack,
  required isShow,
}) =>
    Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: defaultColorNavyBlue,
        ),
        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 2.0,
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: defaultColorNavyBlue,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const AutoSizeText(
                            'Site Name :',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: AutoSizeText(
                              '${mas4Me['site_name']}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          const AutoSizeText(
                            'Item Name :',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: AutoSizeText(
                              '${mas4Me['item_name']}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          const AutoSizeText(
                            'Quantity :',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: AutoSizeText(
                              '${mas4Me['quantity']}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          const AutoSizeText(
                            'Price :',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: AutoSizeText(
                              '${mas4Me['price']}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    defaultButton(
                      text: AppLocalizations.of(context)!.payButton,
                      function: () {
                        //TODO PAY MAS4ME
                        // navigateto(context,  FirstPaymentScreen());
                      },
                      color: defaultColorNavyBlue,
                      width: 100,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    if (!isShow)
                    defaultButton(
                      text: AppLocalizations.of(context)!.details,
                      function: functionDetails,
                      color: defaultColorNavyBlue,
                      width: 100,
                    ),
                  ],
                ),
              ],
            ),
            if (isShow)
              cardMas4MeDetails(
                context: context,
                mas4Me: mas4Me,
                functionBack: functionBack,
              ),
          ],
        ),
      ),
    );

//this function to return  details mas4me card in submit mas4me screen
Widget cardMas4MeDetails({
  required context,
  required mas4Me,
  required functionBack,
}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 350,
              child: Card(
                elevation: 10,
                color: defaultColorNavyBlue,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: defaultColorNavyBlue,
                  ),
                  borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 20.0,
                      ),
                      Container(
                        width: 2.0,
                        height: MediaQuery.of(context).size.height * 0.35,
                        color: defaultColorWhite,
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                AutoSizeText(
                                  'Site Name :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    '${mas4Me['site_name']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                AutoSizeText(
                                  'Site URL :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    '${mas4Me['site_url']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                AutoSizeText(
                                  'Item Name :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    '${mas4Me['item_name']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                AutoSizeText(
                                  'Item URL :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    '${mas4Me['item_url']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                AutoSizeText(
                                  'Options :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    '${mas4Me['options']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                AutoSizeText(
                                  'Price :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    '${mas4Me['price']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                AutoSizeText(
                                  'Quantity :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    '${mas4Me['quantity']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                AutoSizeText(
                                  'Status :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    '${mas4Me['status']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                AutoSizeText(
                                  'State :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    '${mas4Me['state']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                AutoSizeText(
                                  'Message :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    '${mas4Me['msg']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            defaultButton(
              text: AppLocalizations.of(context)!.backButton,
              width: 100,
              function: functionBack,
              color: defaultColorNavyBlue,
            ),
          ],
        ),
      ),
    );

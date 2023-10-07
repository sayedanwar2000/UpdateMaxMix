import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/views/payment_screen/first_payment_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//this function to return card Storage in my storage screen
Widget cardStorage({
  required context,
  required storage,
  required isShow,
  required functionDetails,
  required functionBack,
  isPay = false,
}) =>
    Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Card(
        elevation: 10,
        shadowColor: defaultColorLightOrange,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: defaultColorOrange,
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
                    height: 130.0,
                    color: defaultColorOrange,
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
                            const Text(
                              'Service ID :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Expanded(
                                child:
                                    Text('${storage["service_id"].toInt()}')),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Service Name :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Expanded(
                                child: AutoSizeText(
                                    '${storage["service_type_name"]}')),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Service Status :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Expanded(
                                child: Text('${storage["customer_status"]}')),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Request Date :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Expanded(
                                child:
                                    Text('${storage["service_date_submit"]}')),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      if (isPay)
                        Column(
                          children: [
                            defaultButton(
                              text: AppLocalizations.of(context)!.payButton,
                              function: () {
                                //TODO PAY STORAGE
                                // navigateto(context, FirstPaymentScreen());
                              },
                              color: defaultColorOrange,
                              width: 85,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      if (!isShow)
                        defaultButton(
                          text: AppLocalizations.of(context)!.details,
                          function: functionDetails,
                          color: defaultColorOrange,
                          width: 85,
                        ),
                    ],
                  ),
                ],
              ),
              if (isShow)
                cardStorageDetails(
                  context: context,
                  storage: storage,
                  functionBack: functionBack,
                ),
            ],
          ),
        ),
      ),
    );

//this function to return card Storage details in my storage screen
Widget cardStorageDetails({
  required context,
  required storage,
  required functionBack,
}) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 350,
            child: Directionality(
              textDirection: TextDirection.ltr,
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
                        height: 250.0,
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
                                Text(
                                  'Request Date :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Text(
                                    '${storage["service_date_submit"]}',
                                    style: TextStyle(
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
                                Text(
                                  'Service Name :',
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
                                    '${storage["service_type_name"]}',
                                    style: TextStyle(
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
                                Text(
                                  'Service Status :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Text(
                                    '${storage["customer_status"]}',
                                    style: TextStyle(
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
                                Text(
                                  'Service ID :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Text(
                                    '${storage["service_id"].toInt()}',
                                    style: TextStyle(
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
                                Text(
                                  'Currency :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Text(
                                    '${storage["CurrencyCode"]}',
                                    style: TextStyle(
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
                                Text(
                                  'Total Amount :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Text(
                                    '${storage["TotalAmount"]}',
                                    style: TextStyle(
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
                                Text(
                                  'Origin Country :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Text(
                                    '${storage["service_from_country_name"]}',
                                    style: TextStyle(
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
                                Text(
                                  'Origin City :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Text(
                                    '${storage["service_from_city_name"]}',
                                    style: TextStyle(
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
                                Text(
                                  'Date From :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Text(
                                    '${storage["date_from"]}',
                                    style: TextStyle(
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
                                Text(
                                  'Date To :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Text(
                                    '${storage["date_to"]}',
                                    style: TextStyle(
                                      color: defaultColorWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            if (storage["warehouse_size_desc"].isNotEmpty)
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      'Warehouse Size Description',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: defaultColorWhite,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ' :',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${storage["warehouse_size_desc"]}',
                                      style: TextStyle(
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
    );

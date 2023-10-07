import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/views/payment_screen/first_payment_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//this function to return Quotation card in my Quotation screen
Widget cardQuotationPending({
  required quotation,
  required context,
  required functionDetails,
  required functionBack,
  required isShow,
}) =>
    Padding(
      padding: const EdgeInsets.only(
        right: 10.0,
        left: 10.0,
      ),
      child: Card(
        elevation: 10,
        shadowColor: defaultColorLightOrange,
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
                    height: 100.0,
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
                                    Text('${quotation["service_id"].toInt()}')),
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
                                    '${quotation["service_type_name"]}')),
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
                                child: Text('${quotation["customer_status"]}')),
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
                                child: Text(
                                    '${quotation["service_date_submit"]}')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (!isShow)
                  defaultButton(
                    text: AppLocalizations.of(context)!.details,
                    function: functionDetails,
                    color: defaultColorNavyBlue,
                    width: 85,
                  ),
                ],
              ),
              if (isShow)
                cardQuotationPendingDetails(
                  context: context,
                  quotation: quotation,
                  functionBack: functionBack,
                ),
            ],
          ),
        ),
      ),
    );
//this function to return details Quotation card in my Quotation screen
Widget cardQuotationPendingDetails({
  required context,
  required quotation,
  required functionBack,
}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 400,
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
                  padding: const EdgeInsets.only(
                    right: 5.0,
                    left: 5.0,
                    top: 20.0,
                    bottom: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 20.0,
                      ),
                      Container(
                        width: 2.0,
                        height: 450,
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
                                    '${quotation["service_type_name"]}',
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
                                  'Service Date :',
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
                                    '${quotation["service_date"]}',
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
                                    '${quotation['service_date_submit']}',
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
                                    '${quotation['customer_status']}',
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
                                    '${quotation['service_id'].toInt()}',
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
                                  'Weight Charge :',
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
                                    '${quotation['WeightCharge']}',
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
                                    '${quotation['TotalAmount']}',
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
                                  'Total Tax Amount :',
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
                                    '${quotation['TotalTaxAmount']}',
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
                                    '${quotation['CurrencyCode']}',
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
                            if (quotation['cumulative_weight'] != null)
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Cumulative Weight :',
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
                                          '${quotation['cumulative_weight']}',
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
                                ],
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
                                    '${quotation['service_from_country_name']}',
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
                                  width: 20.0,
                                ),
                                Expanded(
                                  child: Text(
                                    '${quotation['service_from_city_name']}',
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
                                  'Origin Airport/Port :',
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
                                    '${quotation['port_from_name']}',
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
                                AutoSizeText(
                                  'Destination Country :',
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
                                    '${quotation['service_to_country_name']}',
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
                                AutoSizeText(
                                  'Destination City :',
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
                                    '${quotation['service_to_city_name']}',
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
                                AutoSizeText(
                                  'Destination Airport/Port :',
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
                                    '${quotation['port_to_name']}',
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
                                AutoSizeText(
                                  'Courier :',
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
                                    '${quotation['courier']}',
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
//this function to return Quotation card in my payment screen
Widget cardQuotationToPay({
  required package,
  required context,
  isPay = false,
  required functionDetails,
  required functionBack,
  required isShow,
}) =>
    Padding(
      padding: const EdgeInsets.only(
        right: 10.0,
        left: 10.0,
      ),
      child: Card(
        elevation: 10,
        shadowColor: defaultColorLightOrange,
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
                    height: 100.0,
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
                                    Text('${package["service_id"].toInt()}')),
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
                                child:
                                    AutoSizeText('${package["service_type"]}')),
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
                                child: Text('${package["customer_status"]}')),
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
                                child: Text(
                                    '${package["service_date_submit"].split('T')[0]}')),
                          ],
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
                                //TODO PAY QUOTATION
                                // navigateto(context, FirstPaymentScreen());
                              },
                              color: defaultColorNavyBlue,
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
                        color: defaultColorNavyBlue,
                        width: 85,
                      ),
                    ],
                  ),
                ],
              ),
              if (isShow)
                cardQuotationToPayDetails(
                  context: context,
                  package: package,
                  functionBack: functionBack,
                ),
            ],
          ),
        ),
      ),
    );
//this function to return details Quotation card in my payment screen
Widget cardQuotationToPayDetails({
  required context,
  required package,
  required functionBack,
}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 400,
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
                  padding: const EdgeInsets.only(
                    right: 10.0,
                    left: 10.0,
                    top: 20.0,
                    bottom: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 20.0,
                      ),
                      Container(
                        width: 2.0,
                        height: 350,
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
                                  child: AutoSizeText(
                                    '${package["service_date_submit"]}',
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
                                  'Service Date :',
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
                                    '${package["service_date"]}',
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
                                  child: Text(
                                    '${package['service_type']}',
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
                                    '${package['service_id'].toInt()}',
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
                                    '${package['customer_status']}',
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
                                  'Height :',
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
                                    '${package['the_hieght']}',
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
                                  'Width :',
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
                                    '${package['the_width']}',
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
                                  'Length :',
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
                                    '${package['the_length']}',
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
                                  'Dimension Unit :',
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
                                    '${package['dimension_unit']}',
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
                                  'Weight :',
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
                                    '${package['the_weight']}',
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
                                  'Weight Unit :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                  child: Text(
                                    '${package['weight_unit']}',
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
                                  'Total Price :',
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
                                    '${package['total_price']}',
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
                            if (package['courier_name'].isNotEmpty)
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      AutoSizeText(
                                        'Courier Name :',
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
                                          '${package['courier_name']}',
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
                                ],
                              ),
                            Row(
                              children: [
                                AutoSizeText(
                                  'Service Price :',
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
                                    '${package['service_prs']}',
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
                            if (package['service_currency_name'] != null)
                              Column(
                                children: [
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
                                          '${package['service_currency_name']}',
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
                                ],
                              ),
                            Row(
                              children: [
                                AutoSizeText(
                                  'Date :',
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
                                    '${package['service_date']}',
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
              color: defaultColorNavyBlue),
        ],
      ),
    );

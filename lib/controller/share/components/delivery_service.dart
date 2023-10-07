import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masmix/controller/cubits/service_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//this function to display delivery Service
Widget deliveryService({
  required deliveryDate,
  required deliveryAddress,
  required zipCodeDelivery,
  required context,
  required cubit,
}) {
  var serviceCubit = ServiceCubit.get(context);
  return Column(
    children: [
      if (cubit.destMainServicesList.isEmpty ||
          cubit.destMainServicesList.length == 1)
        const SizedBox(
          height: 10,
        ),
      Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultField(
              label: AppLocalizations.of(context)!.deliveryDate,
              widget: defaultTextFormField(
                controll: deliveryDate,
                type: TextInputType.datetime,
                readOnly: true,
                ontap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(5050),
                  ).then((value) {
                    deliveryDate.text =
                        DateFormat.yMd().format(value!).replaceAll('/', '-');
                  });
                },
                validat: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!.errorDate;
                  }
                  return null;
                },
                prefix: Icons.calendar_today,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                if(serviceCubit.getCountryToKey(cubit.toCountry) == 10)
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: defaultField(
                          label: AppLocalizations.of(context)!.zipCode,
                          widget: defaultTextFormField(
                            controll: zipCodeDelivery,
                            type: TextInputType.number,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: defaultField(
                    label: AppLocalizations.of(context)!.deliveryCity,
                    widget: defaultDropdownSearch(
                      items: serviceCubit.cityToList,
                      isSearch: true,
                      onChang: (value) {
                        cubit.changeDeliveryCity(value);
                      },
                      selected: 'Select City',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            defaultField(
              label: AppLocalizations.of(context)!.deliveryAddress,
              widget: defaultTextFormField(
                controll: deliveryAddress,
                type: TextInputType.text,
                validat: (String? value){
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!.addressError;
                  }
                  return null;
                }
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

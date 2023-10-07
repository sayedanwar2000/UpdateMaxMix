import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masmix/controller/cubits/service_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//this function to display pick Up Service
Widget pickUpService({
  required pickupDate,
  required address,
  required zipCodePickup,
  required context,
  required cubit,
  required useAddress,
  isStorage = false,
}) {
  var serviceCubit = ServiceCubit.get(context);
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultField(
              label: AppLocalizations.of(context)!.pickUpDate,
              widget: defaultTextFormField(
                controll: pickupDate,
                type: TextInputType.datetime,
                readOnly: true,
                ontap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(5050),
                  ).then((value) {
                    pickupDate.text =
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
                if (serviceCubit.getCountryKey(cubit.fromCountry) == 10)
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: defaultField(
                            label: AppLocalizations.of(context)!.zipCode,
                            widget: defaultTextFormField(
                              controll: zipCodePickup,
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
                    label: AppLocalizations.of(context)!.pickUPCity,
                    widget: defaultDropdownSearch(
                      items: serviceCubit.city,
                      isSearch: true,
                      onChang: (value) {
                        cubit.changePickUpCity(value, isStorage: isStorage);
                      },
                      selected: 'Select City',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              value: useAddress,
              onChanged: (value) {
                cubit.changeUseAddress(isStorage: isStorage);
              }),
          Text(AppLocalizations.of(context)!.useAddress),
        ],
      ),
      if (useAddress)
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child: defaultField(
            label: AppLocalizations.of(context)!.address,
            widget: defaultTextFormField(
              controll: address,
              type: TextInputType.text,
              validat: (String? value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!.addressError;
                }
                return null;
              },
            ),
          ),
        ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/text_form_field.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//this function to return card Shipment Data
Widget cardShipmentData({
  required weight,
  required height,
  required length,
  required width,
  required unit1,
  required unit2,
  required hsCode,
  required delcaredValue,
  required functionWUnit,
  required functionLUnit,
}) =>
    Column(
      children: [
        Row(
          children: [
            Expanded(
              child: defaultTextFormField(
                controll: weight,
                type: TextInputType.number,
                label: 'Weight',
                validat: (value) {
                  if (value!.isEmpty) {
                    return 'Weight must be not empty';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: defaultDropdownSearch(
                items: unit1,
                height: 120.0,
                onChang: functionWUnit,
                selected: 'select Unit',
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            Expanded(
              child: defaultTextFormField(
                controll: height,
                type: TextInputType.number,
                label: 'Height',
                validat: (value) {
                  if (value!.isEmpty) {
                    return 'Height must be not empty';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: defaultTextFormField(
                controll: length,
                type: TextInputType.number,
                label: 'Length',
                validat: (value) {
                  if (value!.isEmpty) {
                    return 'Length must be not empty';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            Expanded(
              child: defaultTextFormField(
                controll: width,
                type: TextInputType.number,
                label: 'Width',
                validat: (value) {
                  if (value!.isEmpty) {
                    return 'Width must be not empty';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: defaultDropdownSearch(
                items: unit2,
                height: 120,
                onChang: functionLUnit,
                selected: 'select Unit',
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            Expanded(
              child: defaultTextFormField(
                label: 'HS Code',
                controll: hsCode,
                type: TextInputType.number,
                validat: (value) {
                  if (value!.isEmpty) {
                    return 'HS Code must be not empty';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: defaultTextFormField(
                label: 'Delcared Value',
                controll: delcaredValue,
                type: TextInputType.number,
                validat: (value) {
                  if (value!.isEmpty) {
                    return 'Delcared Value must be not empty';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
//this function to return container Shipment Data
Widget containerShipmentData({
  required functionAdd,
  required functionRemove,
  required Widget list,
  required limit,
  required context,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: defaultColorNavyBlue,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            list,
            Row(
              children: [
                if (limit > 1)
                  Expanded(
                    child: defaultButton(
                      text: AppLocalizations.of(context)!.removePackageButton,
                      function: functionRemove,
                      color: defaultColorNavyBlue,
                      colorText: defaultColorWhite,
                    ),
                  ),
                if (limit > 1)
                  const SizedBox(
                    width: 10,
                  ),
                if (limit < 7)
                  Expanded(
                    child: defaultButton(
                      text: AppLocalizations.of(context)!.addPackageButton,
                      function: functionAdd,
                      color: defaultColorNavyBlue,
                      colorText: defaultColorWhite,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );

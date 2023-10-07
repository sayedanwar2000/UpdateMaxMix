// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:masmix/controller/cubits/my_account_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/text_form_field.dart';
import 'package:masmix/controller/share/style/colors.dart';
// this function return card address in my account screen
Widget cardAddressInfo({
  required context,
  required countryList,
  required functionCountry,
  required selectCountry,
  required state,
  required address,
  required postalCode,
  required city,
  required functionCity,
  functionAdd,
  functionUpdate,
  functionDelete,
  required selectCity,
  isList = false,
  index,
}) {
  var myAccountCubit = MyAccountCubit.get(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            AppLocalizations.of(context)!.addressInfo,
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isList)
            Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '${index + 1}',
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
        ],
      ),
      const SizedBox(
        height: 20.0,
      ),
      myDivider(),
      const SizedBox(
        height: 20.0,
      ),
      Row(
        children: [
          Expanded(
            child: defaultField(
              label: AppLocalizations.of(context)!.country,
              widget: defaultDropdownSearch(
                items: countryList,
                isSearch: true,
                onChang: functionCountry,
                selected: selectCountry,
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: defaultField(
              label: AppLocalizations.of(context)!.state,
              widget: defaultTextFormField(
                controll: state,
                type: TextInputType.text,
              ),
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
            child: defaultField(
              label: AppLocalizations.of(context)!.city,
              widget: defaultDropdownSearch(
                items: city,
                isSearch: true,
                onChang: functionCity,
                selected: selectCity,
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: defaultField(
              label: AppLocalizations.of(context)!.zip,
              widget: defaultTextFormField(
                controll: postalCode,
                type: TextInputType.number,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 20.0,
      ),
      defaultField(
        label: AppLocalizations.of(context)!.address,
        widget: defaultTextFormField(
          controll: address,
          type: TextInputType.text,
        ),
      ),
      if (isList)
        Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!myAccountCubit.isAddList[index])
                  defaultButton(
                      function: functionAdd,
                      color: defaultColorNavyBlue,
                      text: 'ADD ADDRESS'),
                if (myAccountCubit.isAddList[index])
                  defaultButton(
                      function: functionUpdate,
                      color: defaultColorNavyBlue,
                      text: 'UPDATE ADDRESS'),
                const SizedBox(
                  width: 10,
                ),
                defaultButton(
                    function: functionDelete,
                    color: defaultColorRed,
                    text: 'DELETE ADDRESS'),
              ],
            ),
          ],
        ),
      const SizedBox(
        height: 20.0,
      ),
      myDivider(),
    ],
  );
}

// ignore_for_file: non_constant_identifier_names

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//this function to navigate to any screen and i can back
void navigateto(context, Widget Widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );

//this function to navigate to any screen and i can't back
void navigateAndFinish(context, Widget Widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ),
    (route) => false);

//this function to return button
Widget defaultButton({
  String? text,
  required function,
  required Color color,
  colorText,
  widget,
  double? width,
}) =>
    Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if(width != null)
          Container(
            color: Colors.transparent,
            width: width,
          ),
          MaterialButton(
            onPressed: function,
            child: widget ??
                Text(
                  text ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colorText ?? Colors.white,
                  ),
                ),
          ),
        ],
      ),
    );

//this function to return text button
Widget defaultTextButton({
  required function,
  required String text,
  TextStyle? textstyle,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text,
        //style: textstyle,
      ),
    );

//this function to return divider
Widget myDivider({
  double? Width,
}) =>
    Container(
      width: Width ?? double.infinity,
      height: 2.0,
      color: defaultColorLightGrey,
    );

//this function to return Drop down Search button
Widget defaultDropdownSearch({
  required var items,
  required onChang,
  selected,
  bool isSearch = false,
  double height = 350,
  dynamic colorBorderFocuse,
  dynamic colorBorder,
  validat,
}) =>
    DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: defaultColorGrey,
        ),
      ),
      child: DropdownSearch<String>(
        popupProps: PopupProps.menu(
          constraints: BoxConstraints(
            maxHeight: height,
          ),
          showSelectedItems: true,
          showSearchBox: isSearch,
        ),
        items: items,
        onChanged: onChang,
        validator: validat,
        selectedItem: selected ?? items[0],
        dropdownDecoratorProps: DropDownDecoratorProps(
          // textAlign: TextAlign.center,
          dropdownSearchDecoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorBorderFocuse ?? defaultColorOrange,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorBorder ?? defaultColorNavyBlue,
              ),
            ),
          ),
        ),
      ),
    );

Widget defaultField({
  required String label,
  required Widget widget,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
        ),
        const SizedBox(
          height: 15.0,
        ),
        widget,
      ],
    );

//this function to return empty screen
Widget isEmpty({
  required context,
}) =>
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu,
            size: 100,
            color: defaultColorGrey,
          ),
          Text(
            AppLocalizations.of(context)!.empty,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: defaultColorGrey,
            ),
          ),
        ],
      ),
    );

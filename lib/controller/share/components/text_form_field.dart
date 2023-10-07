import 'package:flutter/material.dart';
import 'package:masmix/controller/share/style/colors.dart';

//this function to return text form filed
Widget defaultTextFormField({
  required TextEditingController controll,
  required TextInputType type,
  validat,
  String? label,
  String? hintText,
  IconData? prefix,
  onSubmit,
  onChange,
  ontap,
  bool isEnabled = true,
  bool isPassword = false,
  IconData? suffix,
  suffixPressed,
  maxline = 1,
  showCursor = true,
  readOnly = false,
  textAlign,
  dynamic colorBorderFocuse,
  dynamic colorBorder,
}) =>
    TextFormField(
      maxLines: maxline,
      controller: controll,
      keyboardType: type,
      validator: validat,
      obscureText: isPassword,
      enabled: isEnabled,
      textAlign: textAlign ?? TextAlign.start,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      onTap: ontap,
      showCursor: showCursor,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
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
        hintStyle: TextStyle(color: defaultColorGrey),
        prefixIcon: prefix != null
            ? Icon(
          prefix,
        )
            : null,
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffix),
        )
            : null,
        border: const OutlineInputBorder(),

      ),
    );
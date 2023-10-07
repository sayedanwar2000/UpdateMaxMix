// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

//this function to return radio Button service (air - sea - land)
Widget radioButtonService({
  required context,
  required index,
  required onChanged,
  required character,
  required cubit,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Row(
          children: [
            Radio<String>(
              value: cubit.radioButtonList[index - 2],
              groupValue: character,
              onChanged: onChanged,
            ),
            Text(cubit.radioButtonList[index - 2]),
          ],
        ),
      ),
      if (cubit.radioButtonList.length > index - 1)
        Expanded(
          child: Row(
            children: [
              Radio<String>(
                value: cubit.radioButtonList[index - 1],
                groupValue: character,
                onChanged: onChanged,
              ),
              Text(cubit.radioButtonList[index - 1]),
            ],
          ),
        ),
    ],
  );
}

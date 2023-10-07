import 'package:flutter/material.dart';

//this function to return radio Button storage
Widget radioButtonStorage({
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
              value: cubit.radioButtonStorageList[index - 2],
              groupValue: character,
              onChanged: onChanged,
            ),
            Text(cubit.radioButtonStorageList[index - 2]),
          ],
        ),
      ),
      if (cubit.radioButtonStorageList.length > index - 1)
        Expanded(
          child: Row(
            children: [
              Radio<String>(
                value: cubit.radioButtonStorageList[index - 1],
                groupValue: character,
                onChanged: onChanged,
              ),
              Text(cubit.radioButtonStorageList[index - 1]),
            ],
          ),
        ),
    ],
  );
}
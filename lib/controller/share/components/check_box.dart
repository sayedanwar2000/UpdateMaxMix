// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

//this function to return check Boxes Origin Main Services
Widget checkBoxOriginMainServices({
  required context,
  required index,
  required list,
  required listCheckBox,
  required function1,
  required function2,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
                value: listCheckBox[index - 2],
                onChanged: function1,
            ),
            Text(list[index - 2]),
          ],
        ),
      ),
      if (list.length > index - 1)
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                  value: listCheckBox[index - 1],
                  onChanged: function2,
              ),
              Text(list[index - 1]),
            ],
          ),
        ),
    ],
  );
}

//this function to return check Boxes Dest Main Services
Widget checkBoxDestMainServices({
  required context,
  required index,
  required Cubit,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (Cubit.destMainServicesList[index - 2] != "Air Port")
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                  value: Cubit.checkBoxDest[index - 2],
                  onChanged: (bool? value) {
                    Cubit.changeCheckBoxDestMainServices(
                      index: index - 2,
                      value: value!,
                    );
                  }),
              Text(Cubit.destMainServicesList[index - 2]),
            ],
          ),
        ),
      if (Cubit.destMainServicesList.length > index - 1)
        if (Cubit.destMainServicesList[index - 1] != "Air Port")
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                    value: Cubit.checkBoxDest[index - 1],
                    onChanged: (value) {
                      Cubit.changeCheckBoxDestMainServices(
                        index: index - 1,
                        value: value!,
                      );
                    }),
                Text(Cubit.destMainServicesList[index - 1]),
              ],
            ),
          ),
    ],
  );
}

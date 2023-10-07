import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:masmix/controller/cubits/easy2ship_settings_cubit.dart';
import 'package:masmix/controller/share/style/colors.dart';

// this function return card address in easy2ship setting screen
Widget cardAddressEasy2Ship({
  required context,
  required address,
  required country,
  required city,
}) {
  var easyCubit = Easy2shipSettingsCubit.get(context);
  return SizedBox(
    width: double.infinity,
    child: Card(
      elevation: 10,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flag.fromString(
                  easyCubit.getFlag(country.toLowerCase()),
                  height: 30.0,
                  width: 30.0,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Text(
                  'MY ADDRESS',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                const Text(
                  'Address:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Text(
                    address,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                const Text(
                  'City:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Text(
                    city,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                const Text(
                  'Country:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Text(
                    country,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

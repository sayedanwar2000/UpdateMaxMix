import 'package:flutter/material.dart';
import 'package:masmix/controller/share/style/colors.dart';

//this function to return Referral Code Details card in Referral Code screen
Widget cardReferralCodeDetails({
  required user
}){

  return Padding(
    padding: const EdgeInsets.only(
      right: 10.0,
      left: 10.0,
    ),
    child: Card(
      elevation: 10,
      color: defaultColorNavyBlue,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: defaultColorNavyBlue,
        ),
        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10.0,
            ),
            Container(
              width: 2.0,
              height: 60,
              color: defaultColorWhite,
            ),
            const SizedBox(
              width: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      'Customer Name :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: defaultColorWhite,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '${user['name']}',
                      style: TextStyle(
                        color: defaultColorWhite,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Text(
                      'Sale Value :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: defaultColorWhite,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '${user['service_date']}',
                      style: TextStyle(
                        color: defaultColorWhite,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Text(
                      'Sale Price :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: defaultColorWhite,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '${user['service_prs']}',
                      style: TextStyle(
                        color: defaultColorWhite,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
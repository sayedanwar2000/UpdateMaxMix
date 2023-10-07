import 'package:flutter/material.dart';
import 'package:masmix/controller/cubits/referral_code_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/style/colors.dart';

//this function return card customer for referral code
Widget cardCustomerForReferralCode({
  required context,
}){
  var referral = ReferralCodeCubit.get(context);
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        elevation: 10,
        color: defaultColorNavyBlue,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: defaultColorNavyBlue,
          ),
          borderRadius:
          BorderRadius.circular(20.0), //<-- SEE HERE
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 140,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Customer Number',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: defaultColorWhite,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${referral.customersForReferralCode[0]['cust_no']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: defaultColorWhite,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Text(
                          'Sales Number',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: defaultColorWhite,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${referral.customersForReferralCode[0]['services_no']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: defaultColorWhite,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                defaultButton(
                  function: () {
                    referral.changeShowDetails(true);
                  },
                  color: defaultColorWhite,
                  text: 'Show Details',
                  colorText: defaultColorBlack,
                  width: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
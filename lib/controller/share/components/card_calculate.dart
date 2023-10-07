import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:masmix/controller/share/style/colors.dart';

//this function return card calculate in screen calculate
Widget cardCalculate({
required calculate,
})=> Padding(
  padding: const EdgeInsets.only(
    right: 10.0,
    left: 10.0,
  ),
  child: Card(
    elevation: 10,
    shadowColor: defaultColorLightOrange,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: defaultColorNavyBlue,
      ),
      borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 2.0,
            height: 100.0,
            color: defaultColorNavyBlue,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Text(
                      'Courier Name :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(child: Text('${calculate["courier_name"]}')),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    const Text(
                      'Service Name :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(child: AutoSizeText('${calculate["main_service_name"]}')),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    const Text(
                      'Weight :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(child: Text('${calculate["weight"]}')),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    const Text(
                      'Service Price :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(child: Text('${calculate["service_prs"]}')),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    const Text(
                      'Currency:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(child: Text('${calculate["currency"]}')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);
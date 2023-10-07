import 'package:flutter/material.dart';
import 'package:masmix/controller/share/style/colors.dart';

//this function to return card invoice in my invoice screen
Widget cardInvoice({
  required invoice,
  required function,
}) =>
    Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Card(
        elevation: 10,
        shadowColor: defaultColorLightOrange,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: defaultColorOrange,
          ),
          borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: 2.0,
                    height: 250.0,
                    color: defaultColorOrange,
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
                              'Service Type : ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Expanded(child: Text(invoice["service_type"])),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Order ID : ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Expanded(child: Text('${invoice["order_id"].toInt()}')),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            const Text(
                              'ID : ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Expanded(child: Text('${invoice["id"].toInt()}')),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Package ID : ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Expanded(child: Text('${invoice["package_id"].toInt()}')),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Start Date : ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Expanded(child: Text(invoice["start_date"].split('T')[0])),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        if(invoice["end_date"] != null)
                        Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'End Date : ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Expanded(child: Text(invoice["end_date"].split('T')[0] ?? '')),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Price : ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Expanded(child: Text('${invoice["price"]}')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

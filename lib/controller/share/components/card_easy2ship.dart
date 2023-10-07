import 'package:flutter/material.dart';
import 'package:masmix/controller/cubits/easy2ship_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/text_form_field.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/views/payment_screen/first_payment_screen.dart';

//this function to return card order in easy2ship screen
Widget cardEasy2ShipOrder({
  required functionDetails,
  required easy2ShipOrder,
  required iconExpendedOrder,
  required isExpendedOrder,
  required context,
  required index,
  required userId,
  required countryCode,
  required cityCode,
  required zip,
  required voucherCode,
}) {
  var easyCubit = Easy2ShipCubit.get(context);
  return Padding(
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
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'ID : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(easy2ShipOrder["order_id"].toString()),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Status : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              easy2ShipOrder['order_status'],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
                if (!easyCubit.editDeclareValue[index])
                  IconButton(
                    onPressed: functionDetails,
                    icon: Icon(iconExpendedOrder),
                  ),
                if (easyCubit.editDeclareValue[index])
                  defaultButton(
                      function: () {
                        easyCubit.changeEditDeclareValue(false, index);
                        easyCubit.getPackage(
                          orderId: easy2ShipOrder['order_id'].round(),
                          index: index,
                        );
                      },
                      color: defaultColorNavyBlue,
                      text: 'Cancel'),
              ],
            ),
            if (!easyCubit.editDeclareValue[index])
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 5,
                runSpacing: 10,
                children: [
                  if (int.parse(easy2ShipOrder['state']) == 0)
                    defaultButton(
                      function: () {
                        easyCubit.easy2ShipPrepare(
                          orderId: easy2ShipOrder['order_id'].round(),
                          state: int.parse(easy2ShipOrder['state']),
                          userId: userId,
                          index: index,
                        );
                      },
                      color: defaultColorNavyBlue,
                      text: 'Prepare My Packages',
                    ),
                  if (int.parse(easy2ShipOrder['state']) == 0)
                    defaultButton(
                      function: () {
                        easyCubit.changeEditDeclareValue(
                          true,
                          index,
                        );
                        easyCubit.getPackage(
                          orderId: easy2ShipOrder['order_id'].round(),
                          index: index,
                        );
                      },
                      color: defaultColorNavyBlue,
                      text: 'Edit Declared Value',
                    ),
                  //ToDo Delete Button
                  /*if (int.parse(easy2ShipOrder['state']) == 0)
                  defaultButton(
                    function: () {
                      easyCubit.easy2ShipPrepare(
                        orderId: easy2ShipOrder['order_id'].round(),
                        state: 7,
                        userId: userId,
                      );
                    },
                    color: defaultColorNavyBlue,
                    text: 'Delete',
                  ),*/
                  if (int.parse(easy2ShipOrder['state']) == 1)
                    defaultButton(
                      function: () {
                        easyCubit.cancelPackage(
                          orderId: easy2ShipOrder['order_id'].round(),
                        );
                      },
                      color: defaultColorNavyBlue,
                      text: 'Cancel Preparation',
                    ),
                  if (int.parse(easy2ShipOrder['state']) == 2)
                    defaultButton(
                      function: () {
                        easyCubit.easy2ShipShowPricePackage(
                          orderId: easy2ShipOrder['order_id'].round(),
                          state: int.parse(easy2ShipOrder['state']),
                          userId: userId,
                          countryCode: countryCode,
                          cityCode: cityCode,
                          zip: zip,
                          voucherCode: voucherCode,
                        );
                      },
                      color: defaultColorNavyBlue,
                      text: 'Pay',
                    ),
                  if (!easyCubit.isShowPayment[index] &&
                      int.parse(easy2ShipOrder['state']) == 4)
                    defaultButton(
                      function: () {
                        easyCubit.getShowPayment(
                          orderId: easy2ShipOrder['order_id'].round(),
                          bValue: true,
                          index: index,
                        );
                      },
                      color: defaultColorNavyBlue,
                      text: 'Show Payment',
                    ),
                  if (int.parse(easy2ShipOrder['state']) == 7)
                    defaultButton(
                      function: () {},
                      color: defaultColorNavyBlue,
                      text: 'Received',
                    ),
                ],
              ),
            if (isExpendedOrder || easyCubit.editDeclareValue[index])
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index1) => cardEasy2ShipPackage(
                  context: context,
                  package: easyCubit.easy2ShipPackage[index1],
                  isEdit: easyCubit.editDeclareValue[index],
                  index: index1,
                ),
                separatorBuilder: (context, index1) => const SizedBox(
                  height: 10,
                ),
                itemCount: easyCubit.easy2ShipPackage.length,
              ),
            if (easyCubit.isShowPayment[index])
              cardShowPaymentEasy2Ship(
                  context: context, order: easyCubit.showPayment, index: index),
          ],
        ),
      ),
    ),
  );
}

//this function to return card package of order in easy2ship screen
Widget cardEasy2ShipPackage({
  required context,
  required package,
  required isEdit,
  required index,
}) {
  var easyCubit = Easy2ShipCubit.get(context);
  TextEditingController declaredValue = TextEditingController();
  declaredValue.text = package['declared_value'].toString();
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: defaultColorNavyBlue,
        ),
        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Container(
                  width: 2.0,
                  height: 40,
                  color: defaultColorNavyBlue,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Desc : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(child: Text(package['pack_desc'])),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Barcode : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(child: Text(package['pack_barcode'])),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      if (easyCubit.isUpdateDeclareValue[index])
                        Row(
                          children: [
                            const Text(
                              'Declared Value : ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Expanded(child: Text(easyCubit.deValue[index])),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            if (isEdit && !easyCubit.isUpdateDeclareValue[index])
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: defaultTextFormField(
                        controll: declaredValue,
                        type: TextInputType.number,
                        label: 'Declared Value',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    defaultButton(
                      function: () {
                        easyCubit.easy2ShipEditPackage(
                          packageId: package['package_id'].round(),
                          declareValue: declaredValue.text,
                          index: index,
                        );
                      },
                      color: defaultColorNavyBlue,
                      text: 'Update',
                    ),
                  ],
                ),
              ),
            if (!isEdit)
              defaultButton(
                text: 'Photos',
                width: 80,
                function: () {
                  easyCubit.getPackageDetails(
                    packageId: package['package_id'].round(),
                  );
                },
                color: defaultColorNavyBlue,
              ),
          ],
        ),
      ),
    ),
  );
}

//this function to return card Show Payment of order in easy2ship screen
Widget cardShowPaymentEasy2Ship({
  required context,
  required order,
  required index,
}) {
  var easyCubit = Easy2ShipCubit.get(context);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: defaultColorNavyBlue,
        ),
        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Container(
                  width: 2.0,
                  height: 250,
                  color: defaultColorNavyBlue,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Order ID : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(child: Text(order['order_id'].toString())),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Courier Name : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(child: Text(order['courier_name'])),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Country Name : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(child: Text(order['country_name'])),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Service : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(child: Text(order['main_service_name'])),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Delivery Time : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                              child: Text(order['delivery_time'].toString())),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Tracking : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                              child: Text(order['tracking_id'].toString())),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Charged Weight : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                              child: Text(order['charged_weight'].toString())),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Shippment Cost : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                              child: Text(order['shippment_cost'].toString())),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Insurance : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(child: Text(order['insurance'].toString())),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Extra Service : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                              child: Text(order['extra_service'].toString())),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Dangerous Goods : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                              child: Text(order['danger_goods'].toString())),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Total Price : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                              child: Text(order['total_price'].toString())),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            defaultButton(
              text: 'Back',
              width: 80,
              function: () {
                easyCubit.changeIsShowPayment(false, index);
              },
              color: defaultColorNavyBlue,
            ),
          ],
        ),
      ),
    ),
  );
}

//this function to return card Show Price of package in Show Price package screen
Widget cardShowPriceEasy2Ship({
  required context,
  required state,
  required isAdd,
  required isRemove,
  required userId,
  required order,
  required index,
}) {
  var easyCubit = Easy2ShipCubit.get(context);
  String price = '';
  String serviceName = '';
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: defaultColorNavyBlue,
        ),
        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            if (!isAdd && !isRemove)
              dataShowPriceEasy2Ship(order: order),
            if (!easyCubit.addInsurance[index] &&
                easyCubit.removeInsurance[index] &&
                isAdd)
              dataShowPriceEasy2Ship(order: easyCubit.addInsuranceData[index]),
            if (easyCubit.addInsurance[index] &&
                !easyCubit.removeInsurance[index] &&
                isRemove)
              dataShowPriceEasy2Ship(
                  order: easyCubit.removeInsuranceData[index]),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                defaultButton(
                  text: 'PAY AND APPROVE',
                  function: () {
                    //TODO function pay
                    if (!isAdd && !isRemove){
                      serviceName = order['main_service_name'];
                      price = order['total_price'].toString();
                    }
                    else if (!easyCubit.addInsurance[index] &&
                        easyCubit.removeInsurance[index] &&
                        isAdd){
                      serviceName = easyCubit.addInsuranceData[index]['main_service_name'];
                      price = easyCubit.addInsuranceData[index]['total_price'].toString();
                    }
                    else if (easyCubit.addInsurance[index] &&
                        !easyCubit.removeInsurance[index] &&
                        isRemove){
                      serviceName = easyCubit.removeInsuranceData[index]['main_service_name'];
                      price = easyCubit.removeInsuranceData[index]['total_price'].toString();
                    }
                    navigateto(context, FirstPaymentScreen(price, serviceName));
                  },
                  color: defaultColorNavyBlue,
                ),
                const SizedBox(
                  width: 10,
                ),
                if (!isAdd)
                  defaultButton(
                    text: 'ADD INSURANCE',
                    function: () {
                      easyCubit.easy2ShipAddInsurancePackage(
                        orderId: order['order_id'].round(),
                        state: state,
                        userId: userId,
                        courierId: order['courier_id'].round(),
                        index: index,
                      );
                    },
                    color: defaultColorNavyBlue,
                  ),
                if (isAdd)
                  defaultButton(
                    text: 'Remove INSURANCE',
                    function: () {
                      easyCubit.easy2ShipRemoveInsurancePackage(
                        orderId: order['order_id'].round(),
                        state: state,
                        userId: userId,
                        courierId: order['courier_id'].round(),
                        index: index,
                      );
                    },
                    color: defaultColorNavyBlue,
                  ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

//this function to display data Show Price of package in Show Price package  screen
Widget dataShowPriceEasy2Ship({
  required order,
}) {
  return Row(
    children: [
      const SizedBox(
        width: 10.0,
      ),
      Container(
        width: 2.0,
        height: 200,
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
                  'Courier Name : ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(child: Text(order['courier_name'])),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                const Text(
                  'Service : ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(child: Text(order['main_service_name'])),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                const Text(
                  'Charged Weight : ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(child: Text(order['weight'].toString())),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                const Text(
                  'Insurance : ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(child: Text(order['insurance'].toString())),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                const Text(
                  'Extra Service : ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(child: Text(order['extra_service'].toString())),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                const Text(
                  'Dangerous Goods : ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(child: Text(order['danger_goods'].toString())),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                const Text(
                  'Declared Value : ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(child: Text(order['declared_value'].toString())),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                const Text(
                  'Total Price : ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(child: Text(order['total_price'].toString())),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

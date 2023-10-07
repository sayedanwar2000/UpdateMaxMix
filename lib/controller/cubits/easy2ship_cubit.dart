// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/endpointer.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/easy2ship_states.dart';

class Easy2ShipCubit extends Cubit<Easy2ShipStates> {
  Easy2ShipCubit() : super(InitialEasy2ShipStates());

  static Easy2ShipCubit get(context) => BlocProvider.of(context);
  int State = 0;
  List<String> deValue = [];
  List<Uint8List> images = [];
  List<IconData> iconExpendedOrder = [];
  List easy2ShipOrder = [];
  List isShowOrder = [];
  List isShowPayment = [];
  List easy2ShipPackage = [];
  List showPricePackage = [];
  List editDeclareValue = [];
  List isUpdateDeclareValue = [];
  List addInsurance = [];
  List addInsuranceData = [];
  List removeInsurance = [];
  List removeInsuranceData = [];

  Map<String, dynamic> showPayment = {};

  void changeIsShowOrder(index) {
    isShowOrder[index] = !isShowOrder[index];
    emit(ChangeIsShowOrderEasy2ShipStates());
  }

  void changeIsShowPayment(value, index) {
    isShowPayment[index] = value;
    emit(ChangeIsShowPaymentEasy2ShipStates());
  }

  void changeIsUpdateDeclareValue(value, index) {
    isUpdateDeclareValue[index] = value;
    emit(ChangeIsUpdateDeclareValueEasy2ShipStates());
  }

  void changeEditDeclareValue(value, index) {
    editDeclareValue[index] = value;
    emit(ChangeEditDeclareValueEasy2ShipStates());
  }

  void changeIconExpendedOrder(index) {
    iconExpendedOrder[index] = isShowOrder[index]
        ? Icons.arrow_drop_up_sharp
        : Icons.arrow_drop_down_sharp;
    emit(ChangeIconExpendedOrderEasy2ShipStates());
  }

  void getOrder({
    required id,
  }) {
    easy2ShipOrder = [];
    iconExpendedOrder = [];
    isShowOrder = [];
    emit(GetOrderEasy2ShipLoadingStates());
    DioHelper.postData(
      url: GetEasy2ShipOrders,
      data: {
        "user_id": id,
      },
    ).then((value) async {
      easy2ShipOrder = value.data;
      isShowOrder = List<bool>.generate(easy2ShipOrder.length, (i) => false);
      isShowPayment = List<bool>.generate(easy2ShipOrder.length, (i) => false);
      editDeclareValue =
          List<bool>.generate(easy2ShipOrder.length, (i) => false);
      iconExpendedOrder = List<IconData>.generate(
          easy2ShipOrder.length, (i) => Icons.arrow_drop_down_sharp);
      emit(GetOrderEasy2ShipSuccessStates());
    }).catchError((error) {
      emit(GetOrderEasy2ShipErrorStates());
    });
  }

  void getPackage({
    required orderId,
    required index,
  }) {
    easy2ShipPackage = [];
    isUpdateDeclareValue = [];
    emit(GetPackageEasy2ShipLoadingStates());
    DioHelper.postData(
      url: GetEasy2ShipPackages,
      data: {
        "OrderId": orderId,
      },
    ).then((value) async {
      easy2ShipPackage = value.data;
      isUpdateDeclareValue =
          List<bool>.generate(easy2ShipPackage.length, (i) => false);
      deValue = List.generate(easy2ShipPackage.length, (i) => '');
      changeIsShowOrder(index);
      changeIconExpendedOrder(index);
      emit(GetPackageEasy2ShipSuccessStates());
    }).catchError((error) {
      emit(GetPackageEasy2ShipErrorStates());
    });
  }

  void getPackageDetails({
    required packageId,
  }) {
    easy2ShipPackage = [];
    emit(GetPackageDetailsEasy2ShipLoadingStates());
    DioHelper.postData(
      url: GetEasy2ShipPackagesDetails,
      data: {"package_id": packageId},
    ).then((value) async {
      for (var item in value.data) {
        images.add(base64.decode(item['data']));
      }
      emit(GetPackageDetailsEasy2ShipSuccessStates());
    }).catchError((error) {
      emit(GetPackageDetailsEasy2ShipErrorStates());
    });
  }

  void getShowPayment({
    required orderId,
    required bValue,
    required index,
  }) {
    showPayment = {};
    emit(GetShowPaymentEasy2ShipLoadingStates());
    DioHelper.postData(
      url: Easy2ShipShowPayment,
      data: {
        "OrderId": orderId,
      },
    ).then((value) async {
      showPayment = value.data[0];
      changeIsShowPayment(bValue, index);
      emit(GetShowPaymentEasy2ShipSuccessStates());
    }).catchError((error) {
      emit(GetShowPaymentEasy2ShipErrorStates());
    });
  }

  void easy2ShipEditPackage({
    required packageId,
    required declareValue,
    required index,
  }) {
    emit(EditPackageEasy2ShipLoadingStates());
    DioHelper.postData(url: Easy2ShipEditPackage, data: {
      "package_id": packageId,
      "declared_value": double.parse(declareValue),
    }).then((value) async {
      changeIsUpdateDeclareValue(true, index);
      easy2ShipPackage[index]['declared_value'] = declareValue;
      deValue[index] = declareValue.toString();
      emit(EditPackageEasy2ShipSuccessStates());
    }).catchError((error) {
      emit(EditPackageEasy2ShipErrorStates());
    });
  }

  void cancelPackage({
    required orderId,
  }) {
    emit(CancelPackageEasy2ShipLoadingStates());
    DioHelper.postData(
      url: CancelPackage,
      data: {
        "OrderId": orderId,
      },
    ).then((value) async {
      emit(CancelPackageEasy2ShipSuccessStates());
    }).catchError((error) {
      emit(CancelPackageEasy2ShipErrorStates());
    });
  }

  void easy2ShipShowPricePackage({
    required orderId,
    required state,
    required userId,
    required countryCode,
    required cityCode,
    required zip,
    required voucherCode,
  }) {
    emit(ShowPricePackageEasy2ShipLoadingStates());
    DioHelper.postData(
      url: Easy2ShipShowPricePackage,
      data: {
        "state": state,
        "user_id": userId,
        "OrderId": orderId,
        "invoice_country_code": countryCode,
        "invoice_city_code": cityCode,
        "invoice_zip_postal_code": zip,
        "my_voucher_code": voucherCode,
      },
    ).then((value) async {
      showPricePackage = value.data;
      State = state;
      addInsurance = List<bool>.generate(showPricePackage.length, (i) => false);
      removeInsurance = List<bool>.generate(showPricePackage.length, (i) => false);
      addInsuranceData = List.generate(showPricePackage.length, (i) => {});
      removeInsuranceData = List.generate(showPricePackage.length, (i) => {});
      emit(ShowPricePackageEasy2ShipSuccessStates());
    }).catchError((error) {
      emit(ShowPricePackageEasy2ShipErrorStates());
    });
  }

  void easy2ShipAddInsurancePackage({
    required orderId,
    required state,
    required userId,
    required courierId,
    required index,
  }) {
    emit(Easy2ShipAddInsurancePackageLoadingStates());
    DioHelper.postData(
      url: Easy2ShipAddInsurancePackage,
      data: {
        "state": state,
        "user_id": userId,
        "OrderId": orderId,
        "courier_id":courierId,
      },
    ).then((value) async {
      addInsuranceData[index] = value.data[0];
      addInsurance[index] = false;
      removeInsurance[index] = true;
        emit(Easy2ShipAddInsurancePackageSuccessStates());

    }).catchError((error) {
      emit(Easy2ShipAddInsurancePackageErrorStates());
    });
  }

  void easy2ShipRemoveInsurancePackage({
    required orderId,
    required state,
    required userId,
    required courierId,
    required index,
  }) {
    emit(Easy2ShipRemoveInsurancePackageLoadingStates());
    DioHelper.postData(
      url: Easy2ShipRemoveInsurancePackage,
      data: {
        "state": state,
        "user_id": userId,
        "OrderId": orderId,
        "courier_id":courierId,
      },
    ).then((value) async {
      removeInsuranceData[index] = value.data[0];
      addInsurance[index] = true;
      removeInsurance[index] = false;
        emit(Easy2ShipRemoveInsurancePackageSuccessStates());

    }).catchError((error) {
      emit(Easy2ShipRemoveInsurancePackageErrorStates());
    });
  }

  void easy2ShipPrepare({
    required orderId,
    required state,
    required userId,
    required index,
  }) {
    emit(PrepareEasy2ShipLoadingStates());
    DioHelper.postData(
      url: Easy2ShipPrepare,
      data: {
        "state": state,
        "user_id": userId,
        "OrderId": orderId,
      },
    ).then((value) async {
      if (value.data.length == 1) {
        emit(PrepareEasy2ShipSuccessStates());
      } else {
        emit(PrepareEasy2ShipErrorStates());
      }
    }).catchError((error) {
      emit(PrepareEasy2ShipErrorStates());
    });
  }
}

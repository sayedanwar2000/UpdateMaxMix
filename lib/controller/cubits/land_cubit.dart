// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/endpointer.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/land_states.dart';

class LandCubit extends Cubit<LandStates> {
  LandCubit() : super(InitialLandStates());

  static LandCubit get(context) => BlocProvider.of(context);

  late String? character = "";
  late String? characterStorage = "";
  String fromCountry = "";
  String fromCity = "";
  String toCountry = "";
  String toCity = "";
  String pickupCityStorage = "";
  String size = "";
  String originService = "";
  String originServiceStorage = "";
  String destService = "";
  String dimensionsUnitName = "";
  String dimensionsUnitName1 = "";
  String dimensionsUnitName2 = "";
  String dimensionsUnitName3 = "";
  String dimensionsUnitName4 = "";
  String dimensionsUnitName5 = "";
  String weightUnitName = "";
  String weightUnitName1 = "";
  String weightUnitName2 = "";
  String weightUnitName3 = "";
  String weightUnitName4 = "";
  String weightUnitName5 = "";
  String errorMessages = '';
  String successMessages = '';
  dynamic originMain = [];
  dynamic landRadio = [];
  dynamic destServiceKay = [];
  int limit = 1;
  bool needStorage = false;
  bool anotherSize = false;
  bool useAddressStorage = false;
  bool isPickUpStorage = false;
  List<bool> checkBoxOrigin = [];
  List<bool> checkBoxOriginStorage = [];
  List<bool> checkBoxDest = [];
  List<String> radioButtonList = [];
  var radioButtonIdList = <int, String>{};
  List<String> radioButtonStorageList = [];
  var radioButtonStorageIdList = <int, String>{};
  List<String> originMainServicesList = [];
  var originMainServicesIdList = <int, String>{};
  List<String> originMainServicesStorageList = [];
  var originMainServicesStorageIdList = <int, String>{};
  List<String> destMainServicesList = [];
  var destMainServicesIdList = <int, String>{};
  List<String> sizeList = [];
  var sizeIdList = <int, String>{};
  List<Widget> listShipmentDate = [];
//this function to give Dimensions Unit Name
  void changeDimensionsUnitName(value, key) {
    switch (key) {
      case 0:
        dimensionsUnitName = value;
        break;
      case 1:
        dimensionsUnitName1 = value;
        break;
      case 2:
        dimensionsUnitName2 = value;
        break;
      case 3:
        dimensionsUnitName3 = value;
        break;
      case 4:
        dimensionsUnitName4 = value;
        break;
      case 5:
        dimensionsUnitName5 = value;
        break;
    }
    emit(LandChangeDimensionsUnitNameState());
  }
//this function to give Weight Unit Name
  void changeWeightUnitName(value, key) {
    switch (key) {
      case 0:
        weightUnitName = value;
        break;
      case 1:
        weightUnitName1 = value;
        break;
      case 2:
        weightUnitName2 = value;
        break;
      case 3:
        weightUnitName3 = value;
        break;
      case 4:
        weightUnitName4 = value;
        break;
      case 5:
        weightUnitName5 = value;
        break;
    }
    emit(LandChangeWeightUnitNameState());
  }
//this function to change Country From
  void changeFromCountry(value) {
    fromCountry = value;
    emit(LandChangeFromCountryState());
  }
//this function to change City From
  void changeFromCity(value) {
    fromCity = value;
    emit(LandChangeFromCityState());
  }
//this function to change Country to
  void changeToCountry(value) {
    toCountry = value;
    emit(LandChangeToCountryState());
  }
//this function to change city to
  void changeToCity(value) {
    toCity = value;
    emit(LandChangeToCityState());
  }
//this function to change Character for air and storage
  void changeCharacter(value, {isStorage = false}) {
    if (isStorage) {
      characterStorage = value;
    } else {
      character = value;
    }
    emit(LandChangeCharacterState());
  }
//this function to change List To Empty
  void changeListToEmpty({isStorage = false}) {
    if (isStorage) {
      originMainServicesStorageList = [];
      radioButtonStorageList = [];
    } else {
      originMainServicesList = [];
      radioButtonList = [];
    }
    emit(LandChangeToEmptyState());
  }
//this function to increment package shipment data
  void incrementLimit() {
    if (limit < 7) {
      limit++;
    }
    emit(LandIncrementLimitState());
  }
//this function to decrement package shipment data
  void decrementLimit() {
    if (limit > 1) {
      limit--;
    }
    emit(LandDecrementLimitState());
  }
//this function to change check box Need Storage
  void changeNeedStorage() {
    needStorage = !needStorage;
    emit(LandChangeNeedStorageState());
  }
//this function to change check boc Another Size
  void changeAnotherSize() {
    anotherSize = !anotherSize;
    emit(LandChangeAnotherSizeState());
  }
//this function to change Size
  void changeSize(value) {
    size = value;
    emit(LandChangeSizeState());
  }
//this function to change check Use Address for land and storage
  void changeUseAddress({isStorage = false}) {
    useAddressStorage = !useAddressStorage;
    emit(LandChangeUseAddressState());
  }
//this function to get Radio Button for land and storage
  void getRadioButton({
    required fromCountryID,
    toCityID,
    toCountryID,
    required fromCityID,
    serviceID,
    isStorage = false,
  }) {
    if (isStorage) {
      radioButtonStorageList = [];
      radioButtonStorageIdList = <int, String>{};
    } else {
      radioButtonList = [];
      radioButtonIdList = <int, String>{};
    }
    emit(LandRadioButtonLoadingState());
    DioHelper.postData(
      url: isStorage ? StorageRadioButton : ServiceRadioButton,
      data: isStorage
          ? {
              "from_country_id": fromCountryID,
              "to_city_id": fromCityID,
            }
          : {
              "from_country_id": fromCountryID,
              "to_country_id": toCountryID,
              "to_city_id": toCityID,
              "from_city_id": fromCityID,
              "service_type_id": serviceID
            },
    ).then((value) async {
      var list = value.data;
      if (isStorage) {
        for (var item in list) {
          radioButtonStorageList.add(item['service_type_size_name']);
          radioButtonStorageIdList[item['service_type_size_id'].toInt()] =
              item['service_type_size_name'];
        }
      } else {
        for (var item in list) {
          radioButtonList.add(item['shippment_type']);
          radioButtonIdList[item['shippment_type_id'].toInt()] =
              item['shippment_type'];
        }
      }
      emit(LandRadioButtonSuccessState());
    }).catchError((error) {
      emit(LandRadioButtonErrorState(error.toString()));
    });
  }
//this function to get Radio Key for land and storage
  int getRadioKey(var value, {isStorage = false}) {
    int Key;
    landRadio = [];
    if (isStorage) {
      Key = radioButtonStorageIdList.keys.firstWhere(
          (k) => radioButtonStorageIdList[k] == value,
          orElse: () => 0);
    } else {
      Key = radioButtonIdList.keys
          .firstWhere((k) => radioButtonIdList[k] == value, orElse: () => 0);
      landRadio.add(Key);
    }
    return Key;
  }
//this function to get Origin Main Services for land and storage
  void getOriginMainServices({
    required fromCountryID,
    required fromCityID,
    required toCountryID,
    required toCityID,
    required serviceID,
    required serviceSizeTypeID,
    isStorage = false,
  }) {
    if (isStorage) {
      originMainServicesStorageList = [];
      originMainServicesStorageIdList = <int, String>{};
    } else {
      originMainServicesList = [];
      originMainServicesIdList = <int, String>{};
    }
    emit(LandGetOriginMainServicesLoadingState());
    DioHelper.postData(
      url: GetOriginMainServices,
      data: {
        "from_country_id": fromCountryID,
        "to_country_id": toCountryID,
        "to_city_id": toCityID,
        "from_city_id": fromCityID,
        "service_type_id": serviceID,
        "service_size_type_id": serviceSizeTypeID
      },
    ).then((value) async {
      var list = value.data;
      if (list[0].containsValue("No Service")) {
        emit(LandGetOriginMainServicesSuccessState());
      } else {
        if (isStorage) {
          for (var item in list) {
            originMainServicesStorageList.add(item['org_extra_name']);
            originMainServicesStorageIdList[item['org_extra_id'].toInt()] =
                item['org_extra_name'];
          }
          checkBoxOriginStorage = List<bool>.generate(
              originMainServicesStorageIdList.length, (i) => false);
        } else {
          for (var item in list) {
            originMainServicesList.add(item['org_extra_name']);
            originMainServicesIdList[item['org_extra_id'].toInt()] =
                item['org_extra_name'];
          }
          checkBoxOrigin = List<bool>.generate(
              originMainServicesIdList.length, (i) => false);
        }
        emit(LandGetOriginMainServicesSuccessState());
      }
    }).catchError((error) {
      emit(LandGetOriginMainServicesErrorState(error.toString()));
    });
  }
//this function to get Origin Main Services key for land and storage
  int getOriginMainServicesKey(var value, {isStorage = false}) {
    int Key;
    if (isStorage) {
      Key = originMainServicesStorageIdList.keys.firstWhere(
          (k) => originMainServicesStorageIdList[k] == value,
          orElse: () => 0);
    } else {
      Key = originMainServicesIdList.keys.firstWhere(
          (k) => originMainServicesIdList[k] == value,
          orElse: () => 0);
    }
    return Key;
  }
//this function to change check box Origin Main Services key for land and storage
  void changeCheckBoxOriginMainServices({
    required index,
    required bool value,
  }) {
    checkBoxOriginStorage[index] = value;
    originServiceStorage = originMainServicesStorageList[index];
    if (originServiceStorage == 'Pick-UP') {
      isPickUpStorage = !isPickUpStorage;
    }
    emit(LandCheckBoxChangeOriginState());
  }
//this function to get dest Main Services for land and storage
  void getDestMainServices({
    required fromCountryID,
    required fromCityID,
    required toCountryID,
    required toCityID,
    required serviceID,
    required serviceSizeTypeID,
  }) {
    destMainServicesList = [];
    destMainServicesIdList = <int, String>{};
    emit(LandGetDestMainServicesLoadingState());
    DioHelper.postData(
      url: GetDestMainServices,
      data: {
        "from_country_id": fromCountryID,
        "to_country_id": toCountryID,
        "to_city_id": toCityID,
        "from_city_id": fromCityID,
        "service_type_id": serviceID,
        "service_size_type_id": serviceSizeTypeID
      },
    ).then((value) async {
      var list = value.data;
      for (var item in list) {
        destMainServicesList.add(item['dest_extra_name']);
        destMainServicesIdList[item['dest_extra_id'].toInt()] =
            item['dest_extra_name'];
      }
      checkBoxDest =
          List<bool>.generate(destMainServicesList.length, (i) => false);
      emit(LandGetDestMainServicesSuccessState());
    }).catchError((error) {
      emit(LandGetDestMainServicesErrorState(error.toString()));
    });
  }
//this function to get dest Main Services key for land and storage
  int getDestMainServicesKey(var value) {
    var Key = destMainServicesIdList.keys
        .firstWhere((k) => destMainServicesIdList[k] == value, orElse: () => 0);

    return Key;
  }
//this function to change check box dest Main Services key for land and storage
  void changeCheckBoxDestMainServices({
    required index,
    required bool value,
  }) {
    checkBoxDest[index] = value;
    if (value) {
      destServiceKay.add(getDestMainServicesKey(destMainServicesList[index]));
    } else {
      destServiceKay
          .remove(getDestMainServicesKey(destMainServicesList[index]));
    }
    emit(LandCheckBoxChangeDestState());
  }
//this function to get Size
  void getSize({
    required fromCountryID,
    required serviceSizeTypeId,
    required storageFromDate,
    required storageToDate,
    required fromCityID,
  }) {
    sizeList = [];
    sizeIdList = <int, String>{};
    emit(LandSizeLoadingState());
    DioHelper.postData(
      url: StorageSize,
      data: {
        "from_country_id": fromCountryID,
        "service_size_type_id": serviceSizeTypeId,
        "storage_from_date": storageFromDate,
        "storage_to_date": storageToDate,
        "from_city_id": fromCityID
      },
    ).then((value) async {
      var list = value.data;
      for (var item in list) {
        sizeList.add(item['wharehouse_size_desc']);
        sizeIdList[item['id'].toInt()] = item['wharehouse_size_desc'];
      }
      emit(LandSizeSuccessState());
    }).catchError((error) {
      emit(LandSizeErrorState(error.toString()));
    });
  }
//this function to get Size Key
  int getSizeKey(var value) {
    var sizeKey = sizeIdList.keys
        .firstWhere((k) => sizeIdList[k] == value, orElse: () => 0);
    return sizeKey;
  }
//this function to submit land
  void submitLand({
    required userID,
    required userFName,
    required userEmail,
    required userPhoneCountryCode,
    required userPhone,
    required userAddress,
    required userLang,
    required fromCountryId,
    required toCountryId,
    required fromCityId,
    required toCityId,
    required dimensionsUnitID,
    required dimensionsUnitID1,
    required dimensionsUnitID2,
    required dimensionsUnitID3,
    required dimensionsUnitID4,
    required dimensionsUnitID5,
    required weightUnitID,
    required weightUnitID1,
    required weightUnitID2,
    required weightUnitID3,
    required weightUnitID4,
    required weightUnitID5,
    required hsCode,
    required hsCode1,
    required hsCode2,
    required hsCode3,
    required hsCode4,
    required hsCode5,
    required weight,
    required weight1,
    required weight2,
    required weight3,
    required weight4,
    required weight5,
    required height,
    required height1,
    required height2,
    required height3,
    required height4,
    required height5,
    required width,
    required width1,
    required width2,
    required width3,
    required width4,
    required width5,
    required length,
    required length1,
    required length2,
    required length3,
    required length4,
    required length5,
    required declaredValue,
    required declaredValue1,
    required declaredValue2,
    required declaredValue3,
    required declaredValue4,
    required declaredValue5,
    required serviceDate,
    required serviceSizeTypeId,
    required serviceTypeId,
    required goodsDesc,
    required fromDate,
    required toDate,
    required sizeID,
    required storagePickupDate,
    required storagePickupCityID,
    required addressStorage,
    required storageOtherSize,
  }) {
    emit(LandSubmitLoadingState());
    DioHelper.postData(
      url: SubmitLand,
      data: {
        "land_country_from": fromCountryId,
        "land_city_from": fromCityId,
        "land_country_to": toCountryId,
        "land_city_to": toCityId,
        "land_country_from_name": fromCountry,
        "land_country_to_name": toCountry,
        "land_city_from_name": fromCity,
        "land_city_to_name": toCity,
        "land_goods_desc": goodsDesc,
        "land_service_date": serviceDate,
        "package_count": limit,
        "dimensions_unit1_name": dimensionsUnitName,
        "dimensions_unit11_name": limit > 1 ? dimensionsUnitName1 : '',
        "dimensions_unit12_name": limit > 2 ? dimensionsUnitName2 : '',
        "dimensions_unit13_name": limit > 3 ? dimensionsUnitName3 : '',
        "dimensions_unit14_name": limit > 4 ? dimensionsUnitName4 : '',
        "dimensions_unit15_name": limit > 5 ? dimensionsUnitName5 : '',
        "weight_unit1_name": weightUnitName,
        "weight_unit11_name": limit > 1 ? weightUnitName1 : '',
        "weight_unit12_name": limit > 2 ? weightUnitName2 : '',
        "weight_unit13_name": limit > 3 ? weightUnitName3 : '',
        "weight_unit14_name": limit > 4 ? weightUnitName4 : '',
        "weight_unit15_name": limit > 5 ? weightUnitName5 : '',
        "hs_code": hsCode,
        "hs_code1": limit > 1 ? hsCode1 : '',
        "hs_code2": limit > 2 ? hsCode2 : '',
        "hs_code3": limit > 3 ? hsCode3 : '',
        "hs_code4": limit > 4 ? hsCode4 : '',
        "hs_code5": limit > 5 ? hsCode5 : '',
        "weight": weight,
        "weight1": limit > 1 ? weight1 : 0,
        "weight2": limit > 2 ? weight2 : 0,
        "weight3": limit > 3 ? weight3 : 0,
        "weight4": limit > 4 ? weight4 : 0,
        "weight5": limit > 5 ? weight5 : 0,
        "height": height,
        "height1": limit > 1 ? height1 : 0,
        "height2": limit > 2 ? height2 : 0,
        "height3": limit > 3 ? height3 : 0,
        "height4": limit > 4 ? height4 : 0,
        "height5": limit > 5 ? height5 : 0,
        "width": width,
        "width1": limit > 1 ? width1 : 0,
        "width2": limit > 2 ? width2 : 0,
        "width3": limit > 3 ? width3 : 0,
        "width4": limit > 4 ? width4 : 0,
        "width5": limit > 5 ? width5 : 0,
        "length": length,
        "length1": limit > 1 ? length1 : 0,
        "length2": limit > 2 ? length2 : 0,
        "length3": limit > 3 ? length3 : 0,
        "length4": limit > 4 ? length4 : 0,
        "length5": limit > 5 ? length5 : 0,
        "dimensions_unit1": dimensionsUnitID,
        "dimensions_unit11": limit > 1 ? dimensionsUnitID1 : 0,
        "dimensions_unit12": limit > 2 ? dimensionsUnitID2 : 0,
        "dimensions_unit13": limit > 3 ? dimensionsUnitID3 : 0,
        "dimensions_unit14": limit > 4 ? dimensionsUnitID4 : 0,
        "dimensions_unit15": limit > 5 ? dimensionsUnitID5 : 0,
        "weight_unit1": weightUnitID,
        "weight_unit11": limit > 1 ? weightUnitID1 : 0,
        "weight_unit12": limit > 2 ? weightUnitID2 : 0,
        "weight_unit13": limit > 3 ? weightUnitID3 : 0,
        "weight_unit14": limit > 4 ? weightUnitID4 : 0,
        "weight_unit15": limit > 5 ? weightUnitID5 : 0,
        "declared_value": declaredValue,
        "declared_value1": limit > 1 ? declaredValue1 : '',
        "declared_value2": limit > 2 ? declaredValue2 : '',
        "declared_value3": limit > 3 ? declaredValue3 : '',
        "declared_value4": limit > 4 ? declaredValue4 : '',
        "declared_value5": limit > 5 ? declaredValue5 : '',
        "land_radio_shippment_type": landRadio,
        "land_des_CheckBoxList": destServiceKay,
        "land_radio_shippment_type_name": character,
        "air_storage_space_checkbox": needStorage,
        "air_storage_size_dropdownlist_name": needStorage ? size : '',
        "air_storage_date_from_dateedit": needStorage ? fromDate : '',
        "air_storage_date_to_dateedit": needStorage ? toDate : '',
        "air_storage_size_dropdownlist_id": needStorage ? sizeID : 0,
        "air_storage_check": useAddressStorage,
        "air_storage_pickup_date": isPickUpStorage & needStorage ? storagePickupDate : '',
        "air_storage_city_from_pickup": isPickUpStorage & needStorage ? pickupCityStorage : '',
        "air_storage_city_from_pickup_id": isPickUpStorage & needStorage ? storagePickupCityID : 0,
        "storage_pickup_address_checkbox": useAddressStorage,
        "air_pickup_address_checkbox": useAddressStorage,
        "storage_pickup_address":needStorage & useAddressStorage & isPickUpStorage ? addressStorage : '',
        "air_storage_other_size": needStorage ? storageOtherSize : '',
        "user_id": userID,
        "user_first_name": userFName,
        "user_email": userEmail,
        "user_address": userAddress,
        "user_phone_country_code": userPhoneCountryCode,
        "user_mob": userPhone,
        "user_lang": userLang,
      },
    ).then((value) {
      var submit = value.data;
      if (submit[0]['validation_error_messages'] == null) {
        successMessages = submit[0]['success_message'];
        emit(LandSubmitSuccessState());
      } else {
        errorMessages = submit[0]['validation_error_messages'];
        emit(LandSubmitErrorState(
            submit[0]['validation_error_messages'].toString()));
      }
    }).catchError((error) {
      errorMessages = error.toString();
      emit(LandSubmitErrorState(error.toString()));
    });
  }
}

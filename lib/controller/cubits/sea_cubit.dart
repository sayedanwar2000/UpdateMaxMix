// ignore_for_file: non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/endpointer.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/sea_states.dart';

class  SeaCubit extends Cubit<SeaStates>{
  SeaCubit() : super(InitialSeaStates());
  static SeaCubit get(context) => BlocProvider.of(context);

  late String? character = "";
  late String? characterStorage = "";
  String fromCountry= '';
  String fromCity= '';
  String toCountry= '';
  String toCity= '';
  String pickupCity= '';
  String pickupCityStorage= '';
  String deliveryCity= '';
  String size = '';
  String fromSeaPort= '';
  String toSeaPort= '';
  String originService= '';
  String originServiceStorage= '';
  String destService= '';
  String dimensionsUnitName = '';
  String dimensionsUnitName1 = '';
  String dimensionsUnitName2 = '';
  String dimensionsUnitName3 = '';
  String dimensionsUnitName4 = '';
  String dimensionsUnitName5 = '';
  String weightUnitName = '';
  String weightUnitName1 = '';
  String weightUnitName2 = '';
  String weightUnitName3 = '';
  String weightUnitName4 = '';
  String weightUnitName5 = '';
  String errorMessages = '';
  String successMessages = '';
  dynamic originServiceKey = [];
  dynamic destServiceKay = [];
  dynamic radioButtonKay = [];
  int limit = 1;
  bool needStorage = false;
  bool anotherSize = false;
  bool useAddress = false;
  bool useAddressStorage = false;
  bool isPickUp = false;
  bool isPickUpStorage = false;
  bool isDelivery = false;
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

  //this function to change From Country
  void changeFromCountry(value) {
    fromCountry = value;
    emit(SeaChangeFromCountryState());
  }
//this function to change From City
  void changeFromCity(value) {
    fromCity = value;
    emit(SeaChangeFromCityState());
  }
//this function to change Delivery City
  void changeDeliveryCity(value) {
    deliveryCity = value;
    emit(SeaChangeDeliveryCityState());
  }
//this function to change Pick Up City for sea and storage
  void changePickUpCity(value, {isStorage = false}) {
    if (isStorage) {
      pickupCityStorage = value;
    } else {
      pickupCity = value;
    }
    emit(SeaChangePickUpCityState());
  }
//this function to change From Sea Port
  void changeFromSeaPort(value) {
    fromSeaPort = value;
    emit(SeaChangeFromSeaPortState());
  }
//this function to change To Country
  void changeToCountry(value) {
    toCountry = value;
    emit(SeaChangeToCountryState());
  }
//this function to change To City
  void changeToCity(value) {
    toCity = value;
    emit(SeaChangeToCityState());
  }
//this function to change To Sea Port
  void changeToSeaPort(value) {
    toSeaPort = value;
    emit(SeaChangeToSeaPortState());
  }
//this function to change Character for sea and storage
  void changeCharacter(value, {isStorage = false}) {
    if (isStorage) {
      characterStorage = value;
    } else {
      character = value;
    }
    emit(SeaChangeCharacterState());
  }
//this function to change Size
  void changeSize(value) {
    size = value;
    emit(SeaChangeSizeState());
  }
//this function to change check box Need Storage
  void changeNeedStorage() {
    needStorage = !needStorage;
    emit(SeaChangeNeedStorageState());
  }
//this function to change check box Another Size
  void changeAnotherSize() {
    anotherSize = !anotherSize;
    emit(SeaChangeAnotherSizeState());
  }
//this function to change check box Use Address for sea and storage
  void changeUseAddress({isStorage = false}) {
    if (isStorage) {
      useAddressStorage = !useAddressStorage;
    } else {
      useAddress = !useAddress;
    }
    emit(SeaChangeUseAddressState());
  }
//this function to change Dimensions Unit Name
  void changeDimensionsUnitName(value,key) {
    switch(key){
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
    emit(SeaChangeDimensionsUnitNameState());
  }
//this function to change Weight Unit Name
  void changeWeightUnitName(value,key) {
    switch(key){
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
    emit(SeaChangeWeightUnitNameState());
  }
//this function to increment package shipment data
  void incrementLimit() {
    if (limit < 6) {
      limit++;
    }
    emit(SeaIncrementLimitState());
  }
//this function to decrement package shipment data
  void decrementLimit() {
    if (limit > 1) {
      limit--;
    }
    emit(SeaDecrementLimitState());
  }
//this function to get Radio Button for sea and storage
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
    emit(SeaRadioButtonLoadingState());
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
      emit(SeaRadioButtonSuccessState());
    }).catchError((error) {
      emit(SeaRadioButtonErrorState(error.toString()));
    });
  }
//this function to get Radio Key for sea and storage
  int getRadioKey(var value, {isStorage = false}) {
    int Key;
    radioButtonKay = [];
    if (isStorage) {
      Key = radioButtonStorageIdList.keys.firstWhere(
              (k) => radioButtonStorageIdList[k] == value,
          orElse: () => 0);
    } else {
      Key = radioButtonIdList.keys
          .firstWhere((k) => radioButtonIdList[k] == value, orElse: () => 0);
      radioButtonKay.add(Key);
    }
    return Key;
  }
//this function to get Origin Main Services for sea and storage
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
    emit(SeaGetOriginMainServicesLoadingState());
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
        emit(SeaGetOriginMainServicesSuccessState());
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
        emit(SeaGetOriginMainServicesSuccessState());
      }
    }).catchError((error) {
      emit(SeaGetOriginMainServicesErrorState(error.toString()));
    });
  }
//this function to get Origin Main Services Key for sea and storage
  int getOriginMainServicesKey(var value, {isStorage = false}) {
    int Key;
    originServiceKey = [];
    if (isStorage) {
      Key = originMainServicesStorageIdList.keys.firstWhere(
              (k) => originMainServicesStorageIdList[k] == value,
          orElse: () => 0);
    } else {
      Key = originMainServicesIdList.keys.firstWhere(
              (k) => originMainServicesIdList[k] == value,
          orElse: () => 0);
      originServiceKey.add(Key);
    }
    return Key;
  }
//this function to get Dest Main Services
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
    emit(SeaGetDestMainServicesLoadingState());
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
      List<bool>.generate(destMainServicesIdList.length, (i) => false);
      emit(SeaGetDestMainServicesSuccessState());
    }).catchError((error) {
      emit(SeaGetDestMainServicesErrorState(error.toString()));
    });
  }
//this function to get Dest Main Services Key
  int getDestMainServicesKey(var value) {
    destServiceKay = [];
    var Key = destMainServicesIdList.keys
        .firstWhere((k) => destMainServicesIdList[k] == value, orElse: () => 0);
    destServiceKay.add[Key];
    return Key;
  }
//this function to change Check Box Origin Main Services
  void changeCheckBoxOriginMainServices({
    required index,
    required bool value,
    isStorage = false,
  }) {
    if (isStorage) {
      checkBoxOriginStorage[index] = value;
      originServiceStorage = originMainServicesStorageList[index];
      if (originServiceStorage == 'Pick-UP') {
        isPickUpStorage = !isPickUpStorage;
      }
    } else {
      checkBoxOrigin[index] = value;
      originService = originMainServicesList[index];
      if (originService == 'Pick-UP') {
        isPickUp = !isPickUp;
      }
    }
    emit(SeaCheckBoxChangeOriginState());
  }
//this function to change Check Box Dest Main Services
  void changeCheckBoxDestMainServices({
    required index,
    required bool value
  }) {
    checkBoxDest[index] = value;
    destService = destMainServicesList[index];
    if (destService == 'Delivery') {
      isDelivery = !isDelivery;
    }
    emit(SeaCheckBoxChangeDestState());
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
    emit(SeaSizeLoadingState());
    DioHelper.postData(
      url: StorageSize,
      data: {
        "from_country_id": fromCountryID,
        "service_size_type_id": serviceSizeTypeId,
        "storage_from_date":storageFromDate,
        "storage_to_date":storageToDate,
        "from_city_id":fromCityID
      },
    ).then((value) async {
      var list = value.data;
      for (var item in list) {
        sizeList.add(item['wharehouse_size_desc']);
        sizeIdList[item['id'].toInt()] =
        item['wharehouse_size_desc'];
      }
      emit(SeaSizeSuccessState());
    }).catchError((error) {
      emit(SeaSizeErrorState(error.toString()));
    });
  }
//this function to get Size Key
  int getSizeKey(var value) {
    var Key = sizeIdList.keys
        .firstWhere((k) => sizeIdList[k] == value, orElse: () => 0);
    return Key;
  }
//this function to submit Sea
  void submitSea({
    required userID,
    required userFName,
    required userEmail,
    required userPhoneCountryCode,
    required userPhone,
    required userAddress,
    required userLang,
    required fromCountyId,
    required toCountyId,
    required fromCityId,
    required toCityId,
    required fromZip,
    required toZip,
    required portToID,
    required portFromID,
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
    required numberOfPieces,
    required goodsDesc,
    required pickupDate,
    required pickupAddress,
    required pickupZip,
    required radioShippmentTypeId,
    required fromDate,
    required toDate,
    required sizeID,
    required storagePickupDate,
    required storagePickupCityID,
    required addressStorage,
    required storageOtherSize,
    required pickupCityID,
  }) {
    emit(SubmitLoadingState());
    DioHelper.postData(
      url: SubmitSea,
      data: {
        "from_country_id": fromCountyId,
        "from_city_id": fromCityId,
        "to_country_id": toCountyId,
        "service_type_id": 3,
        "port_type": 1,
        "storage_country_id": fromCountyId,
        "to_city_id": toCityId,
        "service_size_type_id": 0,
        "sea_country_from": fromCountyId,
        "seaport_to": portToID,
        "sea_city_from": fromCityId,
        "seaport_from": portFromID,
        "sea_country_to": toCountyId,
        "sea_city_to": toCityId,
        "sea_country_from_name": fromCountry,
        "sea_country_to_name": toCountry,
        "sea_city_from_zip": fromZip,
        "sea_city_to_zip": toZip,
        "sea_number_of_pieces": numberOfPieces,
        "seaport_from_name": fromSeaPort,
        "seaport_to_name": toSeaPort,
        "goods_desc": goodsDesc,
        "sea_service_date": serviceDate,
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

        "sea_org_CheckBoxList": originService,
        "package_count": limit,
        "pickup_date": isPickUp ? pickupDate : '',
        "sea_pickup_address_check": useAddress,
        "sea_pickup_address": isPickUp & useAddress ? pickupAddress : '',
        "pickup_zip_code": isPickUp ? pickupZip : '',
        "sea_radio_shippment_type_id": radioShippmentTypeId,
        "sea_des_CheckBoxList": destServiceKay,
        "sea_storage_space_checkbox": needStorage,
        "sea_storage_size_dropdownlist_name": needStorage ? size : '',
        "sea_storage_date_from_dateedit": needStorage ?  fromDate : '',
        "sea_storage_date_to_dateedit": needStorage ? toDate : '',
        "sea_storage_size_dropdownlist_id": needStorage ? sizeID : 0,
        "sea_storage_check": useAddressStorage,
        "sea_storage_pickup_date": isPickUpStorage & needStorage ? storagePickupDate : '',
        "sea_storage_city_from_pickup": isPickUpStorage & needStorage ? pickupCityStorage : '',
        "sea_storage_city_from_pickup_id": isPickUpStorage & needStorage ? storagePickupCityID : 0,
        "storage_pickup_address_checkbox": useAddressStorage,
        "sea_pickup_address_checkbox": useAddress,
        "storage_pickup_address": isPickUpStorage & needStorage & useAddressStorage ? addressStorage : '',
        "sea_storage_other_size": "",
        "sea_pickup_city_dropdownlist_name": isPickUp ? pickupCity : '',
        "sea_pickup_city_dropdownlist": isPickUp ? pickupCityID : 0,
        "sea_storage_space_check": needStorage,
        "sea_storage_size": needStorage & anotherSize ? storageOtherSize : '',

        "user_id": userID,
        "user_address": userAddress,
        "user_first_name": userFName,
        "user_email": userEmail,
        "user_phone_country_code": userPhoneCountryCode,
        "user_mob": userPhone,
        "user_lang": userLang,
      },
    ).then((value) {
      var submit = value.data;
      if(submit[0]['validation_error_messages'] == null){
        successMessages = submit[0]['success_message'];
        emit(SubmitSuccessState());
      }else{
        errorMessages = submit[0]['validation_error_messages'];
        emit(SubmitErrorState(submit[0]['validation_error_messages'].toString()));
      }

    }).catchError((error) {
      errorMessages = error.toString();
      emit(SubmitErrorState(error.toString()));
    });
  }

}
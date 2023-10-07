// ignore_for_file: non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/endpointer.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/air_states.dart';

class AirCubit extends Cubit<AirStates> {
  AirCubit() : super(InitialAirStates());

  static AirCubit get(context) => BlocProvider.of(context);

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
  String fromAirPort= '';
  String toAirPort= '';
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

  //this function to give Dimensions Unit Name
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
    emit(AirChangeDimensionsUnitNameState());
  }

  //this function to give Weight Unit Name
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
    emit(AirChangeWeightUnitNameState());
  }

  void changeFromCountry(value) {
    fromCountry = value;
    emit(AirChangeFromCountryState());
  }
  //this function to change City From
  void changeFromCity(value) {
    fromCity = value;
    emit(AirChangeFromCityState());
  }
  //this function to change Delivery City
  void changeDeliveryCity(value) {
    deliveryCity = value;
    emit(AirChangeDeliveryCityState());
  }
//this function to change PickUp City air and storage
  void changePickUpCity(value, {isStorage = false}) {
    if (isStorage) {
      pickupCityStorage = value;
    } else {
      pickupCity = value;
    }
    emit(AirChangePickUpCityState());
  }
//this function to change Air Port From
  void changeFromAirPort(value) {
    fromAirPort = value;
    emit(AirChangeFromAirPortState());
  }
//this function to change Country to
  void changeToCountry(value) {
    toCountry = value;
    emit(AirChangeToCountryState());
  }
//this function to change City to
  void changeToCity(value) {
    toCity = value;
    emit(AirChangeToCityState());
  }
//this function to change Air Port to
  void changeToAirPort(value) {
    toAirPort = value;
    emit(AirChangeToAirPortState());
  }
//this function to change Character for air and storage
  void changeCharacter(value, {isStorage = false}) {
    if (isStorage) {
      characterStorage = value;
    } else {
      character = value;
    }
    emit(AirChangeCharacterState());
  }
//this function to change Size
  void changeSize(value) {
    size = value;
    emit(AirChangeSizeState());
  }
//this function to change check box Need Storage
  void changeNeedStorage() {
    needStorage = !needStorage;
    emit(AirChangeNeedStorageState());
  }
//this function to change check boc Another Size
  void changeAnotherSize() {
    anotherSize = !anotherSize;
    emit(AirChangeAnotherSizeState());
  }
//this function to change check Use Address for air and storage
  void changeUseAddress({isStorage = false}) {
    if (isStorage) {
      useAddressStorage = !useAddressStorage;
    } else {
      useAddress = !useAddress;
    }
    emit(AirChangeUseAddressState());
  }
//this function to increment package shipment data
  void incrementLimit() {
    if (limit < 6) {
      limit++;
    }
    emit(AirIncrementLimitState());
  }
//this function to decrement package shipment data
  void decrementLimit() {
    if (limit > 1) {
      limit--;
    }
    emit(AirDecrementLimitState());
  }
//this function to get Radio Button for air and storage
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
    emit(AirRadioButtonLoadingState());
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
      emit(AirRadioButtonSuccessState());
    }).catchError((error) {
      emit(AirRadioButtonErrorState(error.toString()));
    });
  }
//this function to get Radio Key for air and storage
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
//this function to get Origin Main Services for air and storage
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
    emit(AirGetOriginMainServicesLoadingState());
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
        emit(AirGetOriginMainServicesSuccessState());
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
        emit(AirGetOriginMainServicesSuccessState());
      }
    }).catchError((error) {
      emit(AirGetOriginMainServicesErrorState(error.toString()));
    });
  }
//this function to get Origin Main Services key for air and storage
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
  //this function to change check box Origin Main Services key for air and storage
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
      if (originMainServicesList[index] == 'Pick-UP') {
        isPickUp = !isPickUp;
      }
      if(value){
        originServiceKey.add(getOriginMainServicesKey(originMainServicesList[index]));
      }else{
        originServiceKey.remove(getOriginMainServicesKey(originMainServicesList[index]));
      }
    }
    emit(AirCheckBoxChangeOriginState());
  }
//this function to get dest Main Services for air and storage
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
    emit(AirGetDestMainServicesLoadingState());
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
      emit(AirGetDestMainServicesSuccessState());
    }).catchError((error) {
      emit(AirGetDestMainServicesErrorState(error.toString()));
    });
  }
//this function to get dest Main Services key for air and storage
  int getDestMainServicesKey(var value) {
    var Key = destMainServicesIdList.keys
        .firstWhere((k) => destMainServicesIdList[k] == value, orElse: () => 0);

    return Key;
  }
//this function to change check box dest Main Services key for air and storage
  void changeCheckBoxDestMainServices({
    required index,
    required bool value,
  }) {
    checkBoxDest[index] = value;
    if (destMainServicesList[index] == 'Delivery') {
      isDelivery = !isDelivery;
    }
    if(value) {
      destServiceKay.add(getDestMainServicesKey(destMainServicesList[index]));
    }else{
      destServiceKay.remove(getDestMainServicesKey(destMainServicesList[index]));
    }
    emit(AirCheckBoxChangeDestState());
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
    emit(AirSizeLoadingState());
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
      emit(AirSizeSuccessState());
    }).catchError((error) {
      emit(AirSizeErrorState(error.toString()));
    });
  }
//this function to get Size Key
  int getSizeKey(var value) {
    var sizeKey = sizeIdList.keys
        .firstWhere((k) => sizeIdList[k] == value, orElse: () => 0);
    return sizeKey;
  }
//this function to submit Air
  void submitAir({
    required userID,
    required userFName,
    required userEmail,
    required userPhoneCountryCode,
    required userPhone,
    required userAddress,
    required userLang,
    required fromCountyId,
    required toCountyId,
    required storageCountyId,
    required fromCityId,
    required toCityId,
    required fromZip,
    required toZip,
    required portType,
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
    required serviceSizeTypeId,
    required serviceTypeId,
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
    emit(AirSubmitLoadingState());
    DioHelper.postData(
      url: SubmitAir,
      data: {
        "user_id": userID,
        "user_first_name": userFName,
        "user_email": userEmail,
        "user_phone_country_code": userPhoneCountryCode,
        "user_mob": userPhone,
        "user_address": userAddress,
        "user_lang": userLang,
        "from_country_id": fromCountyId,
        "to_country_id": toCountyId,
        "storage_country_id": storageCountyId,
        "air_country_from": fromCountyId,
        "air_country_to": toCountyId,
        "air_country_from_name": fromCountry,
        "air_country_to_name": toCountry,
        "from_city_id": fromCityId,
        "to_city_id": toCityId,
        "air_city_from": fromCityId,
        "air_city_to": toCityId,
        "air_city_from_zip": fromZip,
        "air_city_to_zip": toZip,
        "port_type": portType,
        "airport_to": portToID,
        "airport_from": portFromID,
        "airport_from_name": fromAirPort,
        "airport_to_name": toAirPort,
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
        "air_service_date": serviceDate,
        "service_size_type_id": serviceSizeTypeId,
        "service_type_id": serviceTypeId,
        "air_radio_shippment_type": radioButtonKay,
        "air_org_CheckBoxList": originServiceKey,
        "air_des_CheckBoxList": destServiceKay,
        "air_number_of_pieces": numberOfPieces,
        "goods_desc": goodsDesc,
        "package_count": limit,
        "pickup_date": isPickUp ? pickupDate : '',
        "air_pickup_address_check": useAddress,
        "air_pickup_address": isPickUp & useAddress ? pickupAddress : '',
        "pickup_zip_code": isPickUp ? pickupZip : '',
        "air_radio_shippment_type_id": radioShippmentTypeId,
        "air_storage_space_checkbox": needStorage,
        "air_storage_space_check": needStorage,
        "air_storage_check": useAddressStorage,
        "air_storage_size_dropdownlist_name": "",
        "air_storage_size": needStorage ? size : "",
        "air_storage_date_from_dateedit": needStorage ? fromDate : '',
        "air_storage_date_to_dateedit": needStorage ? toDate : '',
        "air_storage_size_dropdownlist_id": needStorage ? sizeID : 0,
        "air_storage_pickup_date": isPickUpStorage ? storagePickupDate : '',
        "air_storage_city_from_pickup": isPickUpStorage ? pickupCityStorage : '',
        "air_storage_city_from_pickup_id": isPickUpStorage ? storagePickupCityID : 0,
        "storage_pickup_address_checkbox": useAddressStorage,
        "storage_pickup_address_check": useAddressStorage,
        "storage_pickup_address": isPickUpStorage & useAddressStorage & needStorage ? addressStorage : '',
        "air_storage_other_size": storageOtherSize,
        "air_pickup_city_dropdownlist_name": isPickUp ? pickupCity : '',
        "air_pickup_city_dropdownlist": isPickUp ? pickupCityID : 0,
      },
    ).then((value) {
      var submit = value.data;
      if(submit[0]['validation_error_messages'] == null){
        successMessages = submit[0]['success_message'];
        emit(AirSubmitSuccessState());
      }else{
        errorMessages = submit[0]['validation_error_messages'];
        emit(AirSubmitErrorState(submit[0]['validation_error_messages'].toString()));
      }

    }).catchError((error) {
      errorMessages = error.toString();
      emit(AirSubmitErrorState(error.toString()));
    });
  }
}

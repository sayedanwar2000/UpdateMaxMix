// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/endpointer.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/storage_states.dart';

class StorageCubit extends Cubit<StorageStates> {
  StorageCubit() : super(StorageInitialState());

  static StorageCubit get(context) => BlocProvider.of(context);

  late String? character = "";
  bool checkbox = false;
  bool useAddress = false;
  bool isPickUp = false;
  dynamic fromCountry;
  dynamic fromCity;
  dynamic pickupCity;
  dynamic size;
  dynamic originService;
  List<bool> checkBoxOrigin = [];
  List<String> sizeList = [];
  var sizeIdList = <int, String>{};
  List<String> radioButtonStorageList = [];
  var radioButtonStorageIdList = <int, String>{};
  List<String> originMainServicesList = [];
  var originMainServicesIdList = <int, String>{};

//this function to change check box Use Address
  void changeUseAddress() {
    useAddress = !useAddress;
    emit(StorageChangeUseAddressState());
  }
//this function to change Pick Up City
  void changePickUpCity(value) {
    pickupCity = value;
    emit(StorageChangePickUpCityState());
  }
//this function to get Origin Main Services
  void getOriginMainServices({
    required fromCountryID,
    required fromCityID,
    required toCountryID,
    required toCityID,
    required serviceID,
    required serviceSizeTypeID,
  }) {
    originMainServicesList = [];
    originMainServicesIdList = <int, String>{};
    emit(GetOriginMainServicesLoadingState());
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
        emit(GetOriginMainServicesSuccessState());
      } else {
        for (var item in list) {
          originMainServicesList.add(item['org_extra_name']);
          originMainServicesIdList[item['org_extra_id'].toInt()] =
              item['org_extra_name'];
        }
        checkBoxOrigin =
            List<bool>.generate(originMainServicesIdList.length, (i) => false);
        emit(GetOriginMainServicesSuccessState());
      }
    }).catchError((error) {
      emit(GetOriginMainServicesErrorState(error.toString()));
    });
  }
//this function to get Origin Main Services Key
  int getOriginMainServicesKey(var value) {
    var Key = originMainServicesIdList.keys.firstWhere(
        (k) => originMainServicesIdList[k] == value,
        orElse: () => 1);
    return Key;
  }
//this function to change Check Box Origin Main Services
  void changeCheckBoxOriginMainServices({required index, required bool value}) {
    checkBoxOrigin =
        List<bool>.generate(originMainServicesIdList.length, (i) => false);
    checkBoxOrigin[index] = value;
    originService = originMainServicesList[index];
    if (originService == 'Pick-UP') {
      isPickUp = !isPickUp;
    }
    emit(StorageCheckBoxChangeState());
  }
//this function to get Radio Button
  void getRadioButton({
    required fromCountryID,
    required toCityID,
  }) {
    radioButtonStorageList = [];
    radioButtonStorageIdList = <int, String>{};
    emit(GetRadioButtonLoadingState());
    DioHelper.postData(
      url: StorageRadioButton,
      data: {
        "from_country_id": fromCountryID,
        "to_city_id": toCityID,
      },
    ).then((value) async {
      var list = value.data;
      for (var item in list) {
        radioButtonStorageList.add(item['service_type_size_name']);
        radioButtonStorageIdList[item['service_type_size_id'].toInt()] =
            item['service_type_size_name'];
      }
      emit(GetRadioButtonSuccessState());
    }).catchError((error) {
      emit(GetRadioButtonErrorState(error.toString()));
    });
  }
//this function to get Radio button Key
  int getRadioKey(var value) {
    var Key = radioButtonStorageIdList.keys.firstWhere(
        (k) => radioButtonStorageIdList[k] == value,
        orElse: () => 0);
    return Key;
  }
//this function to change Check Box
  void changeCheckBox(value) {
    checkbox = value;
    emit(StorageChangeCheckBoxState());
  }
//this function to change Country
  void changeCountry(value) {
    fromCountry = value;
    emit(StorageChangeCountryState());
  }
//this function to change City
  void changeCity(value) {
    fromCity = value;
    emit(StorageChangeCityState());
  }
//this function to change Size
  void changeSize(value) {
    size = value;
    emit(StorageChangeSizeState());
  }
//this function to change Character
  void changeCharacter(value) {
    character = value;
    emit(StorageChangeCharacterState());
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
    emit(StorageSizeLoadingState());
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
      emit(StorageSizeSuccessState());
    }).catchError((error) {
      emit(StorageSizeErrorState(error.toString()));
    });
  }
//this function to get Size Key
  int getSizeKey(var value) {
    var sizeKey = sizeIdList.keys
        .firstWhere((k) => sizeIdList[k] == value, orElse: () => 1);
    return sizeKey;
  }
//this function to submit Storage Quote
  void submitStorageQuote({
    required storage_country_id,
    required storage_country_name,
    required storage_city_id,
    required storage_city_name,
    required radio_storage_service_type_id,
    required storage_from_date,
    required storage_to_date,
    required storage_size_dropdownlist_id,
    required storage_org_id,
    required is_storage_size,
    required storage_desc,
    required lang,
    required first_name,
    required email,
    required phone_country_code,
    required mob,
  }) {
    emit(StorageLoadingState());
    DioHelper.postData(
      url: Storage_quote,
      data: {
        "storage_country": 0,
        "storage_country_id": storage_country_id,
        "storage_country_name": storage_country_name,
        "storage_city_id": storage_city_id,
        "storage_city_name": storage_city_name,
        "radio_storage_service_type_id": radio_storage_service_type_id,
        "storage_from_date": storage_from_date,
        "storage_to_date": storage_to_date,
        "storage_size_dropdownlist_id": storage_size_dropdownlist_id,
        "storage_org_id": storage_org_id,
        "is_storage_size": is_storage_size,
        "storage_desc": checkbox ? storage_desc : '',
        "lang": lang,
        "first_name": first_name,
        "email": email,
        "phone_country_code": phone_country_code,
        "mob": mob,
      },
    ).then((value) {
      print(11111111111);
      print(value.data);
      if (value.data.runtimeType == String) {
        emit(StorageErrorState(value.data));
      } else {
        emit(StorageSuccessState());
      }
    }).catchError((error) {
      emit(StorageErrorState(error.toString()));
    });
  }
}

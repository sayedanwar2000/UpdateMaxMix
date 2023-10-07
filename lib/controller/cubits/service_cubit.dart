// ignore_for_file: non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/endpointer.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/service_states.dart';

class ServiceCubit extends Cubit<ServiceStates> {
  ServiceCubit() : super(ServiceInitialState());

  static ServiceCubit get(context) => BlocProvider.of(context);

  List<String> countryList = [];
  List<String>? city = [];

  var countryIdList = <int, String>{};
  List<String> radioButtonList = [];
  var radioButtonIdList = <int, String>{};
  var cityIdList = <int, String>{};
  var cityList = <int, List<String>>{};
  List<String> fromPortList = [];
  var fromPortIdList = <int, String>{};
  List<String> toPortList = [];
  var toPortIdList = <int, String>{};
  List<String> countryToList = [];
  var countryToIdList = <int, String>{};
  List<String> cityToList = [];
  var cityToIdList = <int, String>{};
  List<String> wUnitList = [];
  var wUnitIdList = <int, String>{};
  List<String> lUnitList = [];
  var lUnitIdList = <int, String>{};

  bool done = false;

  //this function to get Weight Unit
  void getWUnit() {
    emit(GetWUnitLoadingState());
    if (wUnitList.isEmpty) {
      DioHelper.getData(
        url: cu_rrency,
        query: {
          'scode': 'wunit',
        },
      ).then((value) {
        var list = value.data;
        for (var item in list) {
          wUnitList.add(item['def_name']);
          wUnitIdList[item['id'].toInt()] = item['def_name'];
        }
        emit(GetWUnitSuccessState());
      }).catchError((error) {
        emit(GetWUnitErrorState(error.toString()));
      });
    } else {
      emit(GetWUnitSuccessState());
    }
  }
//this function to get Dimensions Unit
  void getLUnit() {
    emit(GetLUnitLoadingState());
    if (lUnitList.isEmpty) {
      DioHelper.getData(
        url: cu_rrency,
        query: {
          'scode': 'lunit',
        },
      ).then((value) {
        var list = value.data;
        for (var item in list) {
          lUnitList.add(item['def_name']);
          lUnitIdList[item['id'].toInt()] = item['def_name'];
        }
        emit(GetLUnitSuccessState());
      }).catchError((error) {
        emit(GetLUnitErrorState(error.toString()));
      });
    } else {
      emit(GetLUnitSuccessState());
    }
  }
  //this function to get Country And City
  getCountryAndCity({
    required serviceID,
  }) {
    countryList = [];
    city = [];
    countryIdList = <int, String>{};
    cityIdList = <int, String>{};
    cityList = <int, List<String>>{};
    emit(ServiceCountryLoadingState());
    if (countryList.isEmpty) {
      DioHelper.postData(
        url: countriesService,
        data: {
          'service_type_id': serviceID,
        },
      ).then((value) async {
        var list = value.data;
        for (var item in list) {
          countryList.add(item['route_from_country_name']);
          countryIdList[item['route_from_country'].toInt()] =
              item['route_from_country_name'];
        }
        emit(ServiceCityLoadingState());
        for (int K in countryIdList.keys) {
          await DioHelper.postData(
            url: citiesService,
            data: {
              "service_type_id": serviceID,
              "from_country_id": K,
            },
          ).then((value) {
            var list = value.data;
            List<String> city2 = [];
            for (var item in list) {
              city!.add(item['city_name']);
              city2.add(item['city_name']);
              cityIdList[item['city_id'].toInt()] = item['city_name'];
            }
            cityList[K] = city2;
            emit(ServiceCitySuccessState());
          }).catchError((error) {
            emit(ServiceCityErrorState(error.toString()));
          });
        }
        emit(ServiceCountrySuccessState());
      }).catchError((error) {
        emit(ServiceCountryErrorState(error.toString()));
      });
    } else {
      emit(ServiceCountrySuccessState());
    }
  }
//this function to get Country To
  void getCountryTo({
    required fromCountryID,
    required serviceID,
  }) {
    countryToList = [];
    countryToIdList = <int, String>{};
    emit(GetCountryToLoadingState());
    DioHelper.postData(
      url: getCountryToEndPointer,
      data: {"service_type_id": serviceID, "from_country_id": fromCountryID},
    ).then((value) async {
      var list = value.data;
      for (var item in list) {
        countryToList.add(item['route_to_country_name']);
        countryToIdList[item['route_to_country'].toInt()] =
            item['route_to_country_name'];
      }
      emit(GetCountryToSuccessState());
    }).catchError((error) {
      emit(GetCountryToErrorState(error.toString()));
    });
  }
//this function to get City To
  void getCityTo({
    required fromCountryID,
    required fromCityID,
    required toCountryID,
  }) {
    cityToList = [];
    cityToIdList = <int, String>{};
    emit(GetCityToLoadingState());
    DioHelper.postData(
      url: getCityToEndPointer,
      data: {
        "from_country_id": fromCountryID,
        "from_city_id": fromCityID,
        "to_country_id": toCountryID
      },
    ).then((value) async {
      var list = value.data;
      for (var item in list) {
        cityToList.add(item['city_name']);
        cityToIdList[item['city_id'].toInt()] = item['city_name'];
      }
      emit(GetCityToSuccessState());
    }).catchError((error) {
      emit(GetCityToErrorState(error.toString()));
    });
  }
//this function to change City
  void changeCity(var country) {
    int key = getCountryKey(country);
    city = [];
    city = cityList[key];
    emit(ServiceCityChangeState());
  }
//this function to change State
  void changeState() {
    done = !done;
    emit(StateChangeState());
  }
//this function to get From Port
  void getFromPort({
    required fromCountryID,
    required portType,
  }) {
    fromPortList = [];
    fromPortIdList = <int, String>{};
    emit(GetFromPortLoadingState());
    DioHelper.postData(
      url: getPorts,
      data: {"port_type": portType, "from_country_id": fromCountryID},
    ).then((value) async {
      var list = value.data;
      for (var item in list) {
        fromPortList.add(item['port_name']);
        fromPortIdList[item['id'].toInt()] = item['port_name'];
      }
      emit(GetFromPortSuccessState());
    }).catchError((error) {
      emit(GetFromPortErrorState(error.toString()));
    });
  }
//this function to get From Port Key
  int getFromPortKey(var value) {
    var Key = fromPortIdList.keys
        .firstWhere((k) => fromPortIdList[k] == value, orElse: () => 0);
    return Key;
  }
//this function to get To Port
  void getToPort({
    required toCountryID,
    required portType,
  }) {
    toPortList = [];
    toPortIdList = <int, String>{};
    emit(GetToPortLoadingState());
    DioHelper.postData(
      url: getPorts,
      data: {"port_type": portType, "from_country_id": toCountryID},
    ).then((value) async {
      var list = value.data;
      for (var item in list) {
        toPortList.add(item['port_name']);
        toPortIdList[item['id'].toInt()] = item['port_name'];
      }
      emit(GetToPortSuccessState());
    }).catchError((error) {
      emit(GetToPortErrorState(error.toString()));
    });
  }
//this function to get To Port Key
  int getToPortKey(var value) {
    var Key = toPortIdList.keys
        .firstWhere((k) => toPortIdList[k] == value, orElse: () => 0);
    return Key;
  }
//this function to get City To Key
  int getCityToKey(var value) {
    var Key = cityToIdList.keys
        .firstWhere((k) => cityToIdList[k] == value, orElse: () => 0);
    return Key;
  }
//this function to get Country To Key
  int getCountryToKey(var value) {
    var Key = countryToIdList.keys
        .firstWhere((k) => countryToIdList[k] == value, orElse: () => 0);
    return Key;
  }
//this function to get Country Key
  int getCountryKey(var value) {
    var Key = countryIdList.keys
        .firstWhere((k) => countryIdList[k] == value, orElse: () => 0);
    return Key;
  }
//this function to get City Key
  int getCityKey(var value) {
    var Key = cityIdList.keys
        .firstWhere((k) => cityIdList[k] == value, orElse: () => 0);
    return Key;
  }
//this function to get Dimensions Unit Key
  int getLUnitKey(var value) {
    var Key = lUnitIdList.keys
        .firstWhere((k) => lUnitIdList[k] == value, orElse: () => 0);
    return Key;
  }
//this function to get Weight Unit Key
  int getWUnitKey(var value) {
    var Key = wUnitIdList.keys
        .firstWhere((k) => wUnitIdList[k] == value, orElse: () => 0);
    return Key;
  }
}

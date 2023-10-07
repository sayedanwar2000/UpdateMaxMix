// ignore_for_file: prefer_typing_uninitialized_variables, invalid_return_type_for_catch_error, null_check_always_fails, non_constant_identifier_names
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/endpointer.dart';
import 'package:masmix/controller/share/network/local/cache_helper/cache.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/app_states.dart';
import 'package:http/http.dart' as http;

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  List<String> countryCodeList = [];
  List<String> countryList = [];
  List<String> accountTypeList = [];
  List<String> languageList = [];
  List<String> currencyList = [];
  List<String> city = [];
  List<String>? getCity = [];
  var ipAddress;
  var appLanguage = CacheHelper.getData(key: 'language') ?? 'en';
  var currencyIdList = <int, String>{};
  var languageIdList = <int, String>{};
  var accountTypeIdList = <int, String>{};
  var countryIdList = <int, String>{};
  var countryCodeIdList = <String, dynamic>{};
  var cityIdList = <int, String>{};
  var cityList = <int, List<String>>{};

  //this function to get Currencys
  void getCurrencys() {
    emit(CurrencyLoadingState());
    if (currencyList.isEmpty) {
      DioHelper.getData(
        url: cu_rrency,
        query: {
          'scode': 'currency',
        },
      ).then((value) {
        var list = value.data;
        for (var item in list) {
          currencyList.add(item['def_name']);
          currencyIdList[item['id'].toInt()] = item['def_name'];
        }
        emit(CurrencySuccessState());
      }).catchError((error) {
        emit(CurrencyErrorState(error.toString()));
      });
    } else {
      emit(CurrencySuccessState());
    }
  }
//this function to get Language
  void getLanguage() {
    emit(LanguageLoadingState());
    if (languageList.isEmpty) {
      DioHelper.getData(
        url: cu_rrency,
        query: {
          'scode': 'languages',
        },
      ).then((value) {
        var list = value.data;
        for (var item in list) {
          languageList.add(item['def_name']);
          languageIdList[item['id'].toInt()] = item['def_name'];
        }
        emit(LanguageSuccessState());
      }).catchError((error) {
        emit(LanguageErrorState(error.toString()));
      });
    } else {
      emit(LanguageSuccessState());
    }
  }
//this function to get Account Type
  void getAccountType() {
    emit(AccountTypeLoadingState());
    if (accountTypeList.isEmpty) {
      DioHelper.getData(
        url: cu_rrency,
        query: {
          'scode': 'acc_type',
        },
      ).then((value) {
        var list = value.data;
        for (var item in list) {
          accountTypeList.add(item['def_name']);
          accountTypeIdList[item['id'].toInt()] = item['def_name'];
        }
        emit(AccountTypeSuccessState());
      }).catchError((error) {
        emit(AccountTypeErrorState(error.toString()));
      });
    } else {
      emit(AccountTypeSuccessState());
    }
  }
//this function to get Country
  void getCountry() {
    emit(CountryLoadingState());
    if (countryList.isEmpty) {
      DioHelper.getData(
        url: countries,
      ).then((value) async {
        var list = value.data;
        for (var item in list) {
          countryList.add(item['country_Name']);
          countryIdList[item['country_id'].toInt()] = item['country_Name'];
        }
        emit(CityLoadingState());
        for (int K in countryIdList.keys) {
          await DioHelper.getData(
            url: cities,
            query: {
              'id': K,
            },
          ).then((value) {
            var list = value.data;
            List<String> city2 = [];
            for (var item in list) {
              city.add(item['city_name']);
              city2.add(item['city_name']);
              cityIdList[item['city_id'].toInt()] = item['city_name'];
            }
            cityList[K] = city2;
            emit(CitySuccessState());
          }).catchError((error) {
            emit(CityErrorState(error.toString()));
          });
        }
        emit(CountrySuccessState());
      }).catchError((error) {
        emit(CountryErrorState(error.toString()));
      });
    } else {
      emit(CountrySuccessState());
    }
  }
//this function to get Country Code
  void getCountryCode() {
    emit(CountryCodeLoadingState());
    if (countryCodeList.isEmpty) {
      DioHelper.getData(
        url: country_code,
      ).then((value) {
        countryCodeIdList = value.data;
        for (var item in countryCodeIdList.values) {
          countryCodeList.add(item);
        }
        emit(CountryCodeSuccessState());
      }).catchError((error) {
        emit(CountryCodeErrorState(error.toString()));
      });
    } else {
      emit(CountrySuccessState());
    }
  }
//this function to get Country Key
  int getCountryKey(var value) {
    var countryKey = countryIdList.keys
        .firstWhere((k) => countryIdList[k] == value, orElse: () => 0);
    return countryKey;
  }
//this function to get Account Type Key
  int getAccountTypKey(var value) {
    var accountTypeKey = accountTypeIdList.keys
        .firstWhere((k) => accountTypeIdList[k] == value, orElse: () => 1);
    return accountTypeKey;
  }
//this function to get Language Key
  int getLanguageKey(var value) {
    var languageKey = languageIdList.keys
        .firstWhere((k) => languageIdList[k] == value, orElse: () => 1);
    return languageKey;
  }
//this function to get City Key
  int getCityKey(var value) {
    var cityKey = cityIdList.keys
        .firstWhere((k) => cityIdList[k] == value, orElse: () => 1);
    return cityKey;
  }
//this function to get Currency Key
  int getCurrencyKey(var value) {
    var currencyKey = currencyIdList.keys
        .firstWhere((k) => currencyIdList[k] == value, orElse: () => 1);
    return currencyKey;
  }
//this function to get City Value
  getCityValue(var value) {
    var cityKey = cityIdList[value];
    return cityKey;
  }
//this function to get Account Type Value
  getAccountTypValue(var value) {
    var accountTypeKey = accountTypeIdList[value];
    return accountTypeKey;
  }
//this function to get Country Value
  getCountryValue(var value) {
    var countryKey = countryIdList[value];
    return countryKey;
  }
//this function to get Currency Value
  getCurrencyValue(var value) {
    var currencyKey = currencyIdList[value];
    return currencyKey;
  }
//this function to get Language Value
  getLanguageValue(var value) {
    var languageKey = languageIdList[value];
    return languageKey;
  }
//this function to get IP Address user
  Future<void> getIPAddress() async {
    emit(GetIPLoadingState());
    try {
      final url = Uri.parse('https://api.ipify.org');
      final response = await http.get(url);
      ipAddress = response.statusCode == 200 ? response.body : null;
      emit(GetIPSuccessState());
    } catch (error) {
      emit(GetIPErrorState(error.toString()));
    }
  }
//this function to change City
  void changeCity({var country}) {
    if (country == null) {
      int key = getCountryKey(country);
      getCity = cityList[key];
    } else {
      getCity = city;
    }
    emit(CityChangeState());
  }
//this function to change App Language
  void changeAppLanguage(value) {
    appLanguage = value;
    emit(AppLanguageChangeState());
  }
}

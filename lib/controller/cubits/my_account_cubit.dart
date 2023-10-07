// ignore_for_file: non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/my_account_state.dart';
import 'package:masmix/controller/share/network/endpointer.dart';

class MyAccountCubit extends Cubit<MyAccountStates> {
  MyAccountCubit() : super(MyAccountInitialState());

  static MyAccountCubit get(context) => BlocProvider.of(context);
  dynamic countrycode;
  dynamic countrycode2;
  dynamic accountType;
  dynamic language;
  dynamic country;
  dynamic city;
  dynamic currency;
  List<dynamic> myAddress = [];
  List<int> countryCodeList = [];
  List<int> cityCodeList = [];
  List<bool> isAddList = [];

  //this function to change Country Code
  void changeCountryCode(var value) {
    countrycode = value;
    emit(MyAccountChangeCountryCodeState());
  }
//this function to change Country Code2
  void changeCountryCode2(var value) {
    countrycode2 = value;
    emit(MyAccountChangeCountryCode2State());
  }
//this function to change Account Type
  void changeAccountType(var value) {
    accountType = value;
    emit(MyAccountChangeAccountTypeState());
  }
//this function to change Language
  void changeLanguage(var value) {
    language = value;
    emit(MyAccountChangeLanguageState());
  }
//this function to change Country
  void changeCountry({
    required value,
    isCode = false,
    index,
  }) {
    if (isCode) {
      countryCodeList[index] = value;
    } else {
      country = value;
    }
    emit(MyAccountChangeCountryState());
  }
//this function to change Count Address
  void changeCountAddress({
    isAdd = false,
    index,
  }) {
    if (isAdd) {
      myAddress.add({});
      countryCodeList.add(0);
      cityCodeList.add(0);
      isAddList.add(false);
    } else {
      myAddress.removeAt(index);
      countryCodeList.removeAt(index);
      cityCodeList.removeAt(index);
      isAddList.removeAt(index);
    }
    emit(MyAccountChangeItemCountAddressState());
  }
//this function to user UpDate data
  void userUpDate({
    required String id,
    required String accountType,
    required String accountTypeName,
    required String defaultLanguage,
    required String fName,
    required String lNme,
    required String mob,
    required String phoneCountryCode,
    required String invoiceAddress,
    required String invoiceCountryCode,
    required String invoiceCityCode,
    required String emailSent,
    required String currency,
    String? referralCode,
    String? invoiceStateCode,
    String? invoiceZipPostalCode,
    String? voucherCode,
    String? companyCode,
  }) {
    emit(UpDateLoadingState());
    DioHelper.postData(
      url: UpDate,
      data: {
        'id': id,
        'account_type': accountType,
        'account_type_name': accountTypeName,
        'default_language': defaultLanguage,
        'referral_code': referralCode,
        'f_name': fName,
        'l_name': lNme,
        'mob': mob,
        'phone_country_code': phoneCountryCode,
        'invoice_address': invoiceAddress,
        'invoice_country_code': invoiceCountryCode,
        'invoice_state_code': invoiceStateCode,
        'invoice_city_code': invoiceCityCode,
        'invoice_zip_postal_code': invoiceZipPostalCode,
        'email_sent': emailSent,
        'currency': currency,
        'voucher_code': voucherCode,
        'company_code': companyCode,
      },
    ).then((value) {
      if (value.data.runtimeType == String) {
        emit(UpDateSuccessState());
      }
    }).catchError((error) {
      emit(UpDateErrorState());
    });
  }
//this function to change City
  void changeCity({
    required value,
    isCode = false,
    index,
  }) {
    if (isCode) {
      cityCodeList[index] = value;
    } else {
      city = value;
    }
    emit(MyAccountChangeCityState());
  }
//this function to change Currency
  void changeCurrency(var value) {
    currency = value;
    emit(MyAccountChangeCurrencyState());
  }
//this function to get Address
  void getMyAddress({
    required userId,
  }) {
    myAddress = [];
    isAddList = [];
    countryCodeList = [];
    cityCodeList = [];
    emit(GetMyAddressLoadingState());
    DioHelper.postData(
      url: GetMyAddress,
      data: {
        "user_id": userId,
      },
    ).then((value) {
      myAddress = value.data;
      countryCodeList = List.generate(myAddress.length, (index) => 0);
      cityCodeList = List.generate(myAddress.length, (index) => 0);
      for (int i = 0; i < myAddress.length; i++) {
        countryCodeList[i] = myAddress[i]['country_code'].round();
        cityCodeList[i] = myAddress[i]['city_code'].round();
      }
      isAddList = List.generate(myAddress.length, (index) => true);
      emit(GetMyAddressSuccessState());
    }).catchError((error) {
      emit(GetMyAddressErrorState());
    });
  }
//this function to add Address
  void addMyAddress({
    required userId,
    required address,
    required state,
    required zip,
    required index,
  }) {
    emit(AddMyAddressLoadingState());
    DioHelper.postData(
      url: AddMyAddress,
      data: {
        "UserId": userId,
        "address": address,
        "countryId": countryCodeList[index],
        "state": state,
        "cityID": cityCodeList[index],
        "zip_postal_code": zip,
      },
    ).then((value) {
      myAddress[index] = value.data[0];
      isAddList[index] = true;
      emit(AddMyAddressSuccessState());
    }).catchError((error) {
      emit(AddMyAddressErrorState());
    });
  }
//this function to update Address
  void updateMyAddress({
    required addressId,
    required address,
    required state,
    required zip,
    required index,
  }) {
    emit(UpdateMyAddressLoadingState());
    DioHelper.postData(
      url: UpdateMyAddress,
      data: {
        "AddressId": addressId,
        "address": address,
        "countryId": countryCodeList[index],
        "state": state,
        "cityID": cityCodeList[index],
        "zip_postal_code": zip,
      },
    ).then((value) {
      myAddress[index] = value.data[0];
      isAddList[index] = true;
      emit(UpdateMyAddressSuccessState());
    }).catchError((error) {
      emit(UpdateMyAddressErrorState());
    });
  }
//this function to delete Address
  void deleteMyAddress({
    required addressId,
    required index,
  }) {
    emit(DeleteMyAddressLoadingState());
    DioHelper.postData(
      url: DeleteMyAddress,
      data: {
        "AddressId": addressId,
      },
    ).then((value) {
      changeCountAddress(index: index);
      emit(DeleteMyAddressSuccessState());
    }).catchError((error) {
      emit(DeleteMyAddressErrorState());
    });
  }
}

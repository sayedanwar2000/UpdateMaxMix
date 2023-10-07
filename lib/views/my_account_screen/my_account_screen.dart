// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/app_cubit.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/cubits/my_account_cubit.dart';
import 'package:masmix/controller/share/components/card_address_info.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/components/text_form_field.dart';
import 'package:masmix/controller/share/network/local/cache_helper/cache.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/controller/states/my_account_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyAccountScreen extends StatelessWidget {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone1 = TextEditingController();
  TextEditingController State = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController companyCode = TextEditingController();
  TextEditingController voucherCode = TextEditingController();
  TextEditingController phone2 = TextEditingController();
  List<TextEditingController> stateList = [];
  List<TextEditingController> addressList = [];
  List<TextEditingController> postalCodeList = [];
  String username = CacheHelper.getData(key: 'username') ?? '';
  String password = CacheHelper.getData(key: 'password') ?? '';

  MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appCubit = AppCubit.get(context);
    var userData = LoginCubit.get(context).loginModel;
    var myAccountCubit = MyAccountCubit.get(context)
      ..getMyAddress(userId: userData.id);
    var loginCubit = LoginCubit.get(context);
    firstName.text = userData.fName.toString();
    lastName.text = userData.lName.toString();
    email.text = userData.email.toString();
    phone1.text = userData.mob.toString();
    State.text = userData.invoiceStateCode.toString();
    postalCode.text = userData.invoiceZipPostalCode.toString();
    address.text = userData.invoiceAddress.toString();
    companyCode.text = userData.companyCode.toString() == '0'
        ? ''
        : userData.companyCode.toString();
    voucherCode.text = userData.voucherCode.toString();
    phone2.text = userData.mob1.toString();
    myAccountCubit.changeLanguage(myAccountCubit.language ??
        appCubit.getLanguageValue(userData.defaultLanguage));
    myAccountCubit.changeCountry(
      value: myAccountCubit.country ??
          appCubit.getCountryValue(userData.invoiceCountryCode),
    );
    myAccountCubit.changeCity(
      value: myAccountCubit.city ??
          appCubit.getCityValue(userData.invoiceCityCode),
    );
    return BlocConsumer<MyAccountCubit, MyAccountStates>(
      listener: (context, state) {
        print(state);
        if (state is UpDateSuccessState) {
          loginCubit.userLogin(email: username, password: password);
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: AppLocalizations.of(context)!.success,
              message: AppLocalizations.of(context)!.upDateMessageSuccess,
              contentType: ContentType.success,
              // to configure for material banner
              inMaterialBanner: true,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        } else if (state is UpDateErrorState) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: AppLocalizations.of(context)!.error,
              message: AppLocalizations.of(context)!.upDateMessageError,
              contentType: ContentType.failure,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.titleProfileScreen),
            centerTitle: true,
          ),
          endDrawer: defaultDrawer(context: context),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 30.0,
                left: 10.0,
                right: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.accountInfo,
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  myDivider(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: defaultField(
                          label: AppLocalizations.of(context)!.firstName,
                          widget: defaultTextFormField(
                            controll: firstName,
                            type: TextInputType.text,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: defaultField(
                          label: AppLocalizations.of(context)!.lastName,
                          widget: defaultTextFormField(
                            controll: lastName,
                            type: TextInputType.text,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: defaultField(
                          label: AppLocalizations.of(context)!.countryCode,
                          widget: defaultDropdownSearch(
                            items: appCubit.countryCodeList,
                            isSearch: true,
                            onChang: (value) {
                              myAccountCubit.changeCountryCode(value);
                            },
                            selected:
                                userData.phoneCountryCode.toString() == 'null'
                                    ? 'Select'
                                    : userData.phoneCountryCode.toString(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: defaultField(
                          label: AppLocalizations.of(context)!.phoneNo,
                          widget: defaultTextFormField(
                            controll: phone1,
                            type: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultField(
                    label: AppLocalizations.of(context)!.email,
                    widget: defaultTextFormField(
                      controll: email,
                      type: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: defaultField(
                          label: AppLocalizations.of(context)!.accountType,
                          widget: defaultDropdownSearch(
                            items: appCubit.accountTypeList,
                            onChang: (value) {
                              myAccountCubit.changeAccountType(value);
                            },
                            height: 120,
                            selected:
                                userData.accountTypeName.toString() == 'null'
                                    ? 'Select'
                                    : userData.accountTypeName.toString(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: defaultField(
                          label: AppLocalizations.of(context)!.chooseLanguage,
                          widget: defaultDropdownSearch(
                            items: appCubit.languageList,
                            onChang: (value) {
                              myAccountCubit.changeLanguage(value);
                            },
                            height: 120,
                            selected: myAccountCubit.language,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  myDivider(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultField(
                    label: AppLocalizations.of(context)!.chooseCurrency,
                    widget: defaultDropdownSearch(
                      items: appCubit.currencyList,
                      onChang: (value) {
                        myAccountCubit.changeCurrency(value);
                      },
                      height: 170,
                      selected: userData.currencyName.toString(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: defaultField(
                          label: AppLocalizations.of(context)!.companyCode,
                          widget: defaultTextFormField(
                            controll: companyCode,
                            type: TextInputType.text,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: defaultField(
                          label: AppLocalizations.of(context)!.voucherCode,
                          widget: defaultTextFormField(
                            controll: voucherCode,
                            type: TextInputType.text,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: defaultField(
                          label: AppLocalizations.of(context)!.countryCode,
                          widget: defaultDropdownSearch(
                            items: appCubit.countryCodeList,
                            isSearch: true,
                            onChang: (value) {
                              myAccountCubit.changeCountryCode2(value);
                            },
                            selected: userData.phoneCountryCode2.toString(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: defaultField(
                          label: AppLocalizations.of(context)!.phoneNo2,
                          widget: defaultTextFormField(
                            controll: phone2,
                            type: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  cardAddressInfo(
                    context: context,
                    countryList: appCubit.countryList,
                    functionCountry: (value) {
                      myAccountCubit.changeCountry(value: value);
                    },
                    selectCountry: myAccountCubit.country,
                    city: appCubit.city,
                    state: State,
                    address: address,
                    postalCode: postalCode,
                    functionCity: (value) {
                      myAccountCubit.changeCity(value: value);
                    },
                    selectCity: myAccountCubit.city,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (stateList.length < myAccountCubit.myAddress.length) {
                        stateList.add(TextEditingController());
                        addressList.add(TextEditingController());
                        postalCodeList.add(TextEditingController());
                      } else {
                        stateList[index].text =
                            myAccountCubit.myAddress[index]['state_code'];
                        addressList[index].text =
                            myAccountCubit.myAddress[index]['address'];
                        postalCodeList[index].text =
                            myAccountCubit.myAddress[index]['zip_postal_code'].toString();
                      }
                      return cardAddressInfo(
                        context: context,
                        isList: true,
                        index: index,
                        countryList: appCubit.countryList,
                        functionCountry: (value) {
                          myAccountCubit.changeCountry(
                            value: appCubit.getCountryKey(value),
                            index: index,
                            isCode: true,
                          );
                        },
                        selectCountry:
                            myAccountCubit.countryCodeList[index] == 0
                                ? 'Select'
                                : appCubit.getCountryValue(
                                    myAccountCubit.countryCodeList[index]),
                        city: appCubit.city,
                        state: stateList[index],
                        address: addressList[index],
                        postalCode: postalCodeList[index],
                        functionCity: (value) {
                          myAccountCubit.changeCity(
                            value: appCubit.getCityKey(value),
                            isCode: true,
                            index: index,
                          );
                        },
                        selectCity: myAccountCubit.cityCodeList[index] == 0
                            ? 'Select'
                            : appCubit.getCityValue(
                                myAccountCubit.cityCodeList[index]),
                        functionAdd: () {
                          myAccountCubit.addMyAddress(
                            userId: userData.id,
                            address: addressList[index].text,
                            state: stateList[index].text,
                            zip: postalCodeList[index].text,
                            index: index,
                          );
                        },
                        functionUpdate: () {
                          myAccountCubit.updateMyAddress(
                            addressId:
                                myAccountCubit.myAddress[index]['id'].round(),
                            address: addressList[index].text,
                            state: stateList[index].text,
                            zip: postalCodeList[index].text,
                            index: index,
                          );
                        },
                        functionDelete: () {
                          myAccountCubit.deleteMyAddress(
                            addressId:
                                myAccountCubit.myAddress[index]['id'].round(),
                            index: index,
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20.0,
                    ),
                    itemCount: myAccountCubit.myAddress.length,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    children: [
                      defaultButton(
                        width: double.infinity,
                        text: AppLocalizations.of(context)!.otherAddresses,
                        function: () {
                          myAccountCubit.changeCountAddress(isAdd: true);
                        },
                        color: defaultColorNavyBlue,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultButton(
                        width: double.infinity,
                        text: AppLocalizations.of(context)!.upDateAccountButton,
                        function: () {
                          myAccountCubit.userUpDate(
                            id: userData.id.toString(),
                            accountType: appCubit
                                .getAccountTypKey(myAccountCubit.accountType)
                                .toString(),
                            accountTypeName:
                                myAccountCubit.accountType.toString(),
                            defaultLanguage: appCubit
                                .getLanguageKey(myAccountCubit.language)
                                .toString(),
                            fName: firstName.text,
                            lNme: lastName.text,
                            mob: phone1.text,
                            phoneCountryCode:
                                myAccountCubit.countrycode.toString(),
                            invoiceAddress: address.text,
                            invoiceCountryCode: appCubit
                                .getCountryKey(myAccountCubit.country)
                                .toString(),
                            invoiceCityCode: appCubit
                                .getCityKey(myAccountCubit.city)
                                .toString(),
                            emailSent: userData.emailSent.toString(),
                            currency: appCubit
                                .getCurrencyKey(myAccountCubit.currency)
                                .toString(),
                            voucherCode: voucherCode.text,
                            companyCode: companyCode.text,
                            invoiceStateCode: State.text,
                            invoiceZipPostalCode: postalCode.text,
                            referralCode: userData.referralCode.toString(),
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
      },
    );
  }
}

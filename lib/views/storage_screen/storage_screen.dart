// ignore_for_file: must_be_immutable, constant_identifier_names, unrelated_type_equality_checks

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:masmix/controller/cubits/app_cubit.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/cubits/service_cubit.dart';
import 'package:masmix/controller/cubits/storage_cubit.dart';
import 'package:masmix/controller/share/components/check_box.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/components/pickup_service.dart';
import 'package:masmix/controller/share/components/radio_button_storage.dart';
import 'package:masmix/controller/share/components/text_form_field.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/controller/states/storage_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StorageScreen extends StatelessWidget {
  StorageScreen({super.key});

  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController zipCodePickup = TextEditingController();
  TextEditingController pickupDate = TextEditingController();
  TextEditingController address = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    var storageCubit = StorageCubit.get(context);
    var lang = AppCubit.get(context).appLanguage;
    var serviceCubit = ServiceCubit.get(context)
      ..getCountryAndCity(serviceID: 4);
    var ind = 0;
    var ind1 = 0;
    return BlocConsumer<StorageCubit, StorageStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title:  Text(AppLocalizations.of(context)!.titleStorageScreen),
            centerTitle: true,
          ),
          endDrawer: defaultDrawer(context: context),
          body: SingleChildScrollView(
            child: Padding(
              padding:  const EdgeInsetsDirectional.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: defaultColorNavyBlue,
                        ),
                        borderRadius:
                            BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      child: Padding(
                        padding:  const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children:  [
                                const Icon(
                                  Icons.location_on,
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.geoData,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
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
                            Row(
                              children: [
                                Expanded(
                                  child: defaultField(
                                    label: AppLocalizations.of(context)!.country,
                                    widget: defaultDropdownSearch(
                                      items: serviceCubit.countryList,
                                      onChang: (value) {
                                        serviceCubit.changeCity(value);
                                        storageCubit.changeCountry(value);
                                      },
                                      isSearch: true,
                                      selected: 'Select Coun..',
                                    ),
                                  ),
                                ),
                                 const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: defaultField(
                                    label: AppLocalizations.of(context)!.city,
                                    widget: defaultDropdownSearch(
                                      items: serviceCubit.city,
                                      onChang: (value) {
                                        storageCubit.changeCity(value);
                                        storageCubit.getRadioButton(
                                          fromCountryID:
                                              serviceCubit.getCountryKey(
                                            storageCubit.fromCountry,
                                          ),
                                          toCityID: serviceCubit.getCityKey(
                                            storageCubit.fromCity,
                                          ),
                                        );
                                      },
                                      isSearch: true,
                                      selected: 'Select City',
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
                                  child: defaultTextFormField(
                                    controll: fromDate,
                                    type: TextInputType.datetime,
                                    readOnly: true,
                                    ontap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(5050),
                                      ).then((value) {
                                        fromDate.text = DateFormat.yMd()
                                            .format(value!)
                                            .replaceAll('/', '-');
                                      });
                                    },
                                    validat: (value) {
                                      if (value!.isEmpty) {
                                        return AppLocalizations.of(context)!.errorDate;
                                      }
                                      return null;
                                    },
                                    label: AppLocalizations.of(context)!.fromDate,
                                    prefix: Icons.calendar_today,
                                  ),
                                ),
                                 const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: defaultTextFormField(
                                    controll: toDate,
                                    type: TextInputType.datetime,
                                    readOnly: true,
                                    ontap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(5050),
                                      ).then((value) {
                                        toDate.text = DateFormat.yMd()
                                            .format(value!)
                                            .replaceAll('/', '-');
                                      });
                                    },
                                    validat: (value) {
                                      if (value!.isEmpty) {
                                        return AppLocalizations.of(context)!.errorDate;
                                      }
                                      return null;
                                    },
                                    onSubmit: (String? value) {
                                      storageCubit.changeCharacter('');
                                    },
                                    label: AppLocalizations.of(context)!.toDate,
                                    prefix: Icons.calendar_today,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                     const SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: defaultColorNavyBlue,
                        ),
                        borderRadius:
                            BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      child: Padding(
                        padding:  const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              children:  [
                                const Icon(
                                  Icons.info,
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(AppLocalizations.of(context)!.serviceData),
                              ],
                            ),
                             const SizedBox(
                              height: 20.0,
                            ),
                            myDivider(),
                             const SizedBox(
                              height: 20.0,
                            ),
                            ListView.separated(
                              physics:  const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                ind += 2;
                                return radioButtonStorage(
                                  index: ind,
                                  onChanged: (String? value) {
                                    storageCubit.changeCharacter(value);
                                    storageCubit.getSize(
                                      fromCountryID: serviceCubit.getCountryKey(
                                        storageCubit.fromCountry,
                                      ),
                                      serviceSizeTypeId:
                                          storageCubit.getRadioKey(value),
                                      storageFromDate: fromDate.text,
                                      storageToDate: toDate.text,
                                      fromCityID: serviceCubit.getCityKey(
                                        storageCubit.fromCity,
                                      ),
                                    );
                                    storageCubit.getOriginMainServices(
                                      fromCountryID: serviceCubit.getCountryKey(
                                        storageCubit.fromCountry,
                                      ),
                                      fromCityID: serviceCubit.getCityKey(
                                        storageCubit.fromCity,
                                      ),
                                      toCountryID: serviceCubit.getCountryKey(
                                        storageCubit.fromCountry,
                                      ),
                                      toCityID: serviceCubit.getCityKey(
                                        storageCubit.fromCity,
                                      ),
                                      serviceID: 4,
                                      serviceSizeTypeID:
                                          storageCubit.getRadioKey(value),
                                    );
                                  },
                                  context: context,
                                  character: storageCubit.character,
                                  cubit: storageCubit,
                                );
                              },
                              separatorBuilder: (context, index) =>
                                   const SizedBox(
                                height: 0,
                              ),
                              itemCount: storageCubit.radioButtonStorageList.length ==
                                      1
                                  ? storageCubit.radioButtonStorageList.length
                                  : (storageCubit.radioButtonStorageList.length) ~/ 2,
                            ),
                            Padding(
                              padding:  const EdgeInsets.only(
                                left: 10.0,
                                right: 10.0,
                              ),
                              child: defaultField(
                                label: AppLocalizations.of(context)!.size,
                                widget: defaultDropdownSearch(
                                  items: storageCubit.sizeList,
                                  onChang: (String? value) {
                                    storageCubit.changeSize(value);
                                  },
                                  isSearch: true,
                                  selected: 'Select Size',
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                    value: storageCubit.checkbox,
                                    onChanged: (value) {
                                      storageCubit.changeCheckBox(value);
                                    }),
                                 Text(
                                   AppLocalizations.of(context)!.anotherSize,
                                ),
                              ],
                            ),
                            if (storageCubit.checkbox)
                              Padding(
                                padding:  const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  bottom: 10.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Text(AppLocalizations.of(context)!.description),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    defaultTextFormField(
                                      controll: description,
                                      type: TextInputType.text,
                                      maxline: 6,
                                    ),
                                  ],
                                ),
                              ),
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                ind1 += 2;
                                return checkBoxOriginMainServices(
                                  context: context,
                                  index: ind1,
                                  listCheckBox: storageCubit.checkBoxOrigin,
                                  list: storageCubit.originMainServicesList,
                                  function1: (bool? value) {
                                    storageCubit
                                        .changeCheckBoxOriginMainServices(
                                      index: index - 2,
                                      value: value!,
                                    );
                                  },
                                  function2: (bool? value) {
                                    storageCubit
                                        .changeCheckBoxOriginMainServices(
                                      index: index - 1,
                                      value: value!,
                                    );
                                  },
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 0,
                              ),
                              itemCount: storageCubit
                                          .originMainServicesList.length ==
                                      1
                                  ? storageCubit.originMainServicesList.length
                                  : (storageCubit
                                          .originMainServicesList.length) ~/
                                      2,
                            ),
                            if (storageCubit.isPickUp)
                              pickUpService(
                                pickupDate: pickupDate,
                                address: address,
                                context: context,
                                cubit: storageCubit,
                                zipCodePickup: zipCodePickup,
                                useAddress: storageCubit.useAddress,
                              ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /*defaultButton(
                                          text: 'ADD SIZE',
                                          function: () {},
                                          widt: 150,
                                          color: defaultColorNavyBlue,
                                        ),
                                        const Spacer(),*/
                                  defaultButton(
                                    text: AppLocalizations.of(context)!.submitButton,
                                    function: () {
                                      if (formKey.currentState!.validate()) {
                                        if (int.parse(fromDate.text
                                            .split('-')[0]) <
                                            int.parse(toDate.text
                                                .split('-')[0]) ||
                                            int.parse(fromDate.text
                                                .split('-')[1]) <
                                                int.parse(toDate.text
                                                    .split('-')[1])) {
                                          if (storageCubit.fromCity != null &&
                                              storageCubit.fromCountry != null) {
                                            storageCubit.submitStorageQuote(
                                              storage_country_id:
                                                  serviceCubit.getCountryKey(
                                                      storageCubit.fromCountry),
                                              storage_country_name:
                                                  storageCubit.fromCountry,
                                              storage_city_id:
                                                  serviceCubit.getCityKey(
                                                      storageCubit.fromCity),
                                              storage_city_name:
                                                  storageCubit.fromCity,
                                              radio_storage_service_type_id:
                                                  storageCubit.getRadioKey(
                                                      storageCubit.character),
                                              storage_from_date: fromDate.text,
                                              storage_to_date: toDate.text,
                                              storage_size_dropdownlist_id:
                                                  storageCubit.getSizeKey(
                                                      storageCubit.size),
                                              storage_org_id: storageCubit
                                                  .getOriginMainServicesKey(
                                                      storageCubit
                                                          .originService),
                                              is_storage_size:
                                                  storageCubit.checkbox,
                                              storage_desc: description.text,
                                              lang: lang == 'en' ? lang + '-US' : lang,
                                              first_name:
                                                  cubit.loginModel.fName,
                                              email: cubit.loginModel.email,
                                              phone_country_code: cubit
                                                  .loginModel.phoneCountryCode,
                                              mob: cubit.loginModel.mob,
                                            );
                                          }
                                        } else {
                                          final snackBar = SnackBar(
                                            elevation: 0,
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.transparent,
                                            content: AwesomeSnackbarContent(
                                              title: 'ُError!',
                                              message:
                                                  'To Date Must be grater than From Date',
                                              contentType: ContentType.failure,
                                            ),
                                          );
                                          ScaffoldMessenger.of(context)
                                            ..hideCurrentSnackBar()
                                            ..showSnackBar(snackBar);
                                        }
                                      }
                                    },
                                    width: 150,
                                    color: defaultColorNavyBlue,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        ind = 0;
        ind1 = 0;
        if (state is StorageChangeCityState) {
          storageCubit.size = '';
          storageCubit.character = '';
        }
        if (state is StorageSizeErrorState) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'ُError!',
              message: 'Please Correct Data!',
              contentType: ContentType.failure,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
        // if (state is StorageSuccessState) {
        //   final snackBar = SnackBar(
        //     elevation: 0,
        //     behavior: SnackBarBehavior.floating,
        //     backgroundColor: Colors.transparent,
        //     content: AwesomeSnackbarContent(
        //       title: 'Oh Hey!!',
        //       message: airCubit.successMessages,
        //       contentType: ContentType.success,
        //       // to configure for material banner
        //       inMaterialBanner: true,
        //     ),
        //   );
        //   ScaffoldMessenger.of(context)
        //     ..hideCurrentSnackBar()
        //     ..showSnackBar(snackBar);
        // } else if (state is AirSubmitErrorState) {
        //   final snackBar = SnackBar(
        //     elevation: 0,
        //     behavior: SnackBarBehavior.floating,
        //     backgroundColor: Colors.transparent,
        //     content: AwesomeSnackbarContent(
        //       title: 'ُError!',
        //       message: airCubit.errorMessages,
        //       contentType: ContentType.failure,
        //     ),
        //   );
        //   ScaffoldMessenger.of(context)
        //     ..hideCurrentSnackBar()
        //     ..showSnackBar(snackBar);
        // }
      },
    );
  }
}

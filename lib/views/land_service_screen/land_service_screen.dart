// ignore_for_file: must_be_immutable

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:masmix/controller/cubits/app_cubit.dart';
import 'package:masmix/controller/cubits/land_cubit.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/cubits/service_cubit.dart';
import 'package:masmix/controller/share/components/check_box.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/card_shipment_data.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/components/pickup_service.dart';
import 'package:masmix/controller/share/components/radio_button_service.dart';
import 'package:masmix/controller/share/components/radio_button_storage.dart';
import 'package:masmix/controller/share/components/text_form_field.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/controller/states/land_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LandServiceScreen extends StatelessWidget {
  LandServiceScreen({super.key});

  var formKey = GlobalKey<FormState>();
  TextEditingController serviceDate = TextEditingController();
  TextEditingController pickupDateStorage = TextEditingController();
  TextEditingController addressStorage = TextEditingController();
  TextEditingController zipCodePickupStorage = TextEditingController();
  TextEditingController descriptionofgoods = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController weight1 = TextEditingController();
  TextEditingController weight2 = TextEditingController();
  TextEditingController weight3 = TextEditingController();
  TextEditingController weight4 = TextEditingController();
  TextEditingController weight5 = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController height1 = TextEditingController();
  TextEditingController height2 = TextEditingController();
  TextEditingController height3 = TextEditingController();
  TextEditingController height4 = TextEditingController();
  TextEditingController height5 = TextEditingController();
  TextEditingController length = TextEditingController();
  TextEditingController length1 = TextEditingController();
  TextEditingController length2 = TextEditingController();
  TextEditingController length3 = TextEditingController();
  TextEditingController length4 = TextEditingController();
  TextEditingController length5 = TextEditingController();
  TextEditingController width = TextEditingController();
  TextEditingController width1 = TextEditingController();
  TextEditingController width2 = TextEditingController();
  TextEditingController width3 = TextEditingController();
  TextEditingController width4 = TextEditingController();
  TextEditingController width5 = TextEditingController();
  TextEditingController hsCode = TextEditingController();
  TextEditingController hsCode1 = TextEditingController();
  TextEditingController hsCode2 = TextEditingController();
  TextEditingController hsCode3 = TextEditingController();
  TextEditingController hsCode4 = TextEditingController();
  TextEditingController hsCode5 = TextEditingController();
  TextEditingController delcaredValue = TextEditingController();
  TextEditingController delcaredValue1 = TextEditingController();
  TextEditingController delcaredValue2 = TextEditingController();
  TextEditingController delcaredValue3 = TextEditingController();
  TextEditingController delcaredValue4 = TextEditingController();
  TextEditingController delcaredValue5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var serviceCubit = ServiceCubit.get(context)
      ..getCountryAndCity(serviceID: 2);
    var landCubit = LandCubit.get(context);
    var lang = AppCubit.get(context).appLanguage;
    var userModel = LoginCubit.get(context).loginModel;
    return BlocConsumer<LandCubit, LandStates>(
      builder: (context, state) {
        int ind = 0;
        int ind1 = 0;
        int ind2 = 0;
        int ind3 = 0;
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.titleLandScreen),
            centerTitle: true,
          ),
          endDrawer: defaultDrawer(context: context),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          AppLocalizations.of(context)!.goButton,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: defaultColorNavyBlue,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            defaultField(
                              label: 'Service Date',
                              widget: defaultTextFormField(
                                controll: serviceDate,
                                type: TextInputType.datetime,
                                readOnly: true,
                                ontap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(5050),
                                  ).then((value) {
                                    serviceDate.text = DateFormat.yMd()
                                        .format(value!)
                                        .replaceAll('/', '-');
                                  });
                                },
                                validat: (value) {
                                  if (value!.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .errorDate;
                                  }
                                  return null;
                                },
                                prefix: Icons.calendar_today,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: defaultField(
                                    label: AppLocalizations.of(context)!
                                        .originCountry,
                                    widget: defaultDropdownSearch(
                                      items: serviceCubit.countryList,
                                      isSearch: true,
                                      onChang: (value) {
                                        serviceCubit.changeCity(value);
                                        serviceCubit.getCountryTo(
                                          fromCountryID:
                                              serviceCubit.getCountryKey(value),
                                          serviceID: 2,
                                        );
                                        landCubit.changeFromCountry(value);
                                      },
                                      selected: 'Select Coun..',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: defaultField(
                                    label: AppLocalizations.of(context)!
                                        .originCity,
                                    widget: defaultDropdownSearch(
                                      items: serviceCubit.city,
                                      isSearch: true,
                                      onChang: (value) {
                                        landCubit.changeFromCity(value);
                                        landCubit.getRadioButton(
                                          fromCountryID:
                                              serviceCubit.getCountryKey(
                                                  landCubit.fromCountry),
                                          fromCityID: serviceCubit
                                              .getCityKey(landCubit.fromCity),
                                          isStorage: true,
                                        );
                                      },
                                      selected: 'Select City',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: defaultField(
                                    label: AppLocalizations.of(context)!
                                        .destinationCountry,
                                    widget: defaultDropdownSearch(
                                      items: serviceCubit.countryToList,
                                      isSearch: true,
                                      onChang: (value) {
                                        serviceCubit.getCityTo(
                                          fromCountryID:
                                              serviceCubit.getCountryKey(
                                                  landCubit.fromCountry),
                                          fromCityID: serviceCubit
                                              .getCityKey(landCubit.fromCity),
                                          toCountryID: serviceCubit
                                              .getCountryToKey(value),
                                        );

                                        landCubit.changeToCountry(value);
                                      },
                                      selected: 'Select Coun..',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: defaultField(
                                    label: AppLocalizations.of(context)!
                                        .destinationCity,
                                    widget: defaultDropdownSearch(
                                      items: serviceCubit.cityToList,
                                      isSearch: true,
                                      onChang: (value) {
                                        landCubit.changeToCity(value);
                                        landCubit.getRadioButton(
                                          fromCountryID:
                                              serviceCubit.getCountryKey(
                                                  landCubit.fromCountry),
                                          toCityID:
                                              serviceCubit.getCityToKey(value),
                                          toCountryID:
                                              serviceCubit.getCountryToKey(
                                                  landCubit.toCountry),
                                          fromCityID: serviceCubit
                                              .getCityKey(landCubit.fromCity),
                                          serviceID: 2,
                                        );
                                      },
                                      selected: 'Select City',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.local_shipping,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          AppLocalizations.of(context)!.shipmentType,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: defaultColorNavyBlue,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 20.0,
                        ),
                        child: Column(
                          children: [
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                ind += 2;
                                return radioButtonService(
                                  index: ind,
                                  onChanged: (String? value) {
                                    landCubit.changeCharacter(value);
                                    landCubit.getDestMainServices(
                                      fromCountryID: serviceCubit
                                          .getCountryKey(landCubit.fromCountry),
                                      fromCityID: serviceCubit
                                          .getCityKey(landCubit.fromCity),
                                      toCountryID: serviceCubit
                                          .getCountryToKey(landCubit.toCountry),
                                      toCityID: serviceCubit
                                          .getCityToKey(landCubit.toCity),
                                      serviceID: 2,
                                      serviceSizeTypeID:
                                          landCubit.getRadioKey(value),
                                    );
                                  },
                                  context: context,
                                  character: landCubit.character,
                                  cubit: landCubit,
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 0,
                              ),
                              itemCount: landCubit.radioButtonList.length == 1
                                  ? landCubit.radioButtonList.length
                                  : (landCubit.radioButtonList.length) ~/ 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15.0,
                                right: 15.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  defaultField(
                                    label: AppLocalizations.of(context)!
                                        .descriptionOfGoods,
                                    widget: defaultTextFormField(
                                      controll: descriptionofgoods,
                                      type: TextInputType.number,
                                      validat: (String? value) {
                                        if (value!.isEmpty) {
                                          return AppLocalizations.of(context)!
                                              .descriptionOfGoodsError;
                                        }
                                        return null;
                                      },
                                      maxline: 4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.info,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          AppLocalizations.of(context)!.serviceData,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: defaultColorNavyBlue,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                ind1 += 2;
                                return checkBoxDestMainServices(
                                  context: context,
                                  index: ind1,
                                  Cubit: landCubit,
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 0,
                              ),
                              itemCount:
                                  landCubit.destMainServicesList.length == 1
                                      ? landCubit.destMainServicesList.length
                                      : landCubit.destMainServicesList.length ~/
                                          2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          AppLocalizations.of(context)!.shipmentData,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    containerShipmentData(
                      context: context,
                      functionRemove: () {
                        landCubit.decrementLimit();
                      },
                      functionAdd: () {
                        landCubit.incrementLimit();
                      },
                      list: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => cardShipmentData(
                          functionWUnit: (value) {
                            landCubit.changeWeightUnitName(value, index);
                          },
                          functionLUnit: (value) {
                            landCubit.changeDimensionsUnitName(value, index);
                          },
                          weight: index == 0
                              ? weight
                              : index == 1
                                  ? weight1
                                  : index == 2
                                      ? weight2
                                      : index == 3
                                          ? weight3
                                          : index == 4
                                              ? weight4
                                              : weight5,
                          height: index == 0
                              ? height
                              : index == 1
                                  ? height1
                                  : index == 2
                                      ? height2
                                      : index == 3
                                          ? height3
                                          : index == 4
                                              ? height4
                                              : height5,
                          length: index == 0
                              ? length
                              : index == 1
                                  ? length1
                                  : index == 2
                                      ? length2
                                      : index == 3
                                          ? length3
                                          : index == 4
                                              ? length4
                                              : length5,
                          width: index == 0
                              ? width
                              : index == 1
                                  ? width1
                                  : index == 2
                                      ? width2
                                      : index == 3
                                          ? width3
                                          : index == 4
                                              ? width4
                                              : width5,
                          unit1: serviceCubit.wUnitList,
                          unit2: serviceCubit.lUnitList,
                          hsCode: index == 0
                              ? hsCode
                              : index == 1
                                  ? hsCode1
                                  : index == 2
                                      ? hsCode2
                                      : index == 3
                                          ? hsCode3
                                          : index == 4
                                              ? hsCode4
                                              : hsCode5,
                          delcaredValue: index == 0
                              ? delcaredValue
                              : index == 1
                                  ? delcaredValue1
                                  : index == 2
                                      ? delcaredValue2
                                      : index == 3
                                          ? delcaredValue3
                                          : index == 4
                                              ? delcaredValue4
                                              : delcaredValue5,
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 5,
                        ),
                        itemCount: landCubit.limit,
                      ),
                      limit: landCubit.limit,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.add,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          AppLocalizations.of(context)!.additionalServices,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: defaultColorNavyBlue,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                    value: landCubit.needStorage,
                                    onChanged: (value) {
                                      landCubit.changeNeedStorage();
                                    }),
                                Text(AppLocalizations.of(context)!.needStorage),
                              ],
                            ),
                            if (landCubit.needStorage)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      ind2 += 2;
                                      return radioButtonStorage(
                                        index: ind2,
                                        onChanged: (String? value) {
                                          landCubit.changeCharacter(
                                            value,
                                            isStorage: true,
                                          );
                                          landCubit.getOriginMainServices(
                                            isStorage: true,
                                            fromCountryID:
                                                serviceCubit.getCountryKey(
                                              landCubit.fromCountry,
                                            ),
                                            fromCityID: serviceCubit.getCityKey(
                                              landCubit.fromCity,
                                            ),
                                            toCountryID:
                                                serviceCubit.getCountryKey(
                                              landCubit.fromCountry,
                                            ),
                                            toCityID: serviceCubit.getCityKey(
                                              landCubit.fromCity,
                                            ),
                                            serviceID: 4,
                                            serviceSizeTypeID:
                                                landCubit.getRadioKey(
                                              value,
                                              isStorage: true,
                                            ),
                                          );
                                        },
                                        context: context,
                                        character: landCubit.characterStorage,
                                        cubit: landCubit,
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      height: 0,
                                    ),
                                    itemCount: landCubit.radioButtonStorageList
                                                .length ==
                                            1
                                        ? landCubit
                                            .radioButtonStorageList.length
                                        : (landCubit.radioButtonStorageList
                                                .length) ~/
                                            2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: defaultTextFormField(
                                            controll: fromDate,
                                            type: TextInputType.datetime,
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
                                                return AppLocalizations.of(
                                                        context)!
                                                    .errorDate;
                                              }
                                              return null;
                                            },
                                            label: AppLocalizations.of(context)!
                                                .fromDate,
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
                                                return AppLocalizations.of(
                                                        context)!
                                                    .errorDate;
                                              }
                                              return null;
                                            },
                                            onSubmit: (String? value) {
                                              landCubit.getSize(
                                                fromCountryID:
                                                    serviceCubit.getCountryKey(
                                                        landCubit.fromCountry),
                                                serviceSizeTypeId:
                                                    landCubit.getRadioKey(
                                                        landCubit.character),
                                                storageFromDate: fromDate.text,
                                                storageToDate: toDate.text,
                                                fromCityID:
                                                    serviceCubit.getCityKey(
                                                        landCubit.fromCity),
                                              );
                                            },
                                            label: AppLocalizations.of(context)!
                                                .toDate,
                                            prefix: Icons.calendar_today,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                    ),
                                    child: defaultField(
                                      label: AppLocalizations.of(context)!.size,
                                      widget: defaultDropdownSearch(
                                        items: landCubit.sizeList,
                                        onChang: (value) {
                                          landCubit.changeSize(value);
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
                                          value: landCubit.anotherSize,
                                          onChanged: (value) {
                                            landCubit.changeAnotherSize();
                                          }),
                                      Text(
                                        AppLocalizations.of(context)!
                                            .anotherSize,
                                      ),
                                    ],
                                  ),
                                  if (landCubit.anotherSize)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .description),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          defaultTextFormField(
                                            controll: description,
                                            type: TextInputType.text,
                                            maxline: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      ind3 += 2;
                                      return checkBoxOriginMainServices(
                                        context: context,
                                        index: ind3,
                                        list: landCubit
                                            .originMainServicesStorageList,
                                        listCheckBox:
                                            landCubit.checkBoxOriginStorage,
                                        function1: (bool? value) {
                                          landCubit
                                              .changeCheckBoxOriginMainServices(
                                            index: ind3 - 2,
                                            value: value!,
                                          );
                                        },
                                        function2: (bool? value) {
                                          landCubit
                                              .changeCheckBoxOriginMainServices(
                                            index: ind3 - 1,
                                            value: value!,
                                          );
                                        },
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      height: 0,
                                    ),
                                    itemCount: landCubit
                                                .originMainServicesStorageList
                                                .length ==
                                            1
                                        ? landCubit
                                            .originMainServicesStorageList
                                            .length
                                        : (landCubit
                                                .originMainServicesStorageList
                                                .length) ~/
                                            2,
                                  ),
                                  if (landCubit.isPickUpStorage)
                                    pickUpService(
                                      pickupDate: pickupDateStorage,
                                      address: addressStorage,
                                      context: context,
                                      cubit: landCubit,
                                      zipCodePickup: zipCodePickupStorage,
                                      isStorage: true,
                                      useAddress: landCubit.useAddressStorage,
                                    ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultButton(
                      text: AppLocalizations.of(context)!.submitButton,
                      function: () {
                        if (formKey.currentState!.validate()) {
                          landCubit.submitLand(
                            userID: userModel.id,
                            userFName: userModel.fName,
                            userEmail: userModel.email,
                            userPhoneCountryCode: userModel.phoneCountryCode,
                            userPhone: userModel.mob,
                            userAddress: userModel.invoiceAddress,
                            userLang: lang == 'en' ? lang + '-us' : lang,
                            fromCountryId: serviceCubit
                                .getCountryKey(landCubit.fromCountry),
                            toCountryId: serviceCubit
                                .getCountryToKey(landCubit.toCountry),
                            fromCityId:
                                serviceCubit.getCityKey(landCubit.fromCity),
                            toCityId:
                                serviceCubit.getCityToKey(landCubit.toCity),
                            dimensionsUnitID: serviceCubit
                                .getLUnitKey(landCubit.dimensionsUnitName),
                            dimensionsUnitID1: serviceCubit
                                .getLUnitKey(landCubit.dimensionsUnitName1),
                            dimensionsUnitID2: serviceCubit
                                .getLUnitKey(landCubit.dimensionsUnitName2),
                            dimensionsUnitID3: serviceCubit
                                .getLUnitKey(landCubit.dimensionsUnitName3),
                            dimensionsUnitID4: serviceCubit
                                .getLUnitKey(landCubit.dimensionsUnitName4),
                            dimensionsUnitID5: serviceCubit
                                .getLUnitKey(landCubit.dimensionsUnitName5),
                            weightUnitID: serviceCubit
                                .getWUnitKey(landCubit.weightUnitName),
                            weightUnitID1: serviceCubit
                                .getWUnitKey(landCubit.weightUnitName1),
                            weightUnitID2: serviceCubit
                                .getWUnitKey(landCubit.weightUnitName2),
                            weightUnitID3: serviceCubit
                                .getWUnitKey(landCubit.weightUnitName3),
                            weightUnitID4: serviceCubit
                                .getWUnitKey(landCubit.weightUnitName4),
                            weightUnitID5: serviceCubit
                                .getWUnitKey(landCubit.weightUnitName5),
                            hsCode: hsCode.text,
                            hsCode1: hsCode1.text,
                            hsCode2: hsCode2.text,
                            hsCode3: hsCode3.text,
                            hsCode4: hsCode4.text,
                            hsCode5: hsCode5.text,
                            weight: int.parse(weight.text),
                            weight1: weight1.text,
                            weight2: weight2.text,
                            weight3: weight3.text,
                            weight4: weight4.text,
                            weight5: weight5.text,
                            height: int.parse(height.text),
                            height1: int.parse(height1.text),
                            height2: int.parse(height2.text),
                            height3: int.parse(height3.text),
                            height4: int.parse(height4.text),
                            height5: int.parse(height5.text),
                            width: int.parse(width.text),
                            width1: int.parse(width1.text),
                            width2: int.parse(width2.text),
                            width3: int.parse(width3.text),
                            width4: int.parse(width4.text),
                            width5: int.parse(width5.text),
                            length: int.parse(length.text),
                            length1: int.parse(length1.text),
                            length2: int.parse(length2.text),
                            length3: int.parse(length3.text),
                            length4: int.parse(length4.text),
                            length5: int.parse(length5.text),
                            declaredValue: delcaredValue.text,
                            declaredValue1: delcaredValue1.text,
                            declaredValue2: delcaredValue2.text,
                            declaredValue3: delcaredValue3.text,
                            declaredValue4: delcaredValue4.text,
                            declaredValue5: delcaredValue5.text,
                            serviceDate: serviceDate.text,
                            serviceSizeTypeId:
                                landCubit.getRadioKey(landCubit.character),
                            serviceTypeId: 2,
                            goodsDesc: descriptionofgoods.text,
                            fromDate: fromDate.text,
                            toDate: toDate.text,
                            sizeID: landCubit.getSizeKey(landCubit.size),
                            storagePickupDate: pickupDateStorage.text,
                            storagePickupCityID: serviceCubit
                                .getCityKey(landCubit.pickupCityStorage),
                            addressStorage: addressStorage.text,
                            storageOtherSize: description.text,
                          );
                        }
                      },
                      color: defaultColorNavyBlue,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is LandSubmitSuccessState) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: AppLocalizations.of(context)!.success,
              message: landCubit.successMessages,
              contentType: ContentType.success,
              // to configure for material banner
              inMaterialBanner: true,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        } else if (state is LandSubmitErrorState) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: AppLocalizations.of(context)!.error,
              message: landCubit.errorMessages,
              contentType: ContentType.failure,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      },
    );
  }
}

// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:masmix/controller/cubits/app_cubit.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/cubits/sea_cubit.dart';
import 'package:masmix/controller/cubits/service_cubit.dart';
import 'package:masmix/controller/share/components/card_shipment_data.dart';
import 'package:masmix/controller/share/components/check_box.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/delivery_service.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/components/pickup_service.dart';
import 'package:masmix/controller/share/components/radio_button_service.dart';
import 'package:masmix/controller/share/components/radio_button_storage.dart';
import 'package:masmix/controller/share/components/text_form_field.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/controller/states/sea_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SeaServiceScreen extends StatelessWidget {
  TextEditingController serviceDate = TextEditingController();
  TextEditingController deliveryDate = TextEditingController();
  TextEditingController pickupDate = TextEditingController();
  TextEditingController pickupDateStorage = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController addressStorage = TextEditingController();
  TextEditingController deliveryAddress = TextEditingController();
  TextEditingController numberofpieces = TextEditingController();
  TextEditingController descriptionofgoods = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
  TextEditingController zipCodeO = TextEditingController();
  TextEditingController zipCodeD = TextEditingController();
  TextEditingController zipCodeDelivery = TextEditingController();
  TextEditingController zipCodePickup = TextEditingController();
  TextEditingController zipCodePickupStorage = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController weight1 = TextEditingController();
  TextEditingController weight2 = TextEditingController();
  TextEditingController weight3 = TextEditingController();
  TextEditingController weight4 = TextEditingController();
  TextEditingController weight5 = TextEditingController();
  TextEditingController weight6 = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController height1 = TextEditingController();
  TextEditingController height2 = TextEditingController();
  TextEditingController height3 = TextEditingController();
  TextEditingController height4 = TextEditingController();
  TextEditingController height5 = TextEditingController();
  TextEditingController height6 = TextEditingController();
  TextEditingController length = TextEditingController();
  TextEditingController length1 = TextEditingController();
  TextEditingController length2 = TextEditingController();
  TextEditingController length3 = TextEditingController();
  TextEditingController length4 = TextEditingController();
  TextEditingController length5 = TextEditingController();
  TextEditingController length6 = TextEditingController();
  TextEditingController width = TextEditingController();
  TextEditingController width1 = TextEditingController();
  TextEditingController width2 = TextEditingController();
  TextEditingController width3 = TextEditingController();
  TextEditingController width4 = TextEditingController();
  TextEditingController width5 = TextEditingController();
  TextEditingController width6 = TextEditingController();
  TextEditingController hsCode = TextEditingController();
  TextEditingController hsCode1 = TextEditingController();
  TextEditingController hsCode2 = TextEditingController();
  TextEditingController hsCode3 = TextEditingController();
  TextEditingController hsCode4 = TextEditingController();
  TextEditingController hsCode5 = TextEditingController();
  TextEditingController hsCode6 = TextEditingController();
  TextEditingController delcaredValue = TextEditingController();
  TextEditingController delcaredValue1 = TextEditingController();
  TextEditingController delcaredValue2 = TextEditingController();
  TextEditingController delcaredValue3 = TextEditingController();
  TextEditingController delcaredValue4 = TextEditingController();
  TextEditingController delcaredValue5 = TextEditingController();
  TextEditingController delcaredValue6 = TextEditingController();
  var formKey = GlobalKey<FormState>();

  SeaServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var serviceCubit = ServiceCubit.get(context)
      ..getCountryAndCity(serviceID: 3);
    var seaCubit = SeaCubit.get(context);
    var lang = AppCubit.get(context).appLanguage;
    var userModel = LoginCubit.get(context).loginModel;
    return BlocConsumer<SeaCubit, SeaStates>(
      builder: (context, state) {
        int ind = 0;
        int ind1 = 0;
        int ind2 = 0;
        int ind3 = 0;
        int ind4 = 0;
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.titleSeaScreen),
            centerTitle: true,
          ),
          endDrawer: defaultDrawer(context: context),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
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
                                      seaCubit.changeFromCountry(value);
                                      serviceCubit.getFromPort(
                                        fromCountryID:
                                            serviceCubit.getCountryKey(value),
                                        portType: 1,
                                      );
                                      serviceCubit.getCountryTo(
                                        fromCountryID:
                                            serviceCubit.getCountryKey(value),
                                        serviceID: 3,
                                      );
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
                                  label:
                                      AppLocalizations.of(context)!.originCity,
                                  widget: defaultDropdownSearch(
                                    items: serviceCubit.city,
                                    isSearch: true,
                                    onChang: (value) {
                                      seaCubit.changeFromCity(value);
                                      seaCubit.getRadioButton(
                                        fromCountryID:
                                            serviceCubit.getCountryKey(
                                                seaCubit.fromCountry),
                                        fromCityID:
                                            serviceCubit.getCityKey(value),
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
                                  label: AppLocalizations.of(context)!.zipCode,
                                  widget: defaultTextFormField(
                                    controll: zipCodeO,
                                    type: TextInputType.number,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: defaultField(
                                  label: AppLocalizations.of(context)!.originPort,
                                  widget: defaultDropdownSearch(
                                    items: serviceCubit.fromPortList,
                                    isSearch: true,
                                    onChang: (value) {
                                      seaCubit.changeFromSeaPort(value);
                                    },
                                    selected: 'Select Port',
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
                                      seaCubit.changeToCountry(value);
                                      serviceCubit.getToPort(
                                        toCountryID:
                                            serviceCubit.getCountryToKey(value),
                                        portType: 1,
                                      );
                                      serviceCubit.getCityTo(
                                        fromCountryID:
                                            serviceCubit.getCountryKey(
                                                seaCubit.fromCountry),
                                        fromCityID: serviceCubit
                                            .getCityKey(seaCubit.fromCity),
                                        toCountryID:
                                            serviceCubit.getCountryToKey(value),
                                      );
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
                                        seaCubit.changeToCity(value);
                                        seaCubit.getRadioButton(
                                          fromCountryID:
                                              serviceCubit.getCountryKey(
                                                  seaCubit.fromCountry),
                                          toCityID:
                                              serviceCubit.getCityToKey(value),
                                          toCountryID:
                                              serviceCubit.getCountryToKey(
                                                  seaCubit.toCountry),
                                          fromCityID: serviceCubit
                                              .getCityKey(seaCubit.fromCity),
                                          serviceID: 3,
                                        );
                                      },
                                      selected: 'Select City'),
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
                                  label: AppLocalizations.of(context)!.zipCode,
                                  widget: defaultTextFormField(
                                    controll: zipCodeD,
                                    type: TextInputType.number,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: defaultField(
                                  label: AppLocalizations.of(context)!.destinationPort,
                                  widget: defaultDropdownSearch(
                                      items: serviceCubit.toPortList,
                                      isSearch: true,
                                      onChang: (value) {
                                        seaCubit.changeToSeaPort(value);
                                      },
                                      selected: 'Select Port'),
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
                      const Icon(
                        Icons.directions_boat,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        AppLocalizations.of(context)!.shipmentType,
                        style: const TextStyle(
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
                        left: 10.0,
                        right: 10.0,
                        top: 20.0,
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
                                  seaCubit.changeCharacter(value);
                                  seaCubit.getOriginMainServices(
                                    fromCountryID: serviceCubit
                                        .getCountryKey(seaCubit.fromCountry),
                                    fromCityID: serviceCubit
                                        .getCityKey(seaCubit.fromCity),
                                    toCountryID: serviceCubit
                                        .getCountryToKey(seaCubit.toCountry),
                                    toCityID: serviceCubit
                                        .getCityToKey(seaCubit.toCity),
                                    serviceID: 3,
                                    serviceSizeTypeID:
                                        seaCubit.getRadioKey(value),
                                  );
                                  seaCubit.getDestMainServices(
                                    fromCountryID: serviceCubit
                                        .getCountryKey(seaCubit.fromCountry),
                                    fromCityID: serviceCubit
                                        .getCityKey(seaCubit.fromCity),
                                    toCountryID: serviceCubit
                                        .getCountryToKey(seaCubit.toCountry),
                                    toCityID: serviceCubit
                                        .getCityToKey(seaCubit.toCity),
                                    serviceID: 3,
                                    serviceSizeTypeID:
                                        seaCubit.getRadioKey(value),
                                  );
                                },
                                context: context,
                                character: seaCubit.character,
                                cubit: seaCubit,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 0,
                            ),
                            itemCount: seaCubit.radioButtonList.length == 1
                                ? seaCubit.radioButtonList.length
                                : (seaCubit.radioButtonList.length) ~/ 2,
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
                      const Icon(
                        Icons.info,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        AppLocalizations.of(context)!.serviceData,
                        style: const TextStyle(
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
                        left: 10.0,
                        right: 10.0,
                        top: 20.0,
                        bottom: 20.0,
                      ),
                      child: Column(
                        children: [
                          if (seaCubit.originMainServicesList.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10.0,
                                right: 10.0,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!.origin,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  myDivider(),
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
                                listCheckBox: seaCubit.checkBoxOrigin,
                                list: seaCubit.originMainServicesList,
                                function1: (bool? value) {
                                  seaCubit.changeCheckBoxOriginMainServices(
                                    index: ind1 - 2,
                                    value: value!,
                                  );
                                },
                                function2: (bool? value) {
                                  seaCubit.changeCheckBoxOriginMainServices(
                                    index: ind1 - 1,
                                    value: value!,
                                  );
                                },
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 0,
                            ),
                            itemCount: seaCubit.originMainServicesList.length ==
                                    1
                                ? seaCubit.originMainServicesList.length
                                : (seaCubit.originMainServicesList.length) ~/ 2,
                          ),
                          if (seaCubit.isPickUp)
                            pickUpService(
                              pickupDate: pickupDate,
                              address: address,
                              context: context,
                              cubit: seaCubit,
                              zipCodePickup: zipCodePickup,
                              useAddress: seaCubit.useAddress,
                            ),
                          if (seaCubit.originMainServicesList.isNotEmpty)
                            const SizedBox(
                              height: 10.0,
                            ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.destination,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                myDivider(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                              top: 10,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check_box,
                                  color: defaultColorGrey,
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Sea Port',
                                  style: TextStyle(
                                    color: defaultColorGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              ind2 += 2;
                              return checkBoxDestMainServices(
                                context: context,
                                index: ind2,
                                Cubit: seaCubit,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 0,
                            ),
                            itemCount: seaCubit.destMainServicesList.length == 1
                                ? seaCubit.destMainServicesList.length
                                : seaCubit.destMainServicesList.length ~/ 2,
                          ),
                          if (seaCubit.isDelivery)
                            deliveryService(
                              deliveryDate: deliveryDate,
                              deliveryAddress: deliveryAddress,
                              context: context,
                              cubit: seaCubit,
                              zipCodeDelivery: zipCodeDelivery,
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
                      const Icon(
                        Icons.date_range,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        AppLocalizations.of(context)!.shipmentData,
                        style: const TextStyle(
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
                    limit: seaCubit.limit,
                    functionRemove: () {
                      seaCubit.decrementLimit();
                    },
                    functionAdd: () {
                      seaCubit.incrementLimit();
                    },
                    list: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => cardShipmentData(
                        functionWUnit: (value) {
                          seaCubit.changeWeightUnitName(value, index);
                        },
                        functionLUnit: (value) {
                          seaCubit.changeDimensionsUnitName(value, index);
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
                      itemCount: seaCubit.limit,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.add,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        AppLocalizations.of(context)!.additionalServices,
                        style: const TextStyle(
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
                                  value: seaCubit.needStorage,
                                  onChanged: (value) {
                                    seaCubit.changeNeedStorage();
                                  }),
                              Text(AppLocalizations.of(context)!.needStorage),
                            ],
                          ),
                          if (seaCubit.needStorage)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    ind3 += 2;
                                    return radioButtonStorage(
                                      index: ind3,
                                      onChanged: (String? value) {
                                        seaCubit.changeCharacter(
                                          value,
                                          isStorage: true,
                                        );
                                        seaCubit.getOriginMainServices(
                                          isStorage: true,
                                          fromCountryID:
                                              serviceCubit.getCountryKey(
                                            seaCubit.fromCountry,
                                          ),
                                          fromCityID: serviceCubit.getCityKey(
                                            seaCubit.fromCity,
                                          ),
                                          toCountryID:
                                              serviceCubit.getCountryKey(
                                            seaCubit.fromCountry,
                                          ),
                                          toCityID: serviceCubit.getCityKey(
                                            seaCubit.fromCity,
                                          ),
                                          serviceID: 4,
                                          serviceSizeTypeID:
                                              seaCubit.getRadioKey(
                                            value,
                                            isStorage: true,
                                          ),
                                        );
                                      },
                                      context: context,
                                      character: seaCubit.characterStorage,
                                      cubit: seaCubit,
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 0,
                                  ),
                                  itemCount: seaCubit
                                              .radioButtonStorageList.length ==
                                          1
                                      ? seaCubit.radioButtonStorageList.length
                                      : (seaCubit
                                              .radioButtonStorageList.length) ~/
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
                                              return AppLocalizations.of(
                                                      context)!
                                                  .errorDate;
                                            }
                                            return null;
                                          },
                                          onSubmit: (String? value) {
                                            seaCubit.getSize(
                                              fromCountryID:
                                                  serviceCubit.getCountryKey(
                                                      seaCubit.fromCountry),
                                              serviceSizeTypeId:
                                                  seaCubit.getRadioKey(
                                                      seaCubit.character),
                                              storageFromDate: fromDate.text,
                                              storageToDate: toDate.text,
                                              fromCityID:
                                                  serviceCubit.getCityKey(
                                                      seaCubit.fromCity),
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
                                      items: seaCubit.sizeList,
                                      onChang: (value) {
                                        seaCubit.changeSize(value);
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
                                        value: seaCubit.anotherSize,
                                        onChanged: (value) {
                                          seaCubit.changeAnotherSize();
                                        }),
                                    Text(
                                      AppLocalizations.of(context)!.anotherSize,
                                    ),
                                  ],
                                ),
                                if (seaCubit.anotherSize)
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
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    ind4 += 2;
                                    return checkBoxOriginMainServices(
                                      context: context,
                                      index: ind4,
                                      list: seaCubit
                                          .originMainServicesStorageList,
                                      listCheckBox:
                                          seaCubit.checkBoxOriginStorage,
                                      function1: (bool? value) {
                                        seaCubit
                                            .changeCheckBoxOriginMainServices(
                                          index: ind4 - 2,
                                          value: value!,
                                          isStorage: true,
                                        );
                                      },
                                      function2: (bool? value) {
                                        seaCubit
                                            .changeCheckBoxOriginMainServices(
                                          index: ind4 - 1,
                                          value: value!,
                                          isStorage: true,
                                        );
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 0,
                                  ),
                                  itemCount: seaCubit
                                              .originMainServicesStorageList
                                              .length ==
                                          1
                                      ? seaCubit
                                          .originMainServicesStorageList.length
                                      : (seaCubit.originMainServicesStorageList
                                              .length) ~/
                                          2,
                                ),
                                if (seaCubit.isPickUpStorage)
                                  pickUpService(
                                    pickupDate: pickupDateStorage,
                                    address: addressStorage,
                                    context: context,
                                    cubit: seaCubit,
                                    zipCodePickup: zipCodePickupStorage,
                                    isStorage: true,
                                    useAddress: seaCubit.useAddressStorage,
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
                      seaCubit.submitSea(
                        userID: userModel.id,
                        userFName: userModel.fName,
                        userEmail: userModel.email,
                        userPhoneCountryCode: userModel.phoneCountryCode,
                        userPhone: userModel.mob,
                        userAddress: userModel.invoiceAddress,
                        userLang: lang == 'en' ? lang + '-us' : lang,
                        fromCountyId:
                            serviceCubit.getCountryKey(seaCubit.fromCountry),
                        toCountyId:
                            serviceCubit.getCountryToKey(seaCubit.toCountry),
                        fromCityId: serviceCubit.getCityKey(seaCubit.fromCity),
                        toCityId: serviceCubit.getCityToKey(seaCubit.toCity),
                        fromZip: zipCodeD.text,
                        toZip: zipCodeD.text,
                        portToID: serviceCubit.getToPortKey(seaCubit.toSeaPort),
                        portFromID:
                            serviceCubit.getFromPortKey(seaCubit.fromSeaPort),
                        dimensionsUnitID: serviceCubit
                            .getLUnitKey(seaCubit.dimensionsUnitName),
                        dimensionsUnitID1: serviceCubit
                            .getLUnitKey(seaCubit.dimensionsUnitName1),
                        dimensionsUnitID2: serviceCubit
                            .getLUnitKey(seaCubit.dimensionsUnitName2),
                        dimensionsUnitID3: serviceCubit
                            .getLUnitKey(seaCubit.dimensionsUnitName3),
                        dimensionsUnitID4: serviceCubit
                            .getLUnitKey(seaCubit.dimensionsUnitName4),
                        dimensionsUnitID5: serviceCubit
                            .getLUnitKey(seaCubit.dimensionsUnitName5),
                        weightUnitID:
                            serviceCubit.getWUnitKey(seaCubit.weightUnitName),
                        weightUnitID1:
                            serviceCubit.getWUnitKey(seaCubit.weightUnitName1),
                        weightUnitID2:
                            serviceCubit.getWUnitKey(seaCubit.weightUnitName2),
                        weightUnitID3:
                            serviceCubit.getWUnitKey(seaCubit.weightUnitName3),
                        weightUnitID4:
                            serviceCubit.getWUnitKey(seaCubit.weightUnitName4),
                        weightUnitID5:
                            serviceCubit.getWUnitKey(seaCubit.weightUnitName5),
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
                        numberOfPieces: numberofpieces.text,
                        goodsDesc: descriptionofgoods.text,
                        pickupDate: pickupDate.text,
                        pickupAddress: address.text,
                        pickupZip: zipCodePickup.text,
                        radioShippmentTypeId:
                            seaCubit.getRadioKey(seaCubit.character),
                        fromDate: fromDate.text,
                        toDate: toDate.text,
                        sizeID: seaCubit.getSizeKey(seaCubit.size),
                        storagePickupDate: pickupDateStorage.text,
                        storagePickupCityID:
                            serviceCubit.getCityKey(seaCubit.pickupCityStorage),
                        addressStorage: addressStorage.text,
                        storageOtherSize: description.text,
                        pickupCityID:
                            serviceCubit.getCityKey(seaCubit.pickupCity),
                      );
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
        );
      },
      listener: (context, state) {
        if (state is SubmitSuccessState) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Oh Hey!!',
              message: seaCubit.successMessages,
              contentType: ContentType.success,
              // to configure for material banner
              inMaterialBanner: true,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
        if (state is SubmitErrorState) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'ُError!',
              message: seaCubit.errorMessages,
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

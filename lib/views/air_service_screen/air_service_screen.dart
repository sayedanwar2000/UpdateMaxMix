// ignore_for_file: must_be_immutable
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:masmix/controller/cubits/air_cubit.dart';
import 'package:masmix/controller/cubits/app_cubit.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
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
import 'package:masmix/controller/states/air_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//This Class To Display Air Service

class AirServiceScreen extends StatelessWidget {
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

  AirServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var serviceCubit = ServiceCubit.get(context)
      ..getCountryAndCity(serviceID: 1);
    var airCubit = AirCubit.get(context);
    var loginCubit = LoginCubit.get(context);
    var appCubit = AppCubit.get(context);

    return BlocConsumer<AirCubit, AirStates>(
      builder: (context, state) {
        int ind = 0;
        int ind1 = 0;
        int ind2 = 0;
        int ind3 = 0;
        int ind4 = 0;
        return Scaffold(

          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.titleAirScreen),
            centerTitle: true,
          ),

          //Menu
          endDrawer: defaultDrawer(context: context),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Geo Data
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

                    //This Container To Display Geo Data
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
                                    return AppLocalizations.of(context)!.errorDate;
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
                                    label: AppLocalizations.of(context)!.originCountry,
                                    widget: defaultDropdownSearch(
                                      items: serviceCubit.countryList,
                                      isSearch: true,
                                      onChang: (value) {
                                        serviceCubit.changeCity(value);
                                        serviceCubit.getCountryTo(
                                          fromCountryID:
                                              serviceCubit.getCountryKey(
                                            value,
                                          ),
                                          serviceID: 1,
                                        );
                                        airCubit.changeFromCountry(value);
                                        serviceCubit.getFromPort(
                                          fromCountryID: serviceCubit
                                              .getCountryKey(value),
                                          portType: 2,
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
                                    label: AppLocalizations.of(context)!.originCity,
                                    widget: defaultDropdownSearch(
                                      items: serviceCubit.city,
                                      isSearch: true,
                                      onChang: (value) {
                                        airCubit.changeFromCity(value);
                                        airCubit.getRadioButton(
                                          isStorage: true,
                                          fromCountryID:
                                              serviceCubit.getCountryKey(
                                            airCubit.fromCountry,
                                          ),
                                          fromCityID: serviceCubit.getCityKey(
                                            airCubit.fromCity,
                                          ),
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
                                    label: AppLocalizations.of(context)!.originAirPort,
                                    widget: defaultDropdownSearch(
                                      items: serviceCubit.fromPortList,
                                      isSearch: true,
                                      onChang: (String? value) {
                                        airCubit.changeFromAirPort(value);
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
                                    label: AppLocalizations.of(context)!.destinationCountry,
                                    widget: defaultDropdownSearch(
                                      items: serviceCubit.countryToList,
                                      isSearch: true,
                                      onChang: (value) {
                                        airCubit.changeToCountry(value);
                                        serviceCubit.getToPort(
                                          toCountryID: serviceCubit
                                              .getCountryToKey(value),
                                          portType: 2,
                                        );
                                        serviceCubit.getCityTo(
                                          fromCountryID:
                                              serviceCubit.getCountryKey(
                                                  airCubit.fromCountry),
                                          fromCityID: serviceCubit
                                              .getCityKey(airCubit.fromCity),
                                          toCountryID: serviceCubit
                                              .getCountryToKey(value),
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
                                    label: AppLocalizations.of(context)!.destinationCity,
                                    widget: defaultDropdownSearch(
                                      items: serviceCubit.cityToList,
                                      isSearch: true,
                                      onChang: (value) {
                                        airCubit.getRadioButton(
                                          fromCountryID:
                                              serviceCubit.getCountryKey(
                                                  airCubit.fromCountry),
                                          toCityID: serviceCubit
                                              .getCityToKey(airCubit.toCity),
                                          toCountryID:
                                              serviceCubit.getCountryToKey(
                                                  airCubit.toCountry),
                                          fromCityID: serviceCubit
                                              .getCityKey(airCubit.fromCity),
                                          serviceID: 1,
                                        );
                                        airCubit.changeToCity(value);
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
                                    label: AppLocalizations.of(context)!.destinationAirPort,
                                    widget: defaultDropdownSearch(
                                      items: serviceCubit.toPortList,
                                      isSearch: true,
                                      onChang: (value) {
                                        airCubit.changeToAirPort(value);
                                      },
                                      selected: 'Select Port',
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

                    //Shipment Type
                    Row(
                      children: [
                        const Icon(
                          Icons.flight,
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

                    //This Container To Display  Shipment Type
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
                                    airCubit.changeCharacter(value);
                                    airCubit.getOriginMainServices(
                                      fromCountryID: serviceCubit
                                          .getCountryKey(airCubit.fromCountry),
                                      fromCityID: serviceCubit
                                          .getCityKey(airCubit.fromCity),
                                      toCountryID: serviceCubit
                                          .getCountryToKey(airCubit.toCountry),
                                      toCityID: serviceCubit
                                          .getCityToKey(airCubit.toCity),
                                      serviceID: 1,
                                      serviceSizeTypeID:
                                          airCubit.getRadioKey(value),
                                    );
                                    airCubit.getDestMainServices(
                                      fromCountryID: serviceCubit
                                          .getCountryKey(airCubit.fromCountry),
                                      fromCityID: serviceCubit
                                          .getCityKey(airCubit.fromCity),
                                      toCountryID: serviceCubit
                                          .getCountryToKey(airCubit.toCountry),
                                      toCityID: serviceCubit
                                          .getCityToKey(airCubit.toCity),
                                      serviceID: 1,
                                      serviceSizeTypeID:
                                          airCubit.getRadioKey(value),
                                    );
                                  },
                                  context: context,
                                  character: airCubit.character,
                                  cubit: airCubit,
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 0,
                              ),
                              itemCount: airCubit.radioButtonList.length == 1
                                  ? airCubit.radioButtonList.length
                                  : (airCubit.radioButtonList.length) ~/ 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10.0,
                                right: 10.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  defaultField(
                                    label: AppLocalizations.of(context)!.numberOfPieces,
                                    widget: defaultTextFormField(
                                      controll: numberofpieces,
                                      type: TextInputType.number,
                                      validat: (value) {
                                        if (value!.isEmpty) {
                                          return AppLocalizations.of(context)!.numberOfPiecesError;
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  defaultField(
                                    label: AppLocalizations.of(context)!.descriptionOfGoods,
                                    widget: defaultTextFormField(
                                      controll: descriptionofgoods,
                                      type: TextInputType.number,
                                      maxline: 4,
                                      validat: (value) {
                                        if (value!.isEmpty) {
                                          return AppLocalizations.of(context)!.descriptionOfGoodsError;
                                        }
                                        return null;
                                      },
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

                    //Service Data
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

                    //This Container To Display Service Data
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
                            if (airCubit.originMainServicesList.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                child: Column(
                                  children: [
                                    //Display Origin
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
                            //Display Check Boxes Origin Main Services Air
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                ind1 += 2;
                                return checkBoxOriginMainServices(
                                  context: context,
                                  index: ind1,
                                  list: airCubit.originMainServicesList,
                                  listCheckBox: airCubit.checkBoxOrigin,
                                  function1: (bool? value) {
                                    airCubit.changeCheckBoxOriginMainServices(
                                      index: ind1 - 2,
                                      value: value!,
                                    );
                                  },
                                  function2: (bool? value) {
                                    airCubit.changeCheckBoxOriginMainServices(
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
                              itemCount:
                                  airCubit.originMainServicesList.length == 1
                                      ? airCubit.originMainServicesList.length
                                      : (airCubit
                                              .originMainServicesList.length) ~/
                                          2,
                            ),
                            if (airCubit.isPickUp)
                            //Display Pick Up Service Air
                              pickUpService(
                                pickupDate: pickupDate,
                                address: address,
                                context: context,
                                cubit: airCubit,
                                zipCodePickup: zipCodePickup,
                                useAddress: airCubit.useAddress,
                              ),
                            if (airCubit.originMainServicesList.isNotEmpty)
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
                                  //Display Destination
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
                                    'Air Port',
                                    style: TextStyle(
                                      color: defaultColorGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Display Check Boxes Dest Main Services Air
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                ind2 += 2;
                                return checkBoxDestMainServices(
                                  context: context,
                                  index: ind2,
                                  Cubit: airCubit,
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 0,
                              ),
                              itemCount: airCubit.destMainServicesList.length ==
                                      1
                                  ? 0
                                  : airCubit.destMainServicesList.length ~/ 2,
                            ),
                            if (airCubit.isDelivery)
                              //Display Delivery Service Air
                              deliveryService(
                                deliveryDate: deliveryDate,
                                deliveryAddress: deliveryAddress,
                                context: context,
                                cubit: airCubit,
                                zipCodeDelivery: zipCodeDelivery,
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    //Shipment Data
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

                    //This Container To Display Shipment Data
                    containerShipmentData(
                      limit: airCubit.limit,
                      functionRemove: () {
                        airCubit.decrementLimit();
                      },
                      functionAdd: () {
                        airCubit.incrementLimit();
                      },
                      list: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => cardShipmentData(
                          functionWUnit: (value) {
                            airCubit.changeWeightUnitName(value, index);
                          },
                          functionLUnit: (value) {
                            airCubit.changeDimensionsUnitName(value, index);
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
                          height: 10,
                        ),
                        itemCount: airCubit.limit,
                      ),
                      context: context,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    //Additional Services
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

                    //This Container To Display Additional Services
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
                                //Display Check Box Need Storage
                                Checkbox(
                                    value: airCubit.needStorage,
                                    onChanged: (value) {
                                      airCubit.changeNeedStorage();
                                    }),
                                Text(AppLocalizations.of(context)!.needStorage),
                              ],
                            ),
                            if (airCubit.needStorage)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Display Radio Button Storage
                                  ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      ind3 += 2;
                                      return radioButtonStorage(
                                        index: ind3,
                                        onChanged: (String? value) {
                                          airCubit.changeCharacter(
                                            value,
                                            isStorage: true,
                                          );
                                          airCubit.getOriginMainServices(
                                            isStorage: true,
                                            fromCountryID:
                                                serviceCubit.getCountryKey(
                                              airCubit.fromCountry,
                                            ),
                                            fromCityID:
                                                serviceCubit.getCityKey(
                                              airCubit.fromCity,
                                            ),
                                            toCountryID:
                                                serviceCubit.getCountryKey(
                                              airCubit.fromCountry,
                                            ),
                                            toCityID: serviceCubit.getCityKey(
                                              airCubit.fromCity,
                                            ),
                                            serviceID: 4,
                                            serviceSizeTypeID:
                                                airCubit.getRadioKey(
                                              value,
                                              isStorage: true,
                                            ),
                                          );
                                        },
                                        context: context,
                                        character: airCubit.characterStorage,
                                        cubit: airCubit,
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      height: 0,
                                    ),
                                    itemCount: airCubit.radioButtonStorageList
                                                .length ==
                                            1
                                        ? airCubit.radioButtonStorageList.length
                                        : (airCubit.radioButtonStorageList
                                                .length) ~/
                                            2,
                                  ),
                                  //Display Date Storage
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
                                                return AppLocalizations.of(context)!.errorDate;
                                              }
                                              return null;
                                            },
                                            label: AppLocalizations.of(context)!.fromDate,
                                            prefix: Icons.calendar_today,
                                            readOnly: true,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Expanded(
                                          child: defaultTextFormField(
                                            controll: toDate,
                                            readOnly: true,
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
                                                return AppLocalizations.of(context)!.errorDate;
                                              }
                                              return null;
                                            },
                                            label: AppLocalizations.of(context)!.toDate,
                                            prefix: Icons.calendar_today,
                                            onSubmit: (String? value) {
                                              airCubit.getSize(
                                                fromCountryID:
                                                    serviceCubit.getCountryKey(
                                                        airCubit.fromCountry),
                                                serviceSizeTypeId:
                                                    airCubit.getRadioKey(
                                                  airCubit.characterStorage,
                                                  isStorage: true,
                                                ),
                                                storageFromDate: fromDate.text,
                                                storageToDate: toDate.text,
                                                fromCityID:
                                                    serviceCubit.getCityKey(
                                                        airCubit.fromCity),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  //Display DropDown Size
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                    ),
                                    child: defaultField(
                                      label: AppLocalizations.of(context)!.size,
                                      widget: defaultDropdownSearch(
                                        items: airCubit.sizeList,
                                        onChang: (value) {
                                          airCubit.changeSize(value);
                                        },
                                        isSearch: true,
                                        selected: 'Select Size',
                                      ),
                                    ),
                                  ),
                                  //Display Check Box If Need Another Size
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                          value: airCubit.anotherSize,
                                          onChanged: (value) {
                                            airCubit.changeAnotherSize();
                                          }),
                                      Text(
                                        AppLocalizations.of(context)!.anotherSize,
                                      ),
                                    ],
                                  ),
                                  if (airCubit.anotherSize)
                                    //Display Text Form Filed Another Size
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        bottom: 10.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context)!.description),
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
                                  //Display Check Boxes Origin Main Services Storage
                                  ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      ind4 += 2;
                                      return checkBoxOriginMainServices(
                                        context: context,
                                        index: ind4,
                                        list: airCubit
                                            .originMainServicesStorageList,
                                        listCheckBox:
                                            airCubit.checkBoxOriginStorage,
                                        function1: (bool? value) {
                                          airCubit
                                              .changeCheckBoxOriginMainServices(
                                            index: ind4 - 2,
                                            value: value!,
                                            isStorage: true,
                                          );
                                        },
                                        function2: (bool? value) {
                                          airCubit
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
                                    itemCount: airCubit
                                                .originMainServicesStorageList
                                                .length ==
                                            1
                                        ? airCubit.originMainServicesStorageList
                                            .length
                                        : (airCubit
                                                .originMainServicesStorageList
                                                .length) ~/
                                            2,
                                  ),
                                  if (airCubit.isPickUpStorage)
                                    //Display Pick Up Service Storage
                                    pickUpService(
                                      pickupDate: pickupDateStorage,
                                      address: addressStorage,
                                      context: context,
                                      cubit: airCubit,
                                      zipCodePickup: zipCodePickupStorage,
                                      isStorage: true,
                                      useAddress: airCubit.useAddressStorage,
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

                    //This Button To Submit Service
                    defaultButton(
                      text: AppLocalizations.of(context)!.submitButton,
                      function: () {
                        //Check for Validate
                        if (formKey.currentState!.validate()) {
                          //Check Date To Greater Than Date From
                          if ((int.parse(fromDate.text.split('-')[0]) >=
                                      int.parse(toDate.text.split('-')[0]) ||
                                  int.parse(fromDate.text.split('-')[1]) >=
                                      int.parse(toDate.text.split('-')[1])) &&
                              toDate.text.isNotEmpty &&
                              fromDate.text.isNotEmpty) {
                            //Display SnackBar Error If Date To Less Than Date From
                            final snackBar = SnackBar(
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                title: 'ُError!',
                                message:
                                    'IN Storage To Date Must be grater than From Date',
                                contentType: ContentType.failure,
                              ),
                            );
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          } else {
                            //This Function To Pass Data To API Air Service
                            airCubit.submitAir(
                              userID: loginCubit.loginModel.id,
                              userFName: loginCubit.loginModel.fName,
                              userEmail: loginCubit.loginModel.email,
                              userPhoneCountryCode:
                                  loginCubit.loginModel.phoneCountryCode,
                              userPhone: loginCubit.loginModel.mob,
                              userAddress: loginCubit.loginModel.invoiceAddress,
                              userLang: appCubit.appLanguage == 'en'
                                  ? appCubit.appLanguage + '-us'
                                  : appCubit.appLanguage,
                              fromCountyId: serviceCubit
                                  .getCountryKey(airCubit.fromCountry),
                              toCountyId: serviceCubit
                                  .getCountryToKey(airCubit.toCountry),
                              storageCountyId: serviceCubit
                                  .getCountryKey(airCubit.fromCountry),
                              fromCityId:
                                  serviceCubit.getCityKey(airCubit.fromCity),
                              toCityId:
                                  serviceCubit.getCityToKey(airCubit.toCity),
                              fromZip: zipCodeO.text,
                              toZip: zipCodeD.text,
                              portType: 2,
                              portToID: serviceCubit
                                  .getToPortKey(airCubit.toAirPort),
                              portFromID: serviceCubit
                                  .getFromPortKey(airCubit.fromAirPort),
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
                                  airCubit.getRadioKey(airCubit.character),
                              serviceTypeId: 1,
                              numberOfPieces: numberofpieces.text,
                              goodsDesc: descriptionofgoods.text,
                              pickupDate: pickupDate.text,
                              pickupAddress: address.text,
                              pickupZip: zipCodePickup.text,
                              radioShippmentTypeId: airCubit.getRadioKey(
                                airCubit.characterStorage,
                                isStorage: true,
                              ),
                              fromDate: fromDate.text,
                              toDate: toDate.text,
                              sizeID: airCubit.getSizeKey(airCubit.size),
                              storagePickupDate: pickupDateStorage.text,
                              storagePickupCityID: serviceCubit
                                  .getCityKey(airCubit.pickupCityStorage),
                              addressStorage: addressStorage.text,
                              storageOtherSize: description.text,
                              pickupCityID:
                                  serviceCubit.getCityKey(airCubit.pickupCity),
                              dimensionsUnitID: serviceCubit
                                  .getLUnitKey(airCubit.dimensionsUnitName),
                              dimensionsUnitID1: serviceCubit
                                  .getLUnitKey(airCubit.dimensionsUnitName1),
                              dimensionsUnitID2: serviceCubit
                                  .getLUnitKey(airCubit.dimensionsUnitName2),
                              dimensionsUnitID3: serviceCubit
                                  .getLUnitKey(airCubit.dimensionsUnitName3),
                              dimensionsUnitID4: serviceCubit
                                  .getLUnitKey(airCubit.dimensionsUnitName4),
                              dimensionsUnitID5: serviceCubit
                                  .getLUnitKey(airCubit.dimensionsUnitName5),
                              weightUnitID: serviceCubit
                                  .getWUnitKey(airCubit.weightUnitName),
                              weightUnitID1: serviceCubit
                                  .getWUnitKey(airCubit.weightUnitName1),
                              weightUnitID2: serviceCubit
                                  .getWUnitKey(airCubit.weightUnitName2),
                              weightUnitID3: serviceCubit
                                  .getWUnitKey(airCubit.weightUnitName3),
                              weightUnitID4: serviceCubit
                                  .getWUnitKey(airCubit.weightUnitName4),
                              weightUnitID5: serviceCubit
                                  .getWUnitKey(airCubit.weightUnitName5),
                            );
                          }
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
        if (state is AirSubmitSuccessState) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Oh Hey!!',
              message: airCubit.successMessages,
              contentType: ContentType.success,
              // to configure for material banner
              inMaterialBanner: true,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        } else if (state is AirSubmitErrorState) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'ُError!',
              message: airCubit.errorMessages,
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

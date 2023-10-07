// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/calculate_cubit.dart';
import 'package:masmix/controller/cubits/service_cubit.dart';
import 'package:masmix/controller/share/components/card_shipment_data.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/components/text_form_field.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:masmix/controller/states/calculate_states.dart';
import 'package:masmix/views/calculate_screen/calculate_view_screen.dart';
//This Class To Display Calculate Screen
class CalculateScreen extends StatelessWidget {
  TextEditingController zipCode = TextEditingController();
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
  TextEditingController delcaredValue = TextEditingController();
  TextEditingController delcaredValue1 = TextEditingController();
  TextEditingController delcaredValue2 = TextEditingController();
  TextEditingController delcaredValue3 = TextEditingController();
  TextEditingController delcaredValue4 = TextEditingController();
  TextEditingController delcaredValue5 = TextEditingController();
  TextEditingController hsCode = TextEditingController();
  TextEditingController hsCode1 = TextEditingController();
  TextEditingController hsCode2 = TextEditingController();
  TextEditingController hsCode3 = TextEditingController();
  TextEditingController hsCode4 = TextEditingController();
  TextEditingController hsCode5 = TextEditingController();

  CalculateScreen({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var calculateCubit = CalculateCubit.get(context);
    var servicesCubit = ServiceCubit.get(context)..getCountryAndCity(serviceID: 1);
    return BlocConsumer<CalculateCubit, CalculateStates>(
      listener: (context, state) {
        if(state is SuccessSubmitCalculateStates) {
          navigateto(context, const CalculateViewScreen());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.titleCalculatorScreen),
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
                    //Geo Data
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
                    //This Container to Display Geo Data
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: defaultColorNavyBlue,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: defaultField(
                                label: AppLocalizations.of(context)!
                                    .destinationCountry,
                                widget: defaultDropdownSearch(
                                  items: calculateCubit.countryList,
                                  isSearch: true,
                                  onChang: (value) {
                                    calculateCubit.changeFromCountry(value);
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
                                label: AppLocalizations.of(context)!.zipCode,
                                widget: defaultTextFormField(
                                  controll: zipCode,
                                  type: TextInputType.text,
                                ),
                              ),
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
                    //This Container to Display Shipment Data
                    containerShipmentData(
                      limit: calculateCubit.limit,
                      functionRemove: () {
                        calculateCubit.decrementLimit();
                      },
                      functionAdd: () {
                        calculateCubit.incrementLimit();
                      },
                      list: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => cardShipmentData(
                          functionWUnit: (value) {
                            calculateCubit.changeWeightUnitName(value, index);
                          },
                          functionLUnit: (value) {
                            calculateCubit.changeDimensionsUnitName(
                                value, index);
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
                          unit1: servicesCubit.wUnitList,
                          unit2: servicesCubit.lUnitList,
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
                        itemCount: calculateCubit.limit,
                      ),
                      context: context,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      //This Button To Submit Calculate
                      child: defaultButton(
                        text: 'Calculator',
                        width: 120.0,
                        function: () {
                          //This Function to pass Data To API Calculate
                          calculateCubit.submitCalculate(
                            countryId: servicesCubit.getCountryKey(calculateCubit.fromCountry),
                            postalCode: zipCode.text,
                            height: height.text,
                            height1: height1.text,
                            height2: height2.text,
                            height3: height3.text,
                            height4: height4.text,
                            height5: height5.text,
                            length: length.text,
                            length1: length1.text,
                            length2: length2.text,
                            length3: length3.text,
                            length4: length4.text,
                            length5: length5.text,
                            width: width.text,
                            width1: width1.text,
                            width2: width2.text,
                            width3: width3.text,
                            width4: width4.text,
                            width5: width5.text,
                            weight: weight.text,
                            weight1: weight1.text,
                            weight2: weight2.text,
                            weight3: weight3.text,
                            weight4: weight4.text,
                            weight5: weight5.text,
                            weightID: servicesCubit.getWUnitKey(calculateCubit.weightUnitName),
                            weightID1: servicesCubit.getWUnitKey(calculateCubit.weightUnitName1),
                            weightID2: servicesCubit.getWUnitKey(calculateCubit.weightUnitName2),
                            weightID3: servicesCubit.getWUnitKey(calculateCubit.weightUnitName3),
                            weightID4: servicesCubit.getWUnitKey(calculateCubit.weightUnitName4),
                            weightID5: servicesCubit.getWUnitKey(calculateCubit.weightUnitName5),
                            dimensionsID: servicesCubit.getLUnitKey(calculateCubit.dimensionsUnitName),
                            dimensionsID1: servicesCubit.getLUnitKey(calculateCubit.dimensionsUnitName1),
                            dimensionsID2: servicesCubit.getLUnitKey(calculateCubit.dimensionsUnitName2),
                            dimensionsID3: servicesCubit.getLUnitKey(calculateCubit.dimensionsUnitName3),
                            dimensionsID4: servicesCubit.getLUnitKey(calculateCubit.dimensionsUnitName4),
                            dimensionsID5: servicesCubit.getLUnitKey(calculateCubit.dimensionsUnitName5),
                          );
                        },
                        color: defaultColorNavyBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

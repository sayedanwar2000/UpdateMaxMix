import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/endpointer.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/calculate_states.dart';

class CalculateCubit extends Cubit<CalculateStates> {
  CalculateCubit() : super(InitialCalculate());

  static CalculateCubit get(context) => BlocProvider.of(context);

  String dimensionsUnitName = '';
  String dimensionsUnitName1 = '';
  String dimensionsUnitName2 = '';
  String dimensionsUnitName3 = '';
  String dimensionsUnitName4 = '';
  String dimensionsUnitName5 = '';
  String weightUnitName = '';
  String weightUnitName1 = '';
  String weightUnitName2 = '';
  String weightUnitName3 = '';
  String weightUnitName4 = '';
  String weightUnitName5 = '';
  String fromCountry = '';
  int limit = 1;
  List<dynamic> calculate = [];
  List<String> countryList = [];
  var countryIdList = <int, String>{};
//this function to increment package calculate
  void incrementLimit() {
    if (limit < 6) {
      limit++;
    }
    emit(CalculateIncrementLimitState());
  }

  //this function to decrement package calculate
  void decrementLimit() {
    if (limit > 1) {
      limit--;
    }
    emit(CalculateDecrementLimitState());
  }

  //this function to give Dimensions Unit Name
  void changeDimensionsUnitName(value, key) {
    switch (key) {
      case 0:
        dimensionsUnitName = value;
        break;
      case 1:
        dimensionsUnitName1 = value;
        break;
      case 2:
        dimensionsUnitName2 = value;
        break;
      case 3:
        dimensionsUnitName3 = value;
        break;
      case 4:
        dimensionsUnitName4 = value;
        break;
      case 5:
        dimensionsUnitName5 = value;
        break;
    }
    emit(CalculateChangeDimensionsUnitNameState());
  }
  //this function to give Weight Unit Name
  void changeWeightUnitName(value, key) {
    switch (key) {
      case 0:
        weightUnitName = value;
        break;
      case 1:
        weightUnitName1 = value;
        break;
      case 2:
        weightUnitName2 = value;
        break;
      case 3:
        weightUnitName3 = value;
        break;
      case 4:
        weightUnitName4 = value;
        break;
      case 5:
        weightUnitName5 = value;
        break;
    }
    emit(CalculateChangeWeightUnitNameState());
  }
  //this function to change country
  void changeFromCountry(value) {
    fromCountry = value;
    emit(CalculateChangeFromCountryState());
  }
  //this function to get country
  void getCountry() {
    countryList = [];
    countryIdList = <int, String>{};
    emit(GetCountryCalculateLoadingState());
    DioHelper.postData(
      url: GetCountriesCalculator,
      data: {},
    ).then((value) async {
      var list = value.data;
      for (var item in list) {
        countryList.add(item['country_Name']);
        countryIdList[item['country_id'].toInt()] =
        item['country_Name'];
      }
      emit(GetCountryCalculateSuccessState());
    }).catchError((error) {
      emit(GetCountryCalculateErrorState(error.toString()));
    });
  }
  //this function to submit calculate
  void submitCalculate({
    required countryId,
    required postalCode,
    required height,
    required height1,
    required height2,
    required height3,
    required height4,
    required height5,
    required length,
    required length1,
    required length2,
    required length3,
    required length4,
    required length5,
    required width,
    required width1,
    required width2,
    required width3,
    required width4,
    required width5,
    required weight,
    required weight1,
    required weight2,
    required weight3,
    required weight4,
    required weight5,
    required weightID,
    required weightID1,
    required weightID2,
    required weightID3,
    required weightID4,
    required weightID5,
    required dimensionsID,
    required dimensionsID1,
    required dimensionsID2,
    required dimensionsID3,
    required dimensionsID4,
    required dimensionsID5,
  }) {
    calculate = [];
    emit(LoadingSubmitCalculateStates());
    DioHelper.postData(
      url: SubmitCalculate,
      data: {
        "countryId": countryId,
        "ToPostalCode": postalCode,
        "ToCountryName": fromCountry,
        "height": height,
        "height1": limit > 1 ? height1 : 0,
        "height2": limit > 2 ? height2 : 0,
        "height3": limit > 3 ? height3 : 0,
        "height4": limit > 4 ? height4 : 0,
        "height5": limit > 5 ? height5 : 0,
        "length": length,
        "length1": limit > 1 ? length1 : 0,
        "length2": limit > 2 ? length2 : 0,
        "length3": limit > 3 ? length3 : 0,
        "length4": limit > 4 ? length4 : 0,
        "length5": limit > 5 ? length5 : 0,
        "width": width,
        "width1": limit > 1 ? width1 : 0,
        "width2": limit > 2 ? width2 : 0,
        "width3": limit > 3 ? width3 : 0,
        "width4": limit > 4 ? width4 : 0,
        "width5": limit > 5 ? width5 : 0,
        "Weight": weight,
        "weight1": limit > 1 ? weight1 : 0,
        "weight2": limit > 2 ? weight2 : 0,
        "weight3": limit > 3 ? weight3 : 0,
        "weight4": limit > 4 ? weight4 : 0,
        "weight5": limit > 5 ? weight5 : 0,
        "weight_unit1": weightID,
        "weight_unit11": limit > 1 ? weightID1 : 0,
        "weight_unit12": limit > 2 ? weightID2 : 0,
        "weight_unit13": limit > 3 ? weightID3 : 0,
        "weight_unit14": limit > 4 ? weightID4 : 0,
        "weight_unit15": limit > 5 ? weightID5 : 0,
        "weight_unit1Name": weightUnitName,
        "weight_unit11Name": limit > 1 ? weightUnitName1 : '',
        "weight_unit12Name": limit > 2 ? weightUnitName2 : '',
        "weight_unit13Name": limit > 3 ? weightUnitName3 : '',
        "weight_unit14Name": limit > 4 ? weightUnitName4 : '',
        "weight_unit15Name": limit > 5 ? weightUnitName5 : '',
        "dimensions_unit1": dimensionsID,
        "dimensions_unit11": limit > 1 ? dimensionsID1 : 0,
        "dimensions_unit12": limit > 2 ? dimensionsID2 : 0,
        "dimensions_unit13": limit > 3 ? dimensionsID3 : 0,
        "dimensions_unit14": limit > 4 ? dimensionsID4 : 0,
        "dimensions_unit15": limit > 5 ? dimensionsID5 : 0,
        "dimensions_unit1Name": dimensionsUnitName,
        "dimensions_unit11Name": limit > 1 ? dimensionsUnitName1 : '',
        "dimensions_unit12Name": limit > 2 ? dimensionsUnitName2 : '',
        "dimensions_unit13Name": limit > 3 ? dimensionsUnitName3 : '',
        "dimensions_unit14Name": limit > 4 ? dimensionsUnitName4 : '',
        "dimensions_unit15Name": limit > 5 ? dimensionsUnitName5 : '',
      },
    ).then((value) {
      print(value.data);
      calculate = value.data;
      emit(SuccessSubmitCalculateStates());
    })/*.catchError((error) {
      emit(ErrorSubmitCalculateStates(error.toString()));
    })*/;
  }
}

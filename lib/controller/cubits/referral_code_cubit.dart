import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/endpointer.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/referral_code_states.dart';

class ReferralCodeCubit extends Cubit<ReferralCodeStates> {
  ReferralCodeCubit() : super(InitialReferralCode());

  static ReferralCodeCubit get(context) => BlocProvider.of(context);

  String message = '';
  bool showDetails = false;
  var people = [];
  var customersForReferralCode = [];

  //this function to change Show Details
  void changeShowDetails(value){
    showDetails = value;
    emit(ChangeShowDetailsReferralCodeState());
  }
//this function to generate Referral Code
  void generateReferralCode({
    required userId,
    myReferralCode,
  }) {
    emit(GenerateReferralCodeLoadingState());
    DioHelper.postData(
      url: GenerateReferralCode,
      data: {
        "my_referral_code": myReferralCode,
        "userId": userId,
      },
    ).then((value) {
      message = value.data[0]['validation_error_messages'];
        emit(GenerateReferralCodeSuccessState());
    }).catchError((error) {
      emit(GenerateReferralCodeErrorState(error.toString()));
    });
  }
//this function to get People Referral Code
  void getPeopleReferralCode({
    required myReferralCode,
  }) {
    emit(GenerateReferralCodeLoadingState());
    DioHelper.postData(
      url: GetPeopleReferralCode,
      data: {
        "my_referral_code": myReferralCode,
      },
    ).then((value) {
      people = value.data;
        emit(GenerateReferralCodeSuccessState());
    }).catchError((error) {
      emit(GenerateReferralCodeErrorState(error.toString()));
    });
  }
//this function to get Customers For Referral Code
  void getCustomersForReferralCode({
    required myReferralCode,
  }) {
    emit(GetCustomersForReferralCodeLoadingState());
    DioHelper.postData(
      url: GetCustomersForReferralCode,
      data: {
        "my_referral_code": myReferralCode,
      },
    ).then((value) {
      customersForReferralCode = value.data;
        emit(GetCustomersForReferralCodeSuccessState());
    }).catchError((error) {
      emit(GetCustomersForReferralCodeErrorState(error.toString()));
    });
  }
}

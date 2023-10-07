import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/endpointer.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/mas4me_statets.dart';

class Mas4meCubit extends Cubit<Mas4meStates>{
  Mas4meCubit() : super(InitialMas4me());
  static Mas4meCubit get(context) => BlocProvider.of(context);

  List mas4MeList = [];
//this function to submit mas4me
  void submitMas4Me({
    required currUserId,
    required siteName,
    required siteUrl,
    required itemName,
    required itemUrl,
    required options,
    required price,
    required quantity,
    required firstName,
    required phoneCountryCode,
    required mobile,
    required email,
  }) {
    emit(Mas4meLoadingState());
    DioHelper.postData(
      url: submitMas4me,
      data: {
        "curr_user_id": currUserId,
        "sitename": siteName,
        "siteurl": siteUrl,
        "itemname": itemName,
        "itemurl1": itemUrl,
        "options": options,
        "price1": price,
        "quantity1": quantity,
        "FirstName": firstName,
        "phone_country_code": phoneCountryCode,
        "mob": mobile,
        "Email": email
      },
    ).then((value) {
      var result = value.data;
      if(result[0]['validation_error_messages'] == "Success") {
        emit(Mas4meSuccessState());
      }
      else{
        emit(Mas4meErrorState(result['validation_error_messages']));
      }
    }).catchError((error) {
      emit(Mas4meErrorState(error.toString()));
    });
  }
}
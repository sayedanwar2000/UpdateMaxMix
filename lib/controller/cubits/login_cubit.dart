import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/endpointer.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/login_states.dart';
import 'package:masmix/models/user_model.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  IconData suffix = Icons.visibility;
  bool isPassword = true;
  late UserModel loginModel;

  //this function to log in
  void userLogin({
    required String email,
    required String password,
  }){
    emit(LoginLoadingState());
    DioHelper.postData(
      url: Login,
      data: {
        'username' : email,
        'password' : password,
      },
    ).then((value) {
      print(value.data);
      if(value.data.runtimeType == String) {
        emit(LoginErrorState(value.data));
      } else {
        loginModel = UserModel.fromJson(value.data);
        emit(LoginSuccessState());
      }
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  //this function to change icon password and change see or not see password
  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisbilityState());
  }
}

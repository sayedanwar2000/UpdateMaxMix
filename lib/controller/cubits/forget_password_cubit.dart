import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/endpointer.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/forget_password_states.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() : super(InitialForgetPasswordStates());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  IconData suffix = Icons.visibility;
  bool isPassword = true;
  IconData suffixReType = Icons.visibility;
  bool isReTypePassword = true;
  String email = '';
  String messageSendCode = '';
  String messageChangePassword = '';

  //this function to change Email
  void changeEmail(String value){
    email = value;
  }
//this function to submit forget Password
  void forgetPassword({
    required String email,
  }) {
    emit(LoadingForgetPasswordStates());
    DioHelper.postData(
      url: ForgetPassword,
      data: {
        'email': email,
      },
    ).then((value) {
      messageSendCode = value.data[0]['validation_error_messages'];
      emit(SuccessForgetPasswordStates());
    }).catchError((error) {
      emit(ErrorForgetPasswordStates(error.toString()));
    });
  }
//this function to change password for Forget Password
  void changeForgetPassword({
    required String newPassword,
    required String code,
  }) {
    emit(LoadingChangeForgetPasswordStates());
    DioHelper.postData(
      url: ChangeForgetPassword,
      data: {
        "email": email,
        "code": code,
        "newPassword": newPassword,
      },
    ).then((value) {
      messageChangePassword = value.data[0]['validation_error_messages'];
      if (messageChangePassword == 'Your password has changed successfuly') {
        emit(SuccessChangeForgetPasswordStates());
      } else {
        emit(ErrorChangeForgetPasswordStates(messageChangePassword));
      }
    }).catchError((error) {
      emit(ErrorChangeForgetPasswordStates(error.toString()));
    });
  }
//this function to change icon and see or not see password for Password Visibility
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisbilityForgetPasswordStates());
  }
//this function tochange icon and see or not see password for re-type Password Visibility
  void changeReTypePasswordVisibility() {
    isReTypePassword = !isReTypePassword;
    suffixReType = isReTypePassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangeReTypePasswordVisbilityForgetPasswordStates());
  }
}

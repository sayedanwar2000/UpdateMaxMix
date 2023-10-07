abstract class ForgetPasswordStates {}

class InitialForgetPasswordStates extends ForgetPasswordStates {}

class ChangePasswordVisbilityForgetPasswordStates
    extends ForgetPasswordStates {}

class ChangeReTypePasswordVisbilityForgetPasswordStates
    extends ForgetPasswordStates {}

class LoadingForgetPasswordStates extends ForgetPasswordStates {}

class SuccessForgetPasswordStates extends ForgetPasswordStates {}

class ErrorForgetPasswordStates extends ForgetPasswordStates {
  String error;

  ErrorForgetPasswordStates(this.error);
}

class LoadingChangeForgetPasswordStates extends ForgetPasswordStates {}

class SuccessChangeForgetPasswordStates extends ForgetPasswordStates {}

class ErrorChangeForgetPasswordStates extends ForgetPasswordStates {
  String error;

  ErrorChangeForgetPasswordStates(this.error);
}

abstract class SignupStates {}

class SignupInitialState extends SignupStates {}

class SignupLoadingState extends SignupStates {}

class SignupSuccessState extends SignupStates {}

class SignupErrorState extends SignupStates {
  final String error;

  SignupErrorState(this.error);
}

class ChangePasswordVisbilitySignupState extends SignupStates {}

class ChangePasswordConfirmVisbilitySignupState extends SignupStates {}

class ChangeCheckboxState extends SignupStates {}

class SignupChangeCountryCodeState extends SignupStates {}


abstract class ReferralCodeStates {}

class InitialReferralCode extends ReferralCodeStates {}

class ChangeShowDetailsReferralCodeState extends ReferralCodeStates {}

class GenerateReferralCodeLoadingState extends ReferralCodeStates {}

class GenerateReferralCodeSuccessState extends ReferralCodeStates {}

class GenerateReferralCodeErrorState extends ReferralCodeStates {
  final String error;

  GenerateReferralCodeErrorState(this.error);
}

class GetPeopleReferralCodeLoadingState extends ReferralCodeStates {}

class GetPeopleReferralCodeSuccessState extends ReferralCodeStates {}

class GetPeopleReferralCodeErrorState extends ReferralCodeStates {
  final String error;

  GetPeopleReferralCodeErrorState(this.error);
}

class GetCustomersForReferralCodeLoadingState extends ReferralCodeStates {}

class GetCustomersForReferralCodeSuccessState extends ReferralCodeStates {}

class GetCustomersForReferralCodeErrorState extends ReferralCodeStates {
  final String error;

  GetCustomersForReferralCodeErrorState(this.error);
}
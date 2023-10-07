abstract class LandStates {}

class InitialLandStates extends LandStates {}

class LandChangeFromCountryState extends LandStates {}

class LandChangeFromCityState extends LandStates {}

class LandChangeToCountryState extends LandStates {}

class LandChangeToCityState extends LandStates {}

class LandChangeCharacterState extends LandStates {}

class LandChangeDimensionsUnitNameState extends LandStates {}

class LandChangeWeightUnitNameState extends LandStates {}

class LandChangeNeedStorageState extends LandStates {}

class LandChangeAnotherSizeState extends LandStates {}

class LandChangeSizeState extends LandStates {}

class LandCheckBoxChangeOriginState extends LandStates {}

class LandCheckBoxChangeDestState extends LandStates {}

class LandIncrementLimitState extends LandStates {}

class LandDecrementLimitState extends LandStates {}

class LandChangeToEmptyState extends LandStates {}

class LandChangeUseAddressState extends LandStates {}

class LandRadioButtonLoadingState extends LandStates {}

class LandRadioButtonSuccessState extends LandStates {}

class LandRadioButtonErrorState extends LandStates {
  final String error;

  LandRadioButtonErrorState(this.error);
}

class LandGetOriginMainServicesLoadingState extends LandStates {}

class LandGetOriginMainServicesSuccessState extends LandStates {}

class LandGetOriginMainServicesErrorState extends LandStates {
  final String error;

  LandGetOriginMainServicesErrorState(this.error);
}

class LandGetDestMainServicesLoadingState extends LandStates {}

class LandGetDestMainServicesSuccessState extends LandStates {}

class LandGetDestMainServicesErrorState extends LandStates {
  final String error;

  LandGetDestMainServicesErrorState(this.error);
}

class LandSizeLoadingState extends LandStates {}

class LandSizeSuccessState extends LandStates {}

class LandSizeErrorState extends LandStates {
  final String error;

  LandSizeErrorState(this.error);
}

class LandSubmitLoadingState extends LandStates {}

class LandSubmitSuccessState extends LandStates {}

class LandSubmitErrorState extends LandStates {
  final String error;

  LandSubmitErrorState(this.error);
}
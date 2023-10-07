abstract class AirStates {}

class InitialAirStates extends AirStates {}

class AirIncrementLimitState extends AirStates {}

class AirDecrementLimitState extends AirStates {}

class AirChangeFromCountryState extends AirStates {}

class AirChangeFromCityState extends AirStates {}

class AirChangeFromAirPortState extends AirStates {}

class AirChangeToCountryState extends AirStates {}

class AirChangeToCityState extends AirStates {}

class AirChangePickUpCityState extends AirStates {}

class AirChangeDeliveryCityState extends AirStates {}

class AirChangeToAirPortState extends AirStates {}

class AirChangeCharacterState extends AirStates {}

class AirChangeSizeState extends AirStates {}

class AirChangeDimensionsUnitNameState extends AirStates {}

class AirChangeWeightUnitNameState extends AirStates {}

class AirChangeNeedStorageState extends AirStates {}

class AirChangeAnotherSizeState extends AirStates {}

class AirChangeUseAddressState extends AirStates {}

class AirCheckBoxChangeDestState extends AirStates {}

class AirCheckBoxChangeOriginState extends AirStates {}

class AirRadioButtonLoadingState extends AirStates {}

class AirRadioButtonSuccessState extends AirStates {}

class AirRadioButtonErrorState extends AirStates {
  final String error;

  AirRadioButtonErrorState(this.error);
}

class AirGetOriginMainServicesLoadingState extends AirStates {}

class AirGetOriginMainServicesSuccessState extends AirStates {}

class AirGetOriginMainServicesErrorState extends AirStates {
  final String error;

  AirGetOriginMainServicesErrorState(this.error);
}

class AirGetDestMainServicesLoadingState extends AirStates {}

class AirGetDestMainServicesSuccessState extends AirStates {}

class AirGetDestMainServicesErrorState extends AirStates {
  final String error;

  AirGetDestMainServicesErrorState(this.error);
}

class AirSizeLoadingState extends AirStates {}

class AirSizeSuccessState extends AirStates {}

class AirSizeErrorState extends AirStates {
  final String error;

  AirSizeErrorState(this.error);
}

class AirSubmitLoadingState extends AirStates {}

class AirSubmitSuccessState extends AirStates {}

class AirSubmitErrorState extends AirStates {
  final String error;

  AirSubmitErrorState(this.error);
}

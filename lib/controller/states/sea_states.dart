abstract class SeaStates {}

class InitialSeaStates extends SeaStates{}

class SeaIncrementLimitState extends SeaStates {}

class SeaDecrementLimitState extends SeaStates {}

class SeaChangeFromCountryState extends SeaStates {}

class SeaChangeFromCityState extends SeaStates {}

class SeaChangeFromSeaPortState extends SeaStates {}

class SeaChangeToCountryState extends SeaStates {}

class SeaChangeToCityState extends SeaStates {}

class SeaChangePickUpCityState extends SeaStates {}

class SeaChangeDeliveryCityState extends SeaStates {}

class SeaChangeToSeaPortState extends SeaStates {}

class SeaChangeCharacterState extends SeaStates {}

class SeaChangeSizeState extends SeaStates {}

class SeaChangeNeedStorageState extends SeaStates {}

class SeaChangeAnotherSizeState extends SeaStates {}

class SeaChangeUseAddressState extends SeaStates {}

class SeaCheckBoxChangeDestState extends SeaStates {}

class SeaCheckBoxChangeOriginState extends SeaStates {}

class SeaChangeDimensionsUnitNameState extends SeaStates {}

class SeaChangeWeightUnitNameState extends SeaStates {}

class SeaRadioButtonLoadingState extends SeaStates {}

class SeaRadioButtonSuccessState extends SeaStates {}

class SeaRadioButtonErrorState extends SeaStates {
  final String error;

  SeaRadioButtonErrorState(this.error);
}

class SeaGetOriginMainServicesLoadingState extends SeaStates {}

class SeaGetOriginMainServicesSuccessState extends SeaStates {}

class SeaGetOriginMainServicesErrorState extends SeaStates {
  final String error;

  SeaGetOriginMainServicesErrorState(this.error);
}

class SeaGetDestMainServicesLoadingState extends SeaStates {}

class SeaGetDestMainServicesSuccessState extends SeaStates {}

class SeaGetDestMainServicesErrorState extends SeaStates {
  final String error;

  SeaGetDestMainServicesErrorState(this.error);
}

class SeaSizeLoadingState extends SeaStates {}

class SeaSizeSuccessState extends SeaStates {}

class SeaSizeErrorState extends SeaStates {
  final String error;

  SeaSizeErrorState(this.error);
}

class SubmitLoadingState extends SeaStates {}

class SubmitSuccessState extends SeaStates {}

class SubmitErrorState extends SeaStates {
  final String error;

  SubmitErrorState(this.error);
}

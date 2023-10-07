abstract class StorageStates {}

class StorageInitialState extends StorageStates {}

class StorageChangeCheckBoxState extends StorageStates {}

class StorageChangeCountryState extends StorageStates {}

class StorageChangeCityState extends StorageStates {}

class StorageChangePickUpCityState extends StorageStates {}

class StorageCheckBoxChangeState extends StorageStates {}

class StorageChangeUseAddressState extends StorageStates {}

class StorageChangeCharacterState extends StorageStates {}

class StorageChangeSizeState extends StorageStates {}

class StorageLoadingState extends StorageStates {}

class StorageSuccessState extends StorageStates {}

class StorageErrorState extends StorageStates {
  final String error;

  StorageErrorState(this.error);
}

class StorageSizeLoadingState extends StorageStates {}

class StorageSizeSuccessState extends StorageStates {}

class StorageSizeErrorState extends StorageStates {
  final String error;

  StorageSizeErrorState(this.error);
}

class GetRadioButtonLoadingState extends StorageStates {}

class GetRadioButtonSuccessState extends StorageStates {}

class GetRadioButtonErrorState extends StorageStates {
  final String error;

  GetRadioButtonErrorState(this.error);
}

class GetOriginMainServicesLoadingState extends StorageStates {}

class GetOriginMainServicesSuccessState extends StorageStates {}

class GetOriginMainServicesErrorState extends StorageStates {
  final String error;

  GetOriginMainServicesErrorState(this.error);
}

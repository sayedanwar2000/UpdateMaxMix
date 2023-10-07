abstract class ServiceStates {}

class ServiceInitialState extends ServiceStates {}

class ServiceCityChangeState extends ServiceStates {}

class StateChangeState extends ServiceStates {}

class ServiceCheckBoxChangeState extends ServiceStates {}

class ServiceCountryLoadingState extends ServiceStates {}

class ServiceCountrySuccessState extends ServiceStates {}

class ServiceCountryErrorState extends ServiceStates {
  final String error;

  ServiceCountryErrorState(this.error);
}

class ServiceCityLoadingState extends ServiceStates {}

class ServiceCitySuccessState extends ServiceStates {}

class ServiceCityErrorState extends ServiceStates {
  final String error;

  ServiceCityErrorState(this.error);
}

class GetFromPortLoadingState extends ServiceStates {}

class GetFromPortSuccessState extends ServiceStates {}

class GetFromPortErrorState extends ServiceStates {
  final String error;

  GetFromPortErrorState(this.error);
}

class GetToPortLoadingState extends ServiceStates {}

class GetToPortSuccessState extends ServiceStates {}

class GetToPortErrorState extends ServiceStates {
  final String error;

  GetToPortErrorState(this.error);
}

class GetOriginMainServicesLoadingState extends ServiceStates {}

class GetOriginMainServicesSuccessState extends ServiceStates {}

class GetOriginMainServicesErrorState extends ServiceStates {
  final String error;

  GetOriginMainServicesErrorState(this.error);
}

class ServiceRadioButtonLoadingState extends ServiceStates {}

class ServiceRadioButtonSuccessState extends ServiceStates {}

class ServiceRadioButtonErrorState extends ServiceStates {
  final String error;

  ServiceRadioButtonErrorState(this.error);
}

class GetCountryToLoadingState extends ServiceStates {}

class GetCountryToSuccessState extends ServiceStates {}

class GetCountryToErrorState extends ServiceStates {
  final String error;

  GetCountryToErrorState(this.error);
}

class GetCityToLoadingState extends ServiceStates {}

class GetCityToSuccessState extends ServiceStates {}

class GetCityToErrorState extends ServiceStates {
  final String error;

  GetCityToErrorState(this.error);
}

class GetWUnitLoadingState extends ServiceStates {}

class GetWUnitSuccessState extends ServiceStates {}

class GetWUnitErrorState extends ServiceStates {
  final String error;

  GetWUnitErrorState(this.error);
}

class GetLUnitLoadingState extends ServiceStates {}

class GetLUnitSuccessState extends ServiceStates {}

class GetLUnitErrorState extends ServiceStates {
  final String error;

  GetLUnitErrorState(this.error);
}

class GetQuotationsLoadingState extends ServiceStates {}

class GetQuotationsSuccessState extends ServiceStates {}

class GetQuotationsErrorState extends ServiceStates {
  final String error;

  GetQuotationsErrorState(this.error);
}

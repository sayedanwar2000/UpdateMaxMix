abstract class CalculateStates {}

class InitialCalculate extends CalculateStates {}

class CalculateIncrementLimitState extends CalculateStates {}

class CalculateDecrementLimitState extends CalculateStates {}

class CalculateChangeDimensionsUnitNameState extends CalculateStates {}

class CalculateChangeWeightUnitNameState extends CalculateStates {}

class CalculateChangeFromCountryState extends CalculateStates {}

class LoadingSubmitCalculateStates extends CalculateStates {}

class SuccessSubmitCalculateStates extends CalculateStates {}

class ErrorSubmitCalculateStates extends CalculateStates {
  String error;

  ErrorSubmitCalculateStates(this.error);
}
class GetCountryCalculateLoadingState extends CalculateStates {}

class GetCountryCalculateSuccessState extends CalculateStates {}

class GetCountryCalculateErrorState extends CalculateStates {
  String error;

  GetCountryCalculateErrorState(this.error);
}

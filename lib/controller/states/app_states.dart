abstract class AppStates {}

class AppInitialState extends AppStates {}

class CityChangeState extends AppStates {}

class AppLanguageChangeState extends AppStates {}

class CurrencyLoadingState extends AppStates {}

class CurrencySuccessState extends AppStates {}

class CurrencyErrorState extends AppStates {
  final String error;

  CurrencyErrorState(this.error);
}

class GetIPLoadingState extends AppStates {}

class GetIPSuccessState extends AppStates {}

class GetIPErrorState extends AppStates {
  final String error;

  GetIPErrorState(this.error);
}

class LanguageLoadingState extends AppStates {}

class LanguageSuccessState extends AppStates {}

class LanguageErrorState extends AppStates {
  final String error;

  LanguageErrorState(this.error);
}

class AccountTypeLoadingState extends AppStates {}

class AccountTypeSuccessState extends AppStates {}

class AccountTypeErrorState extends AppStates {
  final String error;

  AccountTypeErrorState(this.error);
}

class CountryLoadingState extends AppStates {}

class CountrySuccessState extends AppStates {}

class CountryErrorState extends AppStates {
  final String error;

  CountryErrorState(this.error);
}

class CountryCodeLoadingState extends AppStates {}

class CountryCodeSuccessState extends AppStates {}

class CountryCodeErrorState extends AppStates {
  final String error;

  CountryCodeErrorState(this.error);
}

class CityLoadingState extends AppStates {}

class CitySuccessState extends AppStates {}

class CityErrorState extends AppStates {
  final String error;

  CityErrorState(this.error);
}


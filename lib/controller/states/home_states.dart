abstract class HomeStates{}

class HomeInitialState extends HomeStates{}

class ChangePageNumberState extends HomeStates{}

class ChangeIsShowState extends HomeStates{}

class GetInvoicesLoadingState extends HomeStates {}

class GetInvoicesSuccessState extends HomeStates {}

class GetInvoicesErrorState extends HomeStates {
  final String error;

  GetInvoicesErrorState(this.error);
}

class GetQuotationsLoadingState extends HomeStates {}

class GetQuotationsSuccessState extends HomeStates {}

class GetQuotationsErrorState extends HomeStates {
  final String error;

  GetQuotationsErrorState(this.error);
}

class GetPackagesLoadingState extends HomeStates {}

class GetPackagesSuccessState extends HomeStates {}

class GetPackagesErrorState extends HomeStates {
  final String error;

  GetPackagesErrorState(this.error);
}

class GetMyStorageLoadingState extends HomeStates {}

class GetMyStorageSuccessState extends HomeStates {}

class GetMyStorageErrorState extends HomeStates {
  final String error;

  GetMyStorageErrorState(this.error);
}

class GetMas4meLoadingState extends HomeStates {}

class GetMas4meSuccessState extends HomeStates {}

class GetMas4meErrorState extends HomeStates {
  final String error;

  GetMas4meErrorState(this.error);
}
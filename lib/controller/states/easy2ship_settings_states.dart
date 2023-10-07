abstract class Easy2shipSettingsStates {}

class InitialEasy2shipSettingsStates extends Easy2shipSettingsStates {}

class ChangeRemoveShoeBoxState extends Easy2shipSettingsStates {}

class ChangeNoImagesState extends Easy2shipSettingsStates {}

class ChangeGetNotificationsState extends Easy2shipSettingsStates {}

class ChangeAvailableWalletCreditState extends Easy2shipSettingsStates {}

class UpDateLoadingState extends Easy2shipSettingsStates {}

class UpDateSuccessState extends Easy2shipSettingsStates {}

class UpDateErrorState extends Easy2shipSettingsStates {
  late final String error;

  UpDateErrorState(this.error);
}

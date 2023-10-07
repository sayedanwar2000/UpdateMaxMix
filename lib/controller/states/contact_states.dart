abstract class ContactStates {}

class InitialContactStates extends ContactStates {}

class ChangeCheckboxContactStates extends ContactStates {}

class SubmitContactLoadingState extends ContactStates {}

class SubmitContactSuccessState extends ContactStates {}

class SubmitContactErrorState extends ContactStates {
  final String error;

  SubmitContactErrorState(this.error);
}

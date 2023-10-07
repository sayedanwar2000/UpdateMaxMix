abstract class Mas4meStates {}

class InitialMas4me extends Mas4meStates {}

class Mas4meLoadingState extends Mas4meStates {}

class Mas4meSuccessState extends Mas4meStates {}

class Mas4meErrorState extends Mas4meStates {
  final String error;
  Mas4meErrorState(this.error);
}

class GetMas4meLoadingState extends Mas4meStates {}

class GetMas4meSuccessState extends Mas4meStates {}

class GetMas4meErrorState extends Mas4meStates {
  final String error;
  GetMas4meErrorState(this.error);
}
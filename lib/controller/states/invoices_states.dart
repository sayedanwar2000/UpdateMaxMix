abstract class InvoicesStates {}

class InitialInvoicesState extends InvoicesStates {}

class GetInvoicesLoadingState extends InvoicesStates {}

class GetInvoicesSuccessState extends InvoicesStates {}

class GetInvoicesErrorState extends InvoicesStates {
  String error;

  GetInvoicesErrorState(this.error);
}

class PDFLoadingState extends InvoicesStates {}

class PDFSuccessState extends InvoicesStates {}

class PDFErrorState extends InvoicesStates {
  String error;

  PDFErrorState(this.error);
}

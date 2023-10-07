import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/endpointer.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/contact_states.dart';

class ContactCubit extends Cubit<ContactStates> {
  ContactCubit() : super(InitialContactStates());

  static ContactCubit get(context) => BlocProvider.of(context);
  bool checkbox = false;
  String returnMessage = '';
  //this function to change check box privacy Policy
  void changeCheckBox() {
    checkbox = !checkbox;
    emit(ChangeCheckboxContactStates());
  }

  //this function to submit contact
  void submitContact({
    required name,
    required email,
    required message,
  }) {
    emit(SubmitContactLoadingState());
    DioHelper.postData(
      url: SubmitContact,
      data: {
        "cname": name,
        "cemail": email,
        "cmessage": message,
      },
    ).then((value) {
      returnMessage = value.data[0]['validation_error_messages'];
        emit(SubmitContactSuccessState());
    }).catchError((error) {
      emit(SubmitContactErrorState(error.toString()));
    });
  }
}

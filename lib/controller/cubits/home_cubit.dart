import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/endpointer.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/home_states.dart';
import 'package:masmix/views/invoices_screen/invoices_screen.dart';
import 'package:masmix/views/my_packages_screen/my_packages_screen.dart';
import 'package:masmix/views/my_quotation_screen/my_quotation_screen.dart';
import 'package:masmix/views/my_storage_screen/my_storage_screen.dart';
import 'package:masmix/views/services_screen/services_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int page = 2;
  String titleScreen = '';
  List quotation = [];
  List package = [];
  List invoices = [];
  List myStorage = [];
  List mas4Me = [];
  List pendingPackage = [];
  List pendingStorage = [];
  List<bool> isShowStorage = [];
  List<bool> isShowQuotation = [];
  List<bool> isShowPackage = [];
  List<bool> isShowMas4Me = [];
  List<bool> isShowPendingStorage = [];
  List<bool> isShowPendingPackage = [];

  void changeIsShow({
    required value,
    required index,
    required type,
  }) {
    switch (type) {
      case 1:
        isShowStorage[index] = value;
        break;
      case 2:
        isShowPendingStorage[index] = value;
        break;
      case 3:
        isShowQuotation[index] = value;
        break;
      case 4:
        isShowPackage[index] = value;
        break;
      case 5:
        isShowPendingPackage[index] = value;
        break;
      case 6:
        isShowMas4Me[index] = value;
        break;
    }
    isShowStorage[index] = value;
    emit(ChangeIsShowState());
  }

  void changePageNumber(int index) {
    page = index;
    emit(ChangePageNumberState());
  }

  String returnTitle(index, context) {
    switch (index) {
      case 0:
        return AppLocalizations.of(context)!.titleInvoicesScreen;
      case 1:
        return 'My Quotation';
      case 2:
        return AppLocalizations.of(context)!.titleServicesScreen;
      case 3:
        return AppLocalizations.of(context)!.titleMyPackagesScreen;
      case 4:
        return AppLocalizations.of(context)!.titleMyStorageScreen;
    }
    return AppLocalizations.of(context)!.titleServicesScreen;
  }

  Widget screen(index, context) {
    switch (index) {
      case 0:
        return InvoicesScreen(invoices);
      case 1:
        return MyQuotationScreen(quotation, package);
      case 2:
        return const ServicesScreen();
      case 3:
        return const MyPackagesScreen();
      case 4:
        return const MyStorageScreen();
    }
    return const ServicesScreen();
  }

  void getInvoices({
    required id,
  }) {
    invoices = [];
    emit(GetInvoicesLoadingState());
    DioHelper.postData(
      url: GetInvoices,
      data: {"id": id},
    ).then((value) async {
      invoices = value.data;
      emit(GetInvoicesSuccessState());
    }).catchError((error) {
      emit(GetInvoicesErrorState(error.toString()));
    });
  }

  void getQuotations({
    required id,
  }) {
    quotation = [];
    emit(GetQuotationsLoadingState());
    DioHelper.postData(
      url: GetQuotations,
      data: {"UserId": id},
    ).then((value) {
      quotation = value.data;
      isShowQuotation = List<bool>.generate(quotation.length, (i) => false);
      emit(GetQuotationsSuccessState());
    }).catchError((error) {
      emit(GetQuotationsErrorState(error.toString()));
    });
  }

  void getPackages({
    required id,
  }) {
    package = [];
    pendingPackage = [];
    isShowPackage = [];
    isShowPendingPackage = [];
    emit(GetPackagesLoadingState());
    DioHelper.postData(
      url: GetPackages,
      data: {"UserId": id},
    ).then((value) {
      var list = value.data;
      for (var item in list) {
        if (item['status'].toInt == 3) {
          pendingPackage.add(item);
        } else {
          package.add(item);
        }
      }
      isShowPackage = List<bool>.generate(list.length, (i) => false);
      isShowPendingPackage = List<bool>.generate(list.length, (i) => false);
      emit(GetPackagesSuccessState());
    }).catchError((error) {
      emit(GetPackagesErrorState(error.toString()));
    });
  }

  void getMyStorage({
    required id,
  }) {
    myStorage = [];
    pendingStorage = [];
    isShowStorage = [];
    isShowPendingStorage = [];
    emit(GetMyStorageLoadingState());
    DioHelper.postData(
      url: GetMyStorage,
      data: {"UserId": id},
    ).then((value) {
      var list = value.data;
      for (var item in list) {
        if (item['status'].toInt == 3) {
          pendingStorage.add(item);
        } else {
          myStorage.add(item);
        }
      }
      isShowStorage = List<bool>.generate(list.length, (i) => false);
      isShowPendingStorage = List<bool>.generate(list.length, (i) => false);
      emit(GetMyStorageSuccessState());
    }).catchError((error) {
      emit(GetMyStorageErrorState(error.toString()));
    });
  }

  void getMas4Me({
    required currUserId,
  }) {
    mas4Me = [];
    emit(GetMas4meLoadingState());
    DioHelper.postData(
      url: getMas4me,
      data: {
        "curr_user_id": currUserId
      },
    ).then((value) {
      mas4Me = value.data;
      isShowMas4Me = List<bool>.generate(mas4Me.length, (i) => false);
      emit(GetMas4meSuccessState());
    }).catchError((error) {
      emit(GetMas4meErrorState(error.toString()));
    });
  }
}

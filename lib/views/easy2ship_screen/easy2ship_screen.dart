// ignore_for_file: must_be_immutable

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/easy2ship_cubit.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/share/components/card_easy2ship.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/states/easy2ship_states.dart';
import 'package:masmix/views/easy2ship_screen/show_price_package_screen.dart';
import 'easy2ship_details_screen.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EasyTowShipScreen extends StatelessWidget {
  const EasyTowShipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userDate = LoginCubit.get(context).loginModel;
    var easy2ShipCubit = Easy2ShipCubit.get(context)..getOrder(id: 51);
    return BlocConsumer<Easy2ShipCubit, Easy2ShipStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Easy2Ship'),
            centerTitle: true,
          ),
          endDrawer: defaultDrawer(context: context),
          body: state is GetOrderEasy2ShipLoadingStates
              ? const Center(child: CircularProgressIndicator())
              : easy2ShipCubit.easy2ShipOrder.isNotEmpty
                  ? SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => cardEasy2ShipOrder(
                            functionDetails: () {
                              easy2ShipCubit.getPackage(
                                orderId: easy2ShipCubit.easy2ShipOrder[index]
                                        ['order_id']
                                    .round(),
                                index: index,
                              );
                            },
                            easy2ShipOrder:
                                easy2ShipCubit.easy2ShipOrder[index],
                            iconExpendedOrder:
                                easy2ShipCubit.iconExpendedOrder[index],
                            isExpendedOrder: easy2ShipCubit.isShowOrder[index],
                            context: context,
                            index: index,
                            userId: userDate.id,
                            countryCode: userDate.invoiceCountryCode,
                            cityCode: userDate.invoiceCityCode,
                            zip: userDate.invoiceZipPostalCode,
                            voucherCode: userDate.voucherCode,
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          itemCount: easy2ShipCubit.easy2ShipOrder.length,
                        ),
                      ),
                    )
                  : isEmpty(context: context),
        );
      },
      listener: (context, state) {
        if (state is GetPackageDetailsEasy2ShipSuccessStates) {
          navigateto(context, const EasyTwoShipDetailsScreen());
        }
        if (state is CancelPackageEasy2ShipSuccessStates ||
            state is PrepareEasy2ShipSuccessStates
            ) {
          easy2ShipCubit.getOrder(id: userDate.id);
        }
        if (state is PrepareEasy2ShipErrorStates) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Error!',
              message: 'You Must Add Declared Value Before Prepare!',
              contentType: ContentType.failure,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
        if (state is ShowPricePackageEasy2ShipSuccessStates) {
          navigateto(context, const ShowPricePackageScreen());
        }
      },
    );
  }
}

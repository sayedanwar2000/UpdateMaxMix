// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/share/components/card_quotation.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/states/home_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyQuotationPending extends StatelessWidget {
  List quotation;

  MyQuotationPending(this.quotation, {super.key});

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.pendingBooking),
            centerTitle: true,
          ),
          endDrawer: defaultDrawer(context: context),
          body: quotation.isNotEmpty
              ? ListView.separated(
                  itemBuilder: (context, index) => Directionality(
                    textDirection: TextDirection.ltr,
                    child: cardQuotationPending(
                      quotation: quotation[index],
                      context: context,
                      functionDetails: () {
                        homeCubit.changeIsShow(
                          value: true,
                          index: index,
                          type: 3,
                        );
                      },
                      functionBack: () {
                        homeCubit.changeIsShow(
                          value: false,
                          index: index,
                          type: 3,
                        );
                      },
                      isShow: homeCubit.isShowQuotation[index],
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: quotation.length,
                )
              : isEmpty(context: context),
        );
      },
      listener: (context, state) {},
    );
  }
}

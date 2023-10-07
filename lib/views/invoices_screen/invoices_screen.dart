// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/share/components/card_invoice.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/states/home_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InvoicesScreen extends StatelessWidget {
  List invoicesList;

  InvoicesScreen(this.invoicesList, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (context, state) {
        return invoicesList.isNotEmpty
            ? ListView.separated(
                itemBuilder: (context, index) => Directionality(
                  textDirection: TextDirection.ltr,
                  child: cardInvoice(
                    invoice: invoicesList[index],
                    function: () {},
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: 10,
              )
            : isEmpty(context: context);
      },
      listener: (context, state) {},
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/referral_code_cubit.dart';
import 'package:masmix/controller/share/components/caed_customer_for_referral_code.dart';
import 'package:masmix/controller/share/components/card_referral_code_details.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/controller/states/referral_code_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewPeopleScreen extends StatelessWidget {
  const ViewPeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var referral = ReferralCodeCubit.get(context);
    return BlocConsumer<ReferralCodeCubit, ReferralCodeStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.people,
              style: TextStyle(
                color: defaultColorBlack,
              ),
            ),
            centerTitle: true,
          ),
          endDrawer: defaultDrawer(context: context),
          body: referral.showDetails
              ? referral.people.isNotEmpty
                  ? ListView.separated(
                      itemBuilder: (context, index) => Directionality(textDirection: TextDirection.ltr, child: cardReferralCodeDetails(
                        user: referral.people[index],
                      ),),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: referral.people.length,
                    )
                  : isEmpty(context: context,)
              : cardCustomerForReferralCode(
                  context: context,
                ),
        );
      },
      listener: (context, state) {},
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/cubits/referral_code_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/network/local/cache_helper/cache.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/controller/states/referral_code_states.dart';
import 'package:masmix/views/generate_referral_code/generate_referral_code.dart';
import 'package:masmix/views/referral_code_screen/view_people_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReferralCodeScreen extends StatelessWidget {
  const ReferralCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loginCubit = LoginCubit.get(context);
    var referral = ReferralCodeCubit.get(context)
      ..getCustomersForReferralCode(
          myReferralCode: loginCubit.loginModel.myReferralCode)
      ..getPeopleReferralCode(
          myReferralCode: loginCubit.loginModel.myReferralCode);
    TextEditingController referralCode = TextEditingController();
    referralCode.text = loginCubit.loginModel.myReferralCode!;
    String username = CacheHelper.getData(key: 'username') ?? '';
    String password = CacheHelper.getData(key: 'password') ?? '';
    return BlocConsumer<ReferralCodeCubit, ReferralCodeStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.titleReferralCodeScreen),
            centerTitle: true,
          ),
          endDrawer: defaultDrawer(context: context),
          body: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 10.0,
              end: 10.0,
            ),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 330,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0), //<-- SEE HERE
                        ),
                        child: Column(
                          children: [
                            Lottie.asset('asset/lottie/referral.json'),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                AppLocalizations.of(context)!.getCode,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            defaultButton(
                              text: AppLocalizations.of(context)!.goButton,
                              function: () {
                                generateReferralCode(
                                  context: context,
                                  referralCode: referralCode,
                                );
                              },
                              color: defaultColorNavyBlue,
                              width: 100,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 330,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0), //<-- SEE HERE
                        ),
                        child: Column(
                          children: [
                            Lottie.asset('asset/lottie/people.json',
                                height: 175),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                AppLocalizations.of(context)!.viewPeople,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            defaultButton(
                              text: AppLocalizations.of(context)!.goButton,
                              function: () {
                                referral.changeShowDetails(false);
                                navigateto(context, const ViewPeopleScreen());
                              },
                              color: defaultColorNavyBlue,
                              width: 100,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        loginCubit.userLogin(email: username, password: password);
        referralCode.text = loginCubit.loginModel.myReferralCode!;
      },
    );
  }
}

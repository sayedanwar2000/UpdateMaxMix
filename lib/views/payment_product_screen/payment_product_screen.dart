import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/share/components/card_quotation.dart';
import 'package:masmix/controller/share/components/card_storage.dart';
import 'package:masmix/controller/share/components/card_mas4me.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/states/home_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentProductScreen extends StatelessWidget {
  const PaymentProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var id = LoginCubit.get(context).loginModel.id;
    var homeCubit = HomeCubit.get(context)..getMas4Me(currUserId: id);
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.titlePaymentScreen),
            centerTitle: true,
          ),
          endDrawer: defaultDrawer(context: context),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Directionality(
                    textDirection: TextDirection.ltr,
                    child: cardStorage(
                      context: context,
                      storage: homeCubit.pendingStorage[index],
                      isShow: homeCubit.isShowPendingStorage[index],
                      functionDetails: () {
                        homeCubit.changeIsShow(
                          value: true,
                          index: index,
                          type: 2,
                        );
                      },
                      functionBack: () {
                        homeCubit.changeIsShow(
                          value: false,
                          index: index,
                          type: 2,
                        );
                      },
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: homeCubit.pendingStorage.length,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Directionality(
                    textDirection: TextDirection.ltr,
                    child: cardQuotationToPay(
                      package: homeCubit.pendingPackage[index],
                      context: context,
                      isPay: true,
                      functionDetails: () {
                        homeCubit.changeIsShow(
                          value: true,
                          index: index,
                          type: 5,
                        );
                      },
                      functionBack: () {
                        homeCubit.changeIsShow(
                          value: false,
                          index: index,
                          type: 5,
                        );
                      },
                      isShow: homeCubit.isShowPendingPackage,
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: homeCubit.pendingPackage.length,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Directionality(
                    textDirection: TextDirection.ltr,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 10.0,
                        end: 10.0,
                      ),
                      child: cardMas4me(
                        context: context,
                        mas4Me: homeCubit.mas4Me[index],
                        functionDetails: () {
                          homeCubit.changeIsShow(
                            value: true,
                            index: index,
                            type: 6,
                          );
                        },
                        functionBack: () {
                          homeCubit.changeIsShow(
                            value: false,
                            index: index,
                            type: 6,
                          );
                        },
                        isShow: homeCubit.isShowMas4Me[index],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: homeCubit.mas4Me.length,
                ),
                /*ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 10.0,
                  end: 10.0,
                ),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: defaultColorNavyBlue,
                    ),
                    borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Container(
                          width: 2.0,
                          height: 130.0,
                          color: defaultColorNavyBlue,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Service ID :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('DHL'),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                const AutoSizeText(
                                  'Service Name :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: const AutoSizeText(
                                    'Storage Service Service Service',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Service Status :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('67'),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Request Date :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('864.795'),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultButton(
                              text: 'Pay',
                              function: () {
                                navigateto(context, const FirstPaymentScreen());
                              },
                              color: defaultColorNavyBlue,
                              widt: 100,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            defaultButton(
                              text: 'Details',
                              function: () {
                                navigateto(
                                    context, const ViewDetailsStorageScreen());
                              },
                              color: defaultColorNavyBlue,
                              widt: 100,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: 10,
            ),*/
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

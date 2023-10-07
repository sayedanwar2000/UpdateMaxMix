// ignore_for_file: must_be_immutable

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/app_cubit.dart';
import 'package:masmix/controller/cubits/easy2ship_settings_cubit.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/cubits/my_account_cubit.dart';
import 'package:masmix/controller/share/components/card_address_easyed2ship.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:flag/flag.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/network/local/cache_helper/cache.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/controller/states/easy2ship_settings_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EASY2SHIPSettingsScreen extends StatelessWidget {
  EASY2SHIPSettingsScreen({super.key});

  String username = CacheHelper.getData(key: 'username') ?? '';
  String password = CacheHelper.getData(key: 'password') ?? '';

  @override
  Widget build(BuildContext context) {
    var easyCubit = Easy2shipSettingsCubit.get(context);
    var userModel = LoginCubit.get(context).loginModel;
    var loginCubit = LoginCubit.get(context);
    var appCubit = AppCubit.get(context);
    var myAccountCubit = MyAccountCubit.get(context);
    String country = appCubit.getCountryValue(userModel.invoiceCountryCode);
    easyCubit.changeGetNotifications(userModel.getNoti == 1 ? true : false);
    easyCubit.changeRemoveShoeBox(userModel.removeShoe == 1 ? true : false);
    easyCubit.changeNoImages(userModel.noImages == 1 ? true : false);
    easyCubit.changeAvailableWalletCredit(
        userModel.availableWallet == 1 ? true : false);
    return BlocConsumer<Easy2shipSettingsCubit, Easy2shipSettingsStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('EASY2SHIP Settings'),
            centerTitle: true,
          ),
          endDrawer: defaultDrawer(context: context),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: defaultColorNavyBlue,
                            ),
                            borderRadius:
                                BorderRadius.circular(20.0), //<-- SEE HERE
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.present_to_all,
                                size: 150,
                                color: defaultColorNavyBlue,
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                AppLocalizations.of(context)!.removeShoeBox,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Switch(
                                value: easyCubit.removeShoeBox,
                                activeColor: defaultColorNavyBlue,
                                onChanged: (value) {
                                  easyCubit.changeRemoveShoeBox(value);
                                },
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: defaultColorNavyBlue,
                            ),
                            borderRadius:
                                BorderRadius.circular(20.0), //<-- SEE HERE
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.hide_image,
                                size: 150,
                                color: defaultColorNavyBlue,
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                AppLocalizations.of(context)!.noImages,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Switch(
                                value: easyCubit.noImages,
                                activeColor: defaultColorNavyBlue,
                                onChanged: (value) {
                                  easyCubit.changeNoImages(value);
                                },
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: defaultColorNavyBlue,
                            ),
                            borderRadius:
                                BorderRadius.circular(20.0), //<-- SEE HERE
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20.0,
                              bottom: 20.0,
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  size: 150,
                                  color: defaultColorNavyBlue,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .getNotifications,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Switch(
                                  value: easyCubit.getNotifications,
                                  activeColor: defaultColorNavyBlue,
                                  onChanged: (value) {
                                    easyCubit.changeGetNotifications(value);
                                  },
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: defaultColorNavyBlue,
                            ),
                            borderRadius:
                                BorderRadius.circular(20.0), //<-- SEE HERE
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.account_balance_wallet,
                                  size: 150,
                                  color: defaultColorNavyBlue,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .availableWalletCredit,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Switch(
                                  value: easyCubit.availableWalletCredit,
                                  activeColor: defaultColorNavyBlue,
                                  onChanged: (value) {
                                    easyCubit
                                        .changeAvailableWalletCredit(value);
                                  },
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: defaultColorNavyBlue,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      20.0), //<-- SEE HERE
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flag.fromCode(
                                            FlagsCode.US,
                                            height: 30.0,
                                            width: 30.0,
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          const Text(
                                            'MY US SHIPPING ADDRESS',
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30.0,
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'Address :',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                            child: Text(
                                              '601 Cornell DRIVE, UNIT G6 , #165 WILMINGTON,DE 19801,USA',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: defaultColorNavyBlue,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      20.0), //<-- SEE HERE
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flag.fromCode(
                                            FlagsCode.SA,
                                            height: 30.0,
                                            width: 30.0,
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          const Text(
                                            'MY KSA SHIPPING ADDRESS',
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'Address :',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'طريق صلاح الدين الايوبي - الصفا - الرياض',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'Address :',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'مجد الدين - حي النهضة - الدمام',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'Address :',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'طريق الملك فيصل - الكورنيش الجنوبي - جدة',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: defaultColorNavyBlue,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      20.0), //<-- SEE HERE
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flag.fromString(
                                            easyCubit
                                                .getFlag(country.toLowerCase()),
                                            height: 30.0,
                                            width: 30.0,
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          const Text(
                                            'MY ADDRESS',
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        '${userModel.fName} ${userModel.lName}',
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        userModel.email!,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        userModel.invoiceAddress!,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        appCubit.cityIdList[
                                            userModel.invoiceCityCode!]!,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        country,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        '${userModel.mob}',
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  cardAddressEasy2Ship(
                                context: context,
                                address: myAccountCubit.myAddress[index]
                                    ['address'],
                                country: appCubit.getCountryValue(myAccountCubit
                                    .myAddress[index]['country_code']
                                    .round()),
                                city: appCubit.getCityValue(myAccountCubit
                                    .myAddress[index]['city_code']
                                    .round()),
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 20,
                              ),
                              itemCount: myAccountCubit.myAddress.length,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                      defaultButton(
                        width: double.infinity,
                        text: AppLocalizations.of(context)!.upDateButton,
                        function: () {
                          easyCubit.upDate(id: userModel.id);
                        },
                        color: defaultColorNavyBlue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is UpDateSuccessState) {
          loginCubit.userLogin(email: username, password: password);
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Oh Hey!!',
              message: easyCubit.message,
              contentType: ContentType.success,
              // to configure for material banner
              inMaterialBanner: true,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      },
    );
  }
}

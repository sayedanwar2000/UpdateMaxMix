import 'package:flutter/material.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/network/local/cache_helper/cache.dart';
import 'package:masmix/views/calculate_screen/calculate_screen.dart';
import 'package:masmix/views/contact_screen/contact_screen.dart';
import 'package:masmix/views/drawer_header/drawer_header.dart';
import 'package:masmix/views/easy2ship_settings_screen/easy2ship_settings_screen.dart';
import 'package:masmix/views/home_screen/home_screen.dart';
import 'package:masmix/views/how_to_use_screen/how_to_use_screen.dart';
import 'package:masmix/views/my_account_screen/my_account_screen.dart';
import 'package:masmix/views/payment_product_screen/payment_product_screen.dart';
import 'package:masmix/views/referral_code_screen/referral_code_screen.dart';
import 'package:masmix/views/welcome_screen/welcome.dart';
import 'package:masmix/controller/share/function_share/functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//this function to return menu
Widget defaultDrawer({
  required context,
}) {
  var homeCubit = HomeCubit.get(context);
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Directionality(textDirection: TextDirection.ltr, child: MyDrawerHeader(),),
        ListTile(
          leading: const Icon(Icons.person_outline_outlined),
          title: Text(AppLocalizations.of(context)!.titleProfileScreen),
          onTap: () {
            navigateto(context, MyAccountScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.code),
          title: Text(AppLocalizations.of(context)!.titleReferralCodeScreen),
          onTap: () {
            navigateto(context, const ReferralCodeScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.calculate_outlined),
          title: Text(AppLocalizations.of(context)!.titleCalculatorScreen),
          onTap: () {
            navigateto(context, CalculateScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.warehouse_outlined),
          title: Text(AppLocalizations.of(context)!.titleMyStorageScreen),
          onTap: () {
            homeCubit.changePageNumber(4);
            navigateto(context, HomeScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.dataset_outlined),
          title: const Text('My Quotation'),
          onTap: () {
            homeCubit.changePageNumber(1);
            navigateto(context, HomeScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.storage_outlined),
          title: Text(AppLocalizations.of(context)!.titleMyPackagesScreen),
          onTap: () {
            homeCubit.changePageNumber(3);
            navigateto(context, HomeScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.inventory_sharp),
          title: Text(AppLocalizations.of(context)!.titleInvoicesScreen),
          onTap: () {
            homeCubit.changePageNumber(0);
            navigateto(context, HomeScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.payments_outlined),
          title: Text(AppLocalizations.of(context)!.titlePaymentScreen),
          onTap: () {
            navigateto(context, const PaymentProductScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.data_usage_outlined),
          title: Text(AppLocalizations.of(context)!.titleHowToUseScreen),
          onTap: () {
            navigateto(context, const HowToUseScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.quiz_outlined),
          title: Text(AppLocalizations.of(context)!.titleFAQScreen),
          onTap: () {
            functionsShare.launchInBrowser(launchTo: 3);
          },
        ),
        ListTile(
          leading: const Icon(Icons.security),
          title: Text(AppLocalizations.of(context)!.privacyPolicy),
          onTap: () {
            functionsShare.launchInBrowser(launchTo: 1);
          },
        ),
        ListTile(
          leading: const Icon(Icons.gavel),
          title: Text(AppLocalizations.of(context)!.terms),
          onTap: () {
            functionsShare.launchInBrowser(launchTo: 2);
          },
        ),
        ListTile(
          leading: const Icon(Icons.support_agent),
          title: Text(AppLocalizations.of(context)!.titleContactScreen),
          onTap: () {
            navigateto(context, ContactScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title:  Text(AppLocalizations.of(context)!.titleSettingsScreen),
          onTap: () {
            navigateto(context, EASY2SHIPSettingsScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout_outlined),
          title: Text(AppLocalizations.of(context)!.logOut),
          onTap: () {
            CacheHelper.removeData(key: 'username');
            CacheHelper.removeData(key: 'userID');
            CacheHelper.removeData(key: 'password');
            navigateAndFinish(context, ShowScreen());
          },
        ),
      ],
    ),
  );
}
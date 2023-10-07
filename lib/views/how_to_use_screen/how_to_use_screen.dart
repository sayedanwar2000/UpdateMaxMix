import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/function_share/functions.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HowToUseScreen extends StatelessWidget {
  const HowToUseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.titleHowToUseScreen),
        centerTitle: true,
      ),
      endDrawer: defaultDrawer(context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 5.0,
            right: 5.0,
            top: 20.0,
            bottom: 20.0,
          ),
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
                          Lottie.asset('asset/lottie/air.json'),
                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultButton(
                            text: AppLocalizations.of(context)!.titleAirScreen,
                            function: () {
                              functionsShare.launchInBrowser(
                                  urlPath: 'https://masmix.com/Air_Services');
                            },
                            color: defaultColorNavyBlue,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
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
                          Lottie.asset('asset/lottie/land.json'),
                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultButton(
                            text: AppLocalizations.of(context)!.titleLandScreen,
                            function: () {
                              functionsShare.launchInBrowser(
                                  urlPath: 'https://masmix.com/land_Services');
                            },
                            color: defaultColorNavyBlue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
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
                      child: Column(
                        children: [
                          Lottie.asset(
                            'asset/lottie/shipp.json',
                            height: 170.0,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultButton(
                            text: AppLocalizations.of(context)!.titleSeaScreen,
                            function: () {
                              functionsShare.launchInBrowser(
                                  urlPath: 'https://masmix.com/sea_Services');
                            },
                            color: defaultColorNavyBlue,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
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
                          Lottie.asset(
                            'asset/lottie/easy.json',
                            height: 170,
                            width: 100,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultButton(
                            text: AppLocalizations.of(context)!.titleEasyScreen,
                            function: () {
                              functionsShare.launchInBrowser(
                                  urlPath:
                                      'https://masmix.com/consalidate_Services');
                            },
                            color: defaultColorNavyBlue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
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
                      child: Column(
                        children: [
                          Lottie.asset(
                              'asset/lottie/packaging-for-delivery.json',
                              height: 170,
                              width: 100),
                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultButton(
                            text: AppLocalizations.of(context)!.titleMasScreen,
                            function: () {
                              functionsShare.launchInBrowser(
                                urlPath: 'https://masmix.com/mas4me_Services',
                              );
                            },
                            color: defaultColorNavyBlue,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
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
                          Lottie.asset(
                            'asset/lottie/storage.json',
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultButton(
                            text: AppLocalizations.of(context)!
                                .titleStorageScreen,
                            function: () {
                              functionsShare.launchInBrowser(
                                  urlPath:
                                      'https://masmix.com/wharehouse_Services');
                            },
                            color: defaultColorNavyBlue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

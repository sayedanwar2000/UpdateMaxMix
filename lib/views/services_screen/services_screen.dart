import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/service_cubit.dart';
import 'package:masmix/controller/share/components/card_service.dart';
import 'package:masmix/controller/states/service_states.dart';
import 'package:masmix/views/air_service_screen/air_service_screen.dart';
import 'package:masmix/views/land_service_screen/land_service_screen.dart';
import 'package:masmix/views/sea_service_screen/sea_service_screen.dart';
import 'package:masmix/views/easy2ship_screen/easy2ship_screen.dart';
import 'package:masmix/views/storage_screen/storage_screen.dart';
import 'package:masmix/views/submit_mas4me/submit_mas4me_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceCubit, ServiceStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 30.0,
            bottom: 30.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                cardService(
                  context: context,
                  lottie: 'asset/lottie/easy.json',
                  title: AppLocalizations.of(context)!.titleEasyScreen,
                  contact: AppLocalizations.of(context)!.descriptionEasy,
                  goPage: EasyTowShipScreen(),
                  padding: 20.0,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                cardService(
                  context: context,
                  lottie: 'asset/lottie/packaging-for-delivery.json',
                  title: AppLocalizations.of(context)!.titleMasScreen,
                  contact: AppLocalizations.of(context)!.descriptionMas,
                  goPage: SubmitMas4MeScreen(),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                cardService(
                  context: context,
                  lottie: 'asset/lottie/air.json',
                  title: AppLocalizations.of(context)!.titleAirScreen,
                  contact: AppLocalizations.of(context)!.descriptionAir,
                  goPage: AirServiceScreen(),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                cardService(
                  context: context,
                  lottie: 'asset/lottie/land.json',
                  title: AppLocalizations.of(context)!.titleLandScreen,
                  contact: AppLocalizations.of(context)!.descriptionLand,
                  goPage: LandServiceScreen(),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                cardService(
                  context: context,
                  lottie: 'asset/lottie/ship.json',
                  title: AppLocalizations.of(context)!.titleSeaScreen,
                  contact: AppLocalizations.of(context)!.descriptionSea,
                  goPage: SeaServiceScreen(),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                cardService(
                  context: context,
                  lottie: 'asset/lottie/storage.json',
                  title: AppLocalizations.of(context)!.titleStorageScreen,
                  contact: AppLocalizations.of(context)!.descriptionStorage,
                  goPage: StorageScreen(),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {

      },
    );
  }
}

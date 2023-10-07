import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/easy2ship_cubit.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/share/components/card_easy2ship.dart';
import 'package:masmix/controller/states/easy2ship_states.dart';

class ShowPricePackageScreen extends StatelessWidget {
  const ShowPricePackageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var easyCubit = Easy2ShipCubit.get(context);
    var userId = LoginCubit.get(context).loginModel.id;
    bool isAdd = false;
    bool isRemove = false;
    return BlocConsumer<Easy2ShipCubit, Easy2ShipStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ShowPricePackage'),
            centerTitle: true,
          ),
          body: ListView.separated(
            itemBuilder: (context, index) => cardShowPriceEasy2Ship(
              context: context,
              order: easyCubit.showPricePackage[index],
              index: index,
              userId: userId,
              state: easyCubit.State,
              isAdd: isAdd,
              isRemove: isRemove,
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: easyCubit.showPricePackage.length,
          ),
        );
      },
      listener: (context, state) {
        if (state is Easy2ShipAddInsurancePackageSuccessStates) {
          isRemove = false;
          isAdd = true;
        }
        if (state is Easy2ShipRemoveInsurancePackageSuccessStates) {
          isRemove = true;
          isAdd = false;
        }
      },
    );
  }
}

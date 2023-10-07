import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/share/components/card_storage.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/states/home_states.dart';

class MyStorageScreen extends StatelessWidget {
  const MyStorageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return homeCubit.myStorage.isNotEmpty
            ? ListView.separated(
                itemBuilder: (context, index) => Directionality(
                  textDirection: TextDirection.ltr,
                  child: cardStorage(
                    context: context,
                    storage: homeCubit.myStorage[index],
                    isShow: homeCubit.isShowStorage[index],
                    functionBack: () {
                      homeCubit.changeIsShow(
                        value: false,
                        index: index,
                        type: 1,
                      );
                    },
                    functionDetails: () {
                      homeCubit.changeIsShow(
                        value: true,
                        index: index,
                        type: 1,
                      );
                    },
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: homeCubit.myStorage.length,
              )
            : isEmpty(context: context);
      },
    );
  }
}

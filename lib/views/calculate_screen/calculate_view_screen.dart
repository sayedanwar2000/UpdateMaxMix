import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:masmix/controller/cubits/calculate_cubit.dart';
import 'package:masmix/controller/share/components/card_calculate.dart';

class CalculateViewScreen extends StatelessWidget {
  const CalculateViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var calculateCubit = CalculateCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.titleCalculatorScreen),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.separated(
          itemBuilder: (context, index) => Directionality(
            textDirection: TextDirection.ltr,
            child: cardCalculate(
              calculate: calculateCubit.calculate[index],
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemCount: calculateCubit.calculate.length,
        ),
      ),
    );
  }
}

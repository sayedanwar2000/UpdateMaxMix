import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/controller/states/home_states.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
   HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    var userModel = LoginCubit.get(context).loginModel;
    var homeCubit = HomeCubit.get(context)
      ..getInvoices(id: userModel.id)
      ..getQuotations(id: userModel.id)
      ..getPackages(id: userModel.id)
      ..getMyStorage(id: userModel.id);
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          backgroundColor: defaultColorNavyBlue,
          appBar: AppBar(
            title: Text(
              homeCubit.returnTitle(homeCubit.page, context),
              style: TextStyle(
                color: defaultColorWhite,
              ),
            ),
            centerTitle: true,
            backgroundColor: defaultColorNavyBlue,
            leading: Image.asset(
              'asset/images/logo-removebg.png',
            ),
            iconTheme: IconThemeData(
              color: defaultColorWhite,
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: defaultColorNavyBlue,
              statusBarIconBrightness: Brightness.light,
            ),
          ),
          endDrawer: defaultDrawer(context: context),
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: homeCubit.page,
            height: 60.0,
            items:  <Widget>[
              Icon(
                Icons.inventory_sharp,
                size: 30,
                color: homeCubit.page==0 ? defaultColorWhite : defaultColorBlack,
              ),
              Icon(
                Icons.dataset_outlined,
                size: 30,
                color: homeCubit.page==1 ? defaultColorWhite : defaultColorBlack,
              ),
              Icon(
                Icons.dashboard,
                size: 30,
                color: homeCubit.page==2 ? defaultColorWhite : defaultColorBlack,
              ),
              Icon(
                Icons.storage,
                size: 30,
                color: homeCubit.page==3 ? defaultColorWhite : defaultColorBlack,
              ),
              Icon(
                Icons.warehouse,
                size: 30,
                color: homeCubit.page==4 ? defaultColorWhite : defaultColorBlack,
              ),
            ],
            color: defaultColorWhite,
            buttonBackgroundColor: defaultColorOrange,
            backgroundColor: defaultColorNavyBlue,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 600),
            onTap: (index) {
              homeCubit.changePageNumber(index);
            },
            letIndexChange: (index) => true,
          ),
          body: homeCubit.screen(homeCubit.page,context),
        );
      },
    );
  }
}

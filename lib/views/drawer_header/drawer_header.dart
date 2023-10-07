// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:masmix/controller/cubits/app_cubit.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/network/local/cache_helper/cache.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/views/home_screen/home_screen.dart';

class MyDrawerHeader extends StatelessWidget {
  String name = '';
  String phone = '';
  String email = '';
  String code = '';

  MyDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    var appCubit = AppCubit.get(context);
    email = cubit.loginModel.email.toString();
    name = '${cubit.loginModel.fName} ${cubit.loginModel.lName}';
    phone = '+${cubit.loginModel.phoneCountryCode} ${cubit.loginModel.mob}';
    code = cubit.loginModel.userCountryCode.toString();
    return Container(
      color: defaultColorNavyBlue,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40.0,
          right: 20.0,
          left: 20.0,
          bottom: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  color: defaultColorWhite,
                  onPressed: () {
                    navigateto(context, HomeScreen());
                  },
                  icon: const Icon(
                    Icons.home,
                  ),
                ),
                PopupMenuButton<String>(
                  // Callback that sets the selected popup menu item.
                  onSelected: (String item) {},
                  padding: const EdgeInsets.all(0),
                  icon: Icon(
                    Icons.language,
                    color: defaultColorWhite,
                  ),
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: "English",
                      child: InkWell(
                        onTap: () {
                          appCubit.changeAppLanguage('en');
                          CacheHelper.removeData(key: 'language');
                          CacheHelper.saveData(key: 'language', value: 'en');
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              "🇺🇸",
                              style: TextStyle(fontSize: 25),
                            ),
                            Text('English'),
                          ],
                        ),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: "English",
                      child: InkWell(
                        onTap: () {
                          appCubit.changeAppLanguage('ar');
                          CacheHelper.removeData(key: 'language');
                          CacheHelper.saveData(key: 'language', value: 'ar');
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              "🇸🇦",
                              style: TextStyle(fontSize: 25),
                            ),
                            Text("اَلْعَرَبِيَّةُ"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.notifications_outlined,
                  color: defaultColorWhite,
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              '$name\n'
              '$phone\n'
              '$email\n',
              style: TextStyle(
                color: defaultColorWhite,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

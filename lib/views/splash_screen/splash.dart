import 'dart:async';

import 'package:flutter/material.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/views/welcome_screen/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Timer(
        const Duration(seconds: 3),
            (){
          navigateAndFinish(context, ShowScreen());
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20,
          end: 20,
        ),
        child: Center(child: Image.asset('asset/images/logoname.png')),
      ),
    );
  }
}

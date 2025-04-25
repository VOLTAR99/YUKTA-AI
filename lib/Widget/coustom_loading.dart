import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
//import 'package:yukta_ai/Palates/color.dart';
import 'package:yukta_ai/helper/global.dart';
//import 'package:yukta_ai/screen/home_screen.dart';
//import 'package:yukta_ai/screen/home_screen.dart';
//import 'package:yukta_ai/helper/pref.dart';
import 'package:yukta_ai/screen/onboarding_screen.dart';

class CustomLoading extends StatefulWidget {
  const CustomLoading({super.key});

  @override
  State<CustomLoading> createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading> {


 @override
   void initState() {
     super.initState();
     Future.delayed(const Duration(seconds: 4), () {
       Navigator.of(
         context,
       ).pushReplacement(MaterialPageRoute(builder: (_) => OnboardingScreen(),),);
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Lottie.asset(
          'assets/lottie/loading.json',
          width: mq.width * .9,
          height: mq.height * .9,
        ),
      ),
    );
  }
}

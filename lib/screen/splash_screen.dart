import 'package:flutter/material.dart';
import 'package:yukta_ai/helper/global.dart';
import 'package:yukta_ai/widget/coustom_loading.dart';
import 'package:yukta_ai/palates/color.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
   void initState() {
     super.initState();
     Future.delayed(const Duration(seconds: 3), () {
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => CustomLoading(), ), );
     Get.off(() => CustomLoading(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);
     
     });
   }  

  @override
  Widget build(BuildContext context) {

    mq = MediaQuery.sizeOf(context);

    return Scaffold(
      
      body: Center(
        child: Container(
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(23), ),
            color: light2S,
            boxShadow: const[
              BoxShadow(
                color: Color.fromARGB(255, 255, 236, 201),
                blurRadius: 30,
                offset: Offset(-25, -25),
              ),
              BoxShadow(
                color: darkS,
                blurRadius: 30,
                offset: Offset(28, 28),
              ),
            ]
          ),
          child: Card(
            color: light2S,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20), ), ),
            margin: EdgeInsets.zero,
            child: Padding(
              padding: EdgeInsets.all(mq.width * .04),
              child: Image.asset('assets/images/y.png', width: mq.width * .45,),
            ), 
          ),
        ),
      ),
    );
  }
}
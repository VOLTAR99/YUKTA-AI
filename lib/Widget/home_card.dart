import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:yukta_ai/Palates/color.dart';
//import 'package:yukta_ai/Palates/color.dart';
import 'package:yukta_ai/helper/global.dart';
//import 'package:yukta_ai/main.dart';
import 'package:yukta_ai/model/home_type.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;

  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: homeType.onTap,
      child: SizedBox(
        height: mq.height * .16,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.only(bottom: mq.height * .02),
          color: lightS,
          child:
              homeType.leftAlign
                  ? Row(
                    children: [
                      Lottie.asset(
                        'assets/lottie/${homeType.lottie}',
                        height: mq.height * .2,
                        width: mq.width * .3,
                      ),
      
                      Spacer(),
      
                      Text(
                        homeType.title,
                        style: TextStyle(
                          fontFamily: 'PRregular',
                          fontSize: 20,
                          color: silverL,
                          letterSpacing: .5,
                        ),
                      ),
      
                      Spacer(flex: 2),
                    ],
                  )
                  : Row(
                    children: [
                      Spacer(flex: 2),
      
                      Text(
                        homeType.title,
                        style: TextStyle(
                          fontFamily: 'PRregular',
                          fontSize: 20,
                          color: silverL,
                          letterSpacing: .5,
                        ),
                      ),
      
                      Spacer(flex: 2),
      
                      Lottie.asset(
                        'assets/lottie/${homeType.lottie}',
                        height: mq.height * .2,
                        width: mq.width * .3,
                      ),
                    ],
                  ),
        ),
      ).animate().fade(duration: 2.seconds),
    );
  }
}

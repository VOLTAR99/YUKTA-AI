import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yukta_ai/Widget/custom_button.dart';
import 'package:yukta_ai/main.dart';
//import 'package:flutter/scheduler.dart';
import 'package:yukta_ai/screen/home_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:yukta_ai/helper/global.dart';
import 'package:yukta_ai/model/onboard.dart';
import 'package:yukta_ai/palates/color.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();
    final list = [
      //onboarding 1
      Onboard(
        title: 'Your personal AI assistant',
        subtitle:
            'Yukta AI is your personal AI assistant that helps you in your daily tasks and makes your life easier.',
        lottie: 'ai_assistant',
      ),

      //onboarding 2
      Onboard(
        title: 'Ask me anything',
        subtitle:
            'Ask me anything and I will try to help you with the best possible answer.',
        lottie: 'ask_me_anything',
      ),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).sColor,

      //using pageview.builder to create horizontal scrollable onboarding screens
      body: PageView.builder(
        controller: c,
        itemCount: list.length,
        itemBuilder: (ctx, idx) {
          final isLast = idx == list.length - 1;
          return Column(
            children: [
              Lottie.asset(
                'assets/lottie/${list[idx].lottie}.json',
                height: mq.height * .6,
                width: isLast ? mq.width * .7 : null,
              ),
              Text(
                list[idx].title,
                style: TextStyle(
                  fontFamily: "PSbold",
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  letterSpacing: .5,
                ),
              ),

              SizedBox(height: mq.height * .015),

              SizedBox(
                width: mq.width * .7,
                child: Text(
                  list[idx].subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "PSregular",
                    fontSize: 13.5,
                    fontWeight: FontWeight.w400,
                    letterSpacing: .5,
                    color: Theme.of(context).textColor,
                  ),
                ),
              ),

              Spacer(),

              //dots
              Wrap(
                spacing: 10,
                children: List.generate(
                  list.length,
                  (i) => Container(
                    width: i == idx ? 15 : 10,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: i == idx ? blackL : Colors.grey,
                    ),
                  ),
                ),
              ),

              Spacer(),

              CustomButton(
                onTap: () {
                  if (isLast) {
                    //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen(),),);
                    Get.off(
                      () => HomeScreen(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    c.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                text: isLast ? 'Lets Gooo!' : 'Next',
              ),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     shape: const StadiumBorder(),
              //     elevation: 2,
              //     minimumSize: Size(mq.width * 0.4, 55),
              //     backgroundColor: lightS,
              //     textStyle: TextStyle(
              //       fontFamily: "PSbold",
              //       fontSize: 20,
              //       fontWeight: FontWeight.w900,
              //       letterSpacing: .5,
              //     ),
              //   ),
              //   onPressed: OnTap,
              //   child: Text(text),
              // ),
              Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}

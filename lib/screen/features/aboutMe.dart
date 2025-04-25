import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yukta_ai/Palates/color.dart';
import 'package:yukta_ai/helper/global.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About the Developer!"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(color: light2S),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 60,
              left: 20,
              right: 20,
              bottom: 60,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  // ignore: deprecated_member_use
                  color: Colors.white.withOpacity(0.7),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 18,
                    left: 18,
                    top: 20,
                    bottom: 20,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              "assets/images/itsme.jpg",
                            ),
                          ),
                          SizedBox(height: mq.height * 0.02),
                          Text(
                            "Gaurav Kumar Biswas\n4th Year, Btech CSE, 2129651\nPlaced @SAP Labs India",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? silverL
                                      : silverL,
                            ),
                          ),
                          SizedBox(height: mq.height * 0.02),
                          SizedBox(
                            height: 300,
                            child: Text(
                              "Hi everyone! I'm Gaurav Kumar Biswas, a final-year B.Tech student at Chandigarh Group of College, Jhanjeri, originally from Kolkata. My expertise lies in Flutter, Dart, hybrid application development, database management, and REST APIs. Through my final-year project, I’ve ventured into AI, integrating chatbots, image generation, and translation. As a tech leader, I’ve built thriving communities over two years. Let’s connect to discuss AI, app development, and creating impactful tech solutions!",
                              style: TextStyle(
                                color:
                                    Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.black
                                        : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

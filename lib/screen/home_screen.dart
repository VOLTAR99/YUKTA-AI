import 'package:flutter/material.dart';
//import 'package:yukta_ai/Palates/color.dart';
import 'package:yukta_ai/Widget/home_card.dart';
//import 'package:yukta_ai/apis/apis.dart';
//import 'package:flutter/services.dart';
import 'package:yukta_ai/helper/global.dart';

//import 'package:yukta_ai/palates/color.dart';
//import 'package:yukta_ai/helper/pref.dart';
import 'package:yukta_ai/model/home_type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);

    //    APIs.getAnswer('hii');

    return Scaffold(
      //backgroundColor: darkS,
      appBar: AppBar(
        title: Text(
          appName,
          style: TextStyle(
            //color: silverL,
            //color: Theme.of(context).textColor,
            fontFamily: 'PRbold',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 10),
            icon: Icon(
              Icons.brightness_4_rounded,
              //color: silverL,
            ),
            onPressed: () {
              //light and dark mode
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: mq.width * .04,
          vertical: mq.height * .02,
        ),
        children: HomeType.values.map((e) => HomeCard(homeType: e)).toList(),
      ),
    );
  }
}

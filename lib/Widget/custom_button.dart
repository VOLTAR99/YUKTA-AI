import 'package:flutter/material.dart';
import 'package:yukta_ai/Palates/color.dart';
import 'package:yukta_ai/helper/global.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const CustomButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          elevation: 4,
          minimumSize: Size(mq.width * 0.4, 55),
          backgroundColor: lightS,
          textStyle: TextStyle(
            fontFamily: "PSbold",
            fontSize: 20,
            fontWeight: FontWeight.w900,
            letterSpacing: .5,
          ),
        ),
        onPressed:onTap ,
        child: Text(text, style: TextStyle(color: silverL)),
      ),
    );
  }
}

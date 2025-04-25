import 'package:flutter/material.dart';
import 'package:yukta_ai/Palates/color.dart';
//import 'package:yukta_ai/main.dart';
import 'package:yukta_ai/model/message.dart';
import 'package:yukta_ai/helper/global.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const r = Radius.circular(20);
    return message.msgType == MessageType.bot 
    //bot
    ? Row(children: [

      SizedBox(width: 6,),

      CircleAvatar(
        radius: 18,
        backgroundColor: lightS,
        child: Image.asset('assets/images/y.png', width: 24,),),

      Container(
        constraints: BoxConstraints(maxWidth: mq.width * 0.6),
        margin: EdgeInsets.only(bottom: mq.height*0.02, left: mq.width*0.02),
        padding: EdgeInsets.symmetric(vertical: mq.height*0.01, horizontal: mq.width*0.02),
        //bot card shape
        decoration: BoxDecoration(
          color: lightS,
          border: Border.all(color: blackL ),
          borderRadius: BorderRadius.only( bottomRight: r, topRight: r, topLeft: r),
        ),
        child: Text(message.msg, style: TextStyle(
          color: blackL,
        ),
        ),
      )
    ],) 
    
    //user
    : Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            

            Container(
              constraints: BoxConstraints(maxWidth: mq.width * 0.6),
              margin: EdgeInsets.only(
                bottom: mq.height * 0.02,
                right: mq.width * 0.02,
              ),
              padding: EdgeInsets.symmetric(
                vertical: mq.height * 0.01,
                horizontal: mq.width * 0.02,
              ),
              decoration: BoxDecoration(
                color: lightS,
                border: Border.all(color: blackL),
                borderRadius: BorderRadius.only(topLeft: r, topRight: r, bottomLeft: r),
              ),
              child: Text(message.msg),
            ),
            

            CircleAvatar(
              radius: 18,
              backgroundColor: lightS,
              child: Icon(Icons.person, color: darkS), 
            ),

            SizedBox(width: 6),
          ],
        );
  }
}
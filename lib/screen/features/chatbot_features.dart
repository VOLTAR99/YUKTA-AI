import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:yukta_ai/Widget/message_card.dart';
import 'package:yukta_ai/controller/chat_controller.dart';
import 'package:yukta_ai/helper/global.dart';
import 'package:yukta_ai/main.dart';
import 'package:yukta_ai/palates/color.dart';

class ChatbotFeature extends StatefulWidget {
  const ChatbotFeature({super.key});

  @override
  State<ChatbotFeature> createState() => _ChatbotFeatureState();
}

class _ChatbotFeatureState extends State<ChatbotFeature> {
  final _c = ChatController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text(
          'Chat with AI Assistant',
          style: TextStyle(
            
            fontFamily: 'PRbold',
            fontWeight: FontWeight.bold,
          ),
        ),
        
      ),
      backgroundColor: Theme.of(context).sColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _c.textC,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  fillColor: lightS,
                  filled: true,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  hintText: 'Type your message here...',
                ),
              ),
            ),

            const SizedBox(width: 8),

            CircleAvatar(
              backgroundColor: lightS,
              radius: 24,
              child: IconButton(
                onPressed: _c.askQuestion,
                icon: Icon(Icons.send, color: darkS),
              ),
            ),
          ],
        ),
      ),

      body: Obx(
        () => ListView(
          controller: _c.scrollC,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            top: mq.height * 0.02,
            bottom: mq.height * 0.1,
          ),
          children: _c.list.map((e) => MessageCard(message: e)).toList(),
        ),
      ),
    );
  }
}

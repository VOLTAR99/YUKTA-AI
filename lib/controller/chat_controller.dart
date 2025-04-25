import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yukta_ai/apis/apis.dart';
import 'package:yukta_ai/helper/my_dialog.dart';
import 'package:yukta_ai/model/message.dart';

class ChatController extends GetxController {
  final textC = TextEditingController();

  final scrollC = ScrollController();

  final list =
      <Message>[
        Message(
          msg: 'Hello, How can I help you today?',
          msgType: MessageType.bot,
        ),
      ].obs;

  Future<void> askQuestion() async {
    if (textC.text.trim().isNotEmpty) {
      //user
      list.add(Message(msg: textC.text, msgType: MessageType.user));
      list.add(Message(msg: 'Thinking...', msgType: MessageType.bot));
      _scrollDown();

      final res = await APIs.getAnswer(textC.text);

      //bot
      list.removeLast();
      list.add(Message(msg: res, msgType: MessageType.bot));
      _scrollDown();

      textC.text = '';
    } else {
      MyDialog.info('Please enter something to initiate chat...');
    }
  }

  // This method scrolls the ListView to the bottom when a new message is added.
  void _scrollDown() {
    scrollC.animateTo(
      scrollC.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}

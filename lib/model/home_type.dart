import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yukta_ai/screen/features/aboutMe.dart';
import 'package:yukta_ai/screen/features/chatbot_features.dart';
//import 'package:yukta_ai/screen/features/image_feature.dart';
import 'package:yukta_ai/screen/features/speech_to_text.dart';
import 'package:yukta_ai/screen/features/translator_feature.dart';
import 'package:yukta_ai/screen/image_feature_alternative.dart';  //only if image feature is not working


enum HomeType { aiChatBot, aiImage, aiTranslator, speecTotext, aboutMe }

extension MyHomeType on HomeType {
  String get title => switch (this) {
    HomeType.aiChatBot => 'AI ChatBot',
    HomeType.aiImage => 'AI Image Generator',
    HomeType.aiTranslator => 'AI Translator',
    HomeType.speecTotext => 'Speech to Text',
    HomeType.aboutMe => 'About the Developer'
  };

  String get lottie => switch (this) {
    HomeType.aiChatBot => 'chatbot.json',
    HomeType.aiImage => 'image_generator.json',
    HomeType.aiTranslator => 'translator.json',
    HomeType.speecTotext => 'speech_to_text.json',
    HomeType.aboutMe => 'aboutMe.json'
  };

  bool get leftAlign => switch (this) {
    HomeType.aiChatBot => true,
    HomeType.aiImage => false,
    HomeType.aiTranslator => true,
    HomeType.speecTotext => false,
    HomeType.aboutMe => true
    };
  
  EdgeInsets get padding => switch (this) {
    HomeType.aiChatBot => EdgeInsets.zero,
    HomeType.aiImage => EdgeInsets.all(20),
    HomeType.aiTranslator => EdgeInsets.zero,
    HomeType.speecTotext => EdgeInsets.all(20),
    HomeType.aboutMe => EdgeInsets.zero
  };

  VoidCallback get onTap => switch (this) {
    HomeType.aiChatBot => () => Get.to(() => ChatbotFeature()),
    HomeType.aiImage => () => Get.to(() => AiTextToImageGenerator()), 
    HomeType.aiTranslator => () => Get.to(() => TranslatorFeature()),
    HomeType.speecTotext => () => Get.to(() => SpeechToText()),
    HomeType.aboutMe => () => Get.to(() => AboutMe())
  };
}

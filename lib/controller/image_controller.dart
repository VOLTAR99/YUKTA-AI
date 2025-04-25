
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yukta_ai/apis/apis.dart';
import 'package:yukta_ai/helper/global.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:yukta_ai/helper/my_dialog.dart';
import 'dart:developer';

//import 'package:yukta_ai/apis/apis.dart';
//import 'package:yukta_ai/model/message.dart';
enum Status { none, loading, complete }

class ImageController extends GetxController {
  final textC = TextEditingController();

  final status = Status.none.obs;

  //dynamic image url
  final url = ''.obs;

  final imageList = <String>[].obs;

  Future<void> createAIImage() async {
    OpenAI.apiKey = apiKey;
    if (textC.text.trim().isNotEmpty) {
      status.value = Status.loading;
      OpenAIImageModel image = await OpenAI.instance.image.create(
        prompt: textC.text,
        n: 1,
        size: OpenAIImageSize.size512,
        responseFormat: OpenAIImageResponseFormat.url,
      );
      url.value = image.data[0].url.toString();

      textC.text = '';
      status.value = Status.complete;
    } else {
      MyDialog.info('Please enter a prompt to generate an image.');
    }
  }

  //image download
  void downloadImage() async {
    try {
      MyDialog.showLoadingDialog();
      log('url: $url');

      //
      final bytes = (await get(Uri.parse(url.value))).bodyBytes;
      final directory = await getTemporaryDirectory();
      final file = await File(
        '${directory.path}/ai_image.png',
      ).writeAsBytes(bytes);
      log('filepath: ${file.path}');

      //
      await GallerySaver.saveImage(file.path, albumName: appName).then((
        success,
      ) {
        Get.back();
        MyDialog.success('Image saved to gallery!');
      });
    } catch (e) {
      Get.back();
      MyDialog.error('Failed to save image to gallery!');
      log('downloadImage: $e');
    }
  }

  //image share
  void shareImage() async {
    try {
      MyDialog.showLoadingDialog();
      log('url: $url');

      //
      final bytes = (await get(Uri.parse(url.value))).bodyBytes;
      final directory = await getTemporaryDirectory();
      final file = await File(
        '${directory.path}/ai_image.png',
      ).writeAsBytes(bytes);
      log('filepath: ${file.path}');

      //
      await Share.shareXFiles([
        XFile(file.path),
      ], text: 'Check out this AI-generated image!');
    } catch (e) {
      Get.back();
      MyDialog.error('Failed to save image to gallery!');
      log('downloadImage: $e');
    }
  }

  Future<void> searchAiImage() async {
    if (textC.text.trim().isNotEmpty) {
      status.value = Status.loading;
      imageList.value = await APIs.searchAiImages(textC.text);

      if (imageList.isEmpty) {
        MyDialog.error('Something went wrong! (Try again later)');
        return;
      }

      url.value = imageList.first;
      status.value = Status.complete;
    } else {
      MyDialog.info('Please enter a prompt to search for images.');
    }
  }
}

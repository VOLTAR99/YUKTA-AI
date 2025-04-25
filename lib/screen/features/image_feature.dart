import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:yukta_ai/Palates/color.dart';
import 'package:yukta_ai/controller/image_controller.dart';
import 'package:yukta_ai/helper/global.dart';
//import 'package:yukta_ai/main.dart';
import 'package:yukta_ai/widget/custom_button.dart';

class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
  final _c = ImageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).sColor,
      appBar: AppBar(
        title: Text(
          'AI Image Generator',
          style: TextStyle(
            //color: Theme.of(context).textColor,
            fontFamily: 'PRbold',
            fontWeight: FontWeight.bold,
          ),
        ),

        //share button
        actions: [
          Obx(
            () =>
                _c.status.value == Status.complete
                    ? IconButton(
                      padding: EdgeInsets.only(right: 6),
                      onPressed: _c.shareImage,
                      icon: Icon(Icons.share),
                    )
                    : SizedBox(),
          ),
        ],
      ),

      //download button
      floatingActionButton: Obx(
        () =>
            _c.status.value == Status.complete
                ? Padding(
                  padding: EdgeInsets.only(right: 6, bottom: 6),
                  child: FloatingActionButton(
                    onPressed: _c.downloadImage,
                    backgroundColor: lightS,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Icon(
                      Icons.download_rounded,
                      size: 26,
                      color: silverL,
                    ),
                  ),
                )
                : SizedBox(),
      ),

      body: ListView(
        //controller: _c.scrollC,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: mq.height * 0.02,
          bottom: mq.height * 0.1,
          left: mq.width * 0.04,
          right: mq.width * 0.04,
        ),
        children: [
          TextField(
            controller: _c.textC,
            minLines: 2,
            maxLines: null,
            onTapOutside: (e) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              fillColor: lightS,
              filled: true,
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              hintText:
                  'Imagine something winderful & inovative\nType here & I will create it for you...',
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),

          Container(
            height: mq.height * 0.5,
            margin: EdgeInsets.symmetric(vertical: mq.height * 0.015),
            alignment: Alignment.center,
            child: Obx(() => _aiImage()),
          ),

          Obx(
            () =>
                _c.imageList.isEmpty
                    ? SizedBox()
                    : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(bottom: mq.height * 0.03),
                      physics: BouncingScrollPhysics(),
                      child: Wrap(
                        spacing: 10,
                        children:
                            _c.imageList
                                .map(
                                  (e) => InkWell(
                                    onTap: () {
                                      _c.url.value = e;
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: e,
                                        height: 100,
                                        errorWidget:
                                            (context, url, error) => SizedBox(),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                    ),
          ),
          CustomButton(onTap: _c.searchAiImage, text: 'Create'),
        ],
      ),
    );
  }

  Widget _aiImage() => ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    child: switch (_c.status.value) {
      Status.none => Lottie.asset(
        'assets/lottie/image_generator.json',
        height: mq.height * 0.5,
      ),
      Status.complete => CachedNetworkImage(
        imageUrl: _c.url.value,
        placeholder:
            (context, url) => Lottie.asset(
              'assets/lottie/loading.json',
              width: mq.width * .9,
              height: mq.height * .9,
            ), //CircularProgressIndicator(),
        errorWidget: (context, url, error) => SizedBox(),
      ),
      Status.loading => Lottie.asset(
        'assets/lottie/loading.json',
        width: mq.width * .9,
        height: mq.height * .9,
      ),
    },
  );
}

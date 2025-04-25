import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:yukta_ai/Palates/color.dart';
import 'package:yukta_ai/Widget/custom_button.dart';
import 'package:yukta_ai/Widget/language_sheet.dart';
import 'package:yukta_ai/controller/image_controller.dart';
import 'package:yukta_ai/controller/translate_controller.dart';
import 'package:yukta_ai/helper/global.dart';
//import 'package:yukta_ai/main.dart';

class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({super.key});

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
  final _c = TranslateController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).sColor,
      appBar: AppBar(
        //backgroundColor: Theme.of(context).primaryColor,
        title: Text('AI Translator'),
      ),

      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: mq.height * 0.02,
          bottom: mq.height * 0.1,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(c: _c, s: _c.from)),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Container(
                  height: 50,
                  width: mq.width * 0.4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: lightS,
                    border: Border.all(color: silverL),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Obx(
                    () => Text(
                      _c.from.isEmpty ? 'Auto' : _c.from.value,
                      style: TextStyle(color: silverL),
                    ),
                  ),
                ),
              ),

              Obx(
                () => IconButton(
                  onPressed: _c.swapLanguages,
                  icon: Icon(
                    CupertinoIcons.repeat,
                    color:
                        _c.to.isNotEmpty && _c.from.isNotEmpty
                            ? darksapG
                            : silverL,
                    size: 20,
                  ),
                ),
              ),

              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(c: _c, s: _c.to)),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Container(
                  height: 50,
                  width: mq.width * 0.4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: lightS,
                    border: Border.all(color: silverL),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Obx(
                    () => Text(
                      _c.to.isEmpty ? 'To' : _c.to.value,
                      style: TextStyle(color: silverL),
                    ),
                  ),
                ),
              ),
            ],
          ),

          //text field
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mq.width * 0.04,
              vertical: mq.height * 0.035,
            ),
            child: TextField(
              controller: _c.textC,
              minLines: 5,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                fillColor: lightS,
                filled: true,
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: 'Translate any text to any language....',
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ),

          //result text field
          Obx(() => _translateResult()),

          SizedBox(height: mq.height * 0.04),
          CustomButton(
            onTap: _c.googleTranslate,
            //_c.translate,
            text: 'Translate',
          ),
        ],
      ),
    );
  }

  Widget _translateResult() => switch (_c.status.value) {
    Status.none => SizedBox(),
    Status.complete => Padding(
      padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
      child: TextField(
        controller: _c.resultC,
        maxLines: null,
        onTapOutside: (e) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          fillColor: lightS,
          filled: true,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    ),
    Status.loading => Align(
      alignment: Alignment.topCenter,
      heightFactor: 0.01,
      child: Lottie.asset(
        'assets/lottie/translator.json',
        width: mq.width * .9,
        height: mq.height * .9,
      ),
    ),
  };
}

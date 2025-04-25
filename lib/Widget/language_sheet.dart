import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:yukta_ai/controller/translate_controller.dart';
import 'package:yukta_ai/helper/global.dart';
//import 'package:yukta_ai/main.dart';
import 'package:yukta_ai/palates/color.dart';

class LanguageSheet extends StatefulWidget {
  final TranslateController c;
  final RxString s;

  const LanguageSheet({super.key, required this.c, required this.s});

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  final _search = ''.obs;


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(
        left: mq.width * 0.04,
        right: mq.width * 0.04,
        top: mq.height * 0.02,
      ),
      height: mq.height * .5,
      decoration: BoxDecoration(
        color: light2S,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          TextFormField(
            //controller: _c.resultC,
            onChanged: (s) => _search.value = s.toLowerCase(),
            onTapOutside: (e) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.translate_rounded, color: silverL),
              fillColor: lightS,
              filled: true,
              isDense: true,
              hintText: 'Search Language',
              hintStyle: TextStyle(fontSize: 13.5, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),

          Expanded(
            child: Obx(() {
              final List<String> list =
                  _search.isEmpty
                      ? widget.c.lang
                      : widget.c.lang
                          .where((e) => e.toLowerCase().contains(_search.value))
                          .toList();
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: list.length,
                padding: EdgeInsets.only(
                  top: mq.height * 0.02,
                  bottom: mq.height * 0.02,
                  left: mq.width * 0.02,
                ),
                itemBuilder: (ctx, i) {
                  return InkWell(
                    onTap: () {
                      widget.s.value = list[i];
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: mq.height * 0.02),
                      child: Text(
                        list[i],
                        style: TextStyle(color: silverL, fontSize: 14),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

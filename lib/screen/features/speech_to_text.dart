import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:yukta_ai/Widget/custom_button.dart';
import 'package:yukta_ai/palates/color.dart';

class SpeechToText extends StatefulWidget {
  const SpeechToText({super.key});

  @override
  State<SpeechToText> createState() => _SpeechtextState();
}

class _SpeechtextState extends State<SpeechToText> {
  bool isListening = false;
  late stt.SpeechToText _speechToText;
  String text = "Press the mic button & start speaking........";
  double confidence = 1.0;
  @override
  void initState() {
    _speechToText = stt.SpeechToText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // confidence value is in the range of 0-1, now we make it in the range of 1-100
        title: Text("Confidence:${(confidence * 100).toStringAsFixed(1)}%"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: isListening,
        glowColor: darkS,
        duration: const Duration(milliseconds: 1000),
        repeat: true,
        child: FloatingActionButton(
          backgroundColor: isListening ? Colors.green : lightS,
          onPressed: _catureVoice,
          child: Icon(
            isListening ? Icons.mic : Icons.mic_none,
            size: 30,
            color: blackL,
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text(text, style: TextStyle(fontSize: 30, color: silverL)),
              // now we have add copy text button
              const SizedBox(height: 20),
              Center(
                child: 
                CustomButton(onTap: () {
                    Clipboard.setData(ClipboardData(text: text));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Successfully copied text")),
                    );
                  }, text: 'Copy Text')
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _catureVoice() async {
    if (!isListening) {
      bool listen = await _speechToText.initialize();
      if (listen) {
        setState(() => isListening = true);
        _speechToText.listen(
          onResult:
              (result) => setState(() {
                text = result.recognizedWords;
                if (result.hasConfidenceRating && result.confidence > 0) {
                  confidence = result.confidence;
                }
              }),
        );
      }
    } else {
      setState(() => isListening = false);
      _speechToText.stop();
    }
  }
}

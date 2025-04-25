import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stability_image_generation/stability_image_generation.dart';
import 'package:yukta_ai/Palates/color.dart';
import 'package:yukta_ai/Widget/custom_button.dart';
import 'package:yukta_ai/helper/global.dart';


//Stabality AI
class AiTextToImageGenerator extends StatefulWidget {
  const AiTextToImageGenerator({super.key});
  @override
  State<AiTextToImageGenerator> createState() => _AiTextToImageGeneratorState();
}

class _AiTextToImageGeneratorState extends State<AiTextToImageGenerator> {
  // Controller for the input field
  final TextEditingController _queryController = TextEditingController();
  // Instance of StabilityAI for image generation
  final StabilityAI _ai = StabilityAI();
  // API key for the AI service
  final String apiKey = 'YOUR_API_KEY';
  // Set the style for the generated image
  final ImageAIStyle imageAIStyle = ImageAIStyle.digitalPainting;
  // Flag to check if images have been generated
  bool isItems = false;

  // Function to generate an image based on the input query
  Future<Uint8List> _generate(String query) async {
    Uint8List image = await _ai.generateImage(
      apiKey: apiKey, // API key
      imageAIStyle: imageAIStyle, // Style for the image
      prompt: query, // The text prompt input by the user
    );
    return image; // Return the generated image as bytes
  }

  // Dispose method to clean up the controller when the widget is removed from the tree
  @override
  void dispose() {
    _queryController.dispose(); // Dispose of the controller
    super.dispose(); // Call the super class dispose method
  }

  @override
  Widget build(BuildContext context) {
    // Build the UI of the widget
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("AI Image Generator"),
        centerTitle: true,
        backgroundColor: lightS,
      ),
      backgroundColor: light2S,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 55,
                margin: const EdgeInsets.all(10),
                child: TextField(
                  controller:
                      _queryController, // Link the text field to the controller
                  decoration: const InputDecoration(
                    fillColor: lightS,
                    filled: true,
        
                    hintText: 'Enter your prompt',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    contentPadding: EdgeInsets.only(left: 15, top: 5),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child:
                    isItems // Check if images have been generated
                        ? FutureBuilder<Uint8List>(
                          future: _generate(
                            _queryController.text,
                          ), // Call the generate function
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              // Show loading indicator while waiting for the image
                              return Center(
                                child: Lottie.asset(
                                  'assets/lottie/loading.json',
                                  width: mq.width * .5,
                                  height: mq.height * .5,
                                ),
                              );
                            } else if (snapshot.hasData) {
                              // If data is received, display the generated image
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.memory(
                                  snapshot.data!,
                                ), // Display the image from memory
                              );
                            } else {
                              return Container(); // Return an empty container if no data
                            }
                          },
                        )
                        : Center(
                          child: Lottie.asset(
                            'assets/lottie/image_generator.json',
                            height: mq.height * 0.5,
                          ),
                        ),
              ),
              CustomButton(
                onTap: () {
                  String query = _queryController.text; // Get the input text
                  if (query.isNotEmpty) {
                    setState(() {
                      isItems =
                          true; // Set the flag to indicate images are being generated
                    });
                  } else {
                    // Log a message if the query is empty
                    if (kDebugMode) {
                      print('Query is empty !!');
                    }
                  }
                },
                text: 'Generate Image',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

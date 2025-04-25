// import 'dart:developer'; // For log()

// import 'package:appwrite/appwrite.dart';

// class AppWrite {
//   static final Client _client = Client();
//   static final _databases = Databases(_client);

//   static void init() {
//     _client
//         .setEndpoint('https://localhost/v1') // Your Appwrite Endpoint
//         .setProject('67ed5685000784be1cac') // Your project ID
//         .setSelfSigned(status: true);
//     getApiKey();
//   }

//   static Future<String> getApiKey() async {
//     try {
//       final d = await _databases.getDocument(
//         databaseId: 'YuktaAIDatabase',
//         collectionId: 'apikey',
//         documentId: 'chatGPTkey',
//       );

//       log(d.data.toString());
//       return d.data['apiKey'];
//     } catch (e) {
//       log('$e');
//       return '';
//     }
//   }
// }

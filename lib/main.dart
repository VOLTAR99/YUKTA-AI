import 'package:flutter/material.dart';
//import 'package:yukta_ai/apis/appwrite.dart';
import 'package:yukta_ai/palates/color.dart';
import 'package:yukta_ai/screen/splash_screen.dart';
//import 'package:hive/hive.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:yukta_ai/helper/pref.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:yukta_ai/helper/global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Pref.initialize();

  //for appwrite
  //AppWrite.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,

      themeMode: ThemeMode.light,

      // //dark
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   appBarTheme: AppBarTheme(
      //     backgroundColor: Theme.of(context).appbar,
      //     elevation: 1,
      //     //iconTheme: IconThemeData(color: Colors.white),
      //     centerTitle: true,
      //     titleTextStyle: TextStyle(
      //       //color: silverL,
      //       fontSize: 20,
      //       fontFamily: 'PRregular',
      //       letterSpacing: 1,
      //       fontWeight: FontWeight.w500,
      //     ),
      //   ),
      //   //scaffoldBackgroundColor: darkS,
      //   fontFamily: 'PRregular',
      // ),

      //light
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: lightS,
          elevation: 1,
          iconTheme: IconThemeData(color: silverL),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: silverL,
            fontSize: 20,
            fontFamily: 'PRregular',
            letterSpacing: 1,
            fontWeight: FontWeight.w500,
          ),
        ),
        scaffoldBackgroundColor: light2S,
        fontFamily: 'PRregular',
        //useMaterial3: false
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

extension AppTheme on ThemeData {
  Color get appbar => brightness == Brightness.dark ? Colors.black : darkS;
  Color get sColor => brightness == Brightness.dark ? blackL : light2S;
  Color get textColor => brightness == Brightness.dark ? Colors.white : blackL;
  Color get iconColor => brightness == Brightness.dark ? Colors.white : light2S;
  Color get cardColor => brightness == Brightness.dark ? darkS : lightS;
}

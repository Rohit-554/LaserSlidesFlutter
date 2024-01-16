import 'package:flutter/material.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/pages/home/EditButtonConfig.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/pages/splashScreen/SplashScreen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dinjection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Container(
        child:  SplashScreen(),
      ),

    );
  }
}


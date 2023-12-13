import 'package:flutter/material.dart';
import 'package:todo/models/task_models.dart';
import 'package:todo/screens/onBoarding_screen/onBoarding_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
await Hive.openBox('Tasks');
Hive.registerAdapter(TaskModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp

  ({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
      theme : ThemeData(
          brightness: Brightness.dark
      ),
    );
  }
}
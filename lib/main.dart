import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/cubit/add_task_cubit/add_task_cubit.dart';
import 'package:todo/models/task_models.dart';
import 'package:todo/screens/onBoarding_screen/onBoarding_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/simple_bloc_observer/simple_bloc_obsever.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
 Bloc.observer= SimpleBlocObsever();
  Hive.registerAdapter(TaskModelAdapter());
await Hive.openBox(kTasksBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp

  ({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> AddTaskCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoardingScreen(),
        theme : ThemeData(
            brightness: Brightness.dark
        ),
      ),
    );
  }
}
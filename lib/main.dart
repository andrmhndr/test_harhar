import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:test_harhar/bloc/quiz/quiz_cubit.dart';
import 'package:test_harhar/screen/gameplay_screen.dart';
import 'package:test_harhar/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuizCubit(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        home: HomeScreen(),
        // initialRoute: '/home', // Set the initial route to the main menu
        // routes: {
        //   '/home': (context) => HomeScreen(), // Define the main menu screen
        //   '/gameplay': (context) =>
        //       GameplayScreen(), // Define the gameplay screen
        // },
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }


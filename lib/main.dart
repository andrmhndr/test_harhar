import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_harhar/bloc/quiz/quiz_cubit.dart';

void main() {
  runApp(const ProvidersInit());
}

class ProvidersInit extends StatelessWidget {
  const ProvidersInit({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuizCubit(),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('test'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                      child: Text(state.quiz[state.count]
                          .filteredMainAnswer(state.charCollect))),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.quiz[state.count].questions.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.quiz[state.count].questions[index],
                          ),
                          Text(
                            state.quiz[state.count].answers[index],
                          )
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (value) {
                      context.read<QuizCubit>().updateCharCollect(value);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<QuizCubit>().nextQuiz();
                      },
                      child: Text('next ${state.charCollect}'))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

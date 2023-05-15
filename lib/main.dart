import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
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
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    context.read<QuizCubit>().startAnswers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('test'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: state.quiz[state.count].mainAnswer.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Text(state
                                .answerController[state.charCollect.indexWhere(
                                    (element) =>
                                        element ==
                                        state.quiz[state.count]
                                            .mainAnswer[index])]
                                .value
                                .text),
                            Text(state.quiz[state.count]
                                .order(
                                    state.quiz[state.count].mainAnswer[index])
                                .toString())
                          ],
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 20,
                              childAspectRatio: 2 / 4,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.quiz[state.count].questions.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  state.quiz[state.count].questions[index],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, charIndex) {
                                      print(state.charCollect.indexWhere(
                                          (element) =>
                                              element ==
                                              state.quiz[state.count]
                                                  .answers[index][charIndex]));
                                      return SizedBox(
                                        width: 20,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            counter: Offstage(),
                                          ),
                                          maxLength: 1,
                                          textAlign: TextAlign.center,
                                          controller: state.answerController[
                                              state.charCollect.indexWhere(
                                                  (element) =>
                                                      element ==
                                                      state.quiz[state.count]
                                                              .answers[index]
                                                          [charIndex])],
                                          onChanged: (value) {
                                            if (value != '') {
                                              context.read<QuizCubit>().setAnswer(
                                                  answerIndex: state.charCollect
                                                      .indexWhere((element) =>
                                                          element ==
                                                          state
                                                                  .quiz[state.count]
                                                                  .answers[index]
                                                              [charIndex]),
                                                  answer: value);
                                            }
                                          },
                                        ),
                                      );
                                      // Text(
                                      //   state.quiz[state.count].answers[index]
                                      //       [charIndex],
                                      // );
                                    },
                                    itemCount: state.quiz[state.count]
                                        .answers[index].runes.length,
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        width: 5,
                                      );
                                    },
                                  ),
                                ),
                              )
                              // Text(
                              //   state.quiz[state.count].answers[index],
                              // )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 5,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    // maxLength: 1,
                    onChanged: (value) {
                      context.read<QuizCubit>().updateCharCollect(value);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  onPressed: () {
                    context.read<QuizCubit>().nextQuiz();
                  },
                  child: Text('next')),
            ),
          );
        },
      ),
    );
  }
}

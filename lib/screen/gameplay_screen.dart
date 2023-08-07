
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_harhar/bloc/quiz/quiz_cubit.dart';

class GameplayScreen extends StatefulWidget {
  @override
  State<GameplayScreen> createState() => _GameplayScreenState();
}



class _GameplayScreenState extends State<GameplayScreen> {
  @override
  void initState() {
    context.read<QuizCubit>().startAnswers();
    super.initState();
  }

  static const maxSecond = 0;
  int seconds = maxSecond;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds > -1) {
        setState(() => seconds++);
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      seconds = 0;
    });
  }

  String words = "";

  int hehehe = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          String combWords = state.answerController
              .map((controller) => controller.text)
              .join();
          String combMainAnswr = state.charCollect.join().replaceAll(' ', '');

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Time : $seconds'),
            ),
            body: Container(
              decoration: const BoxDecoration(color: Colors.lightBlue),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),

                    //Main Answer
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(width: 5, color: Colors.black45),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: state.quiz[state.count].mainAnswer.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            color: Colors.white12,
                            child: Column(
                              children: [
                                //Main Answer's Word
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      state
                                          .answerController[state.charCollect
                                              .indexWhere((element) =>
                                                  element ==
                                                  state.quiz[state.count]
                                                      .mainAnswer[index])]
                                          .value
                                          .text,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                //Main Answer's Index
                                Expanded(
                                  flex: 4,
                                  child: state.quiz[state.count]
                                              .mainAnswer[index] !=
                                          " "
                                      ? Text(state.quiz[state.count]
                                          .order(state.quiz[state.count]
                                              .mainAnswer[index])
                                          .toString())
                                      : Text(" "),
                                )
                              ],
                            ),
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
                      height: 5,
                    ),
                    //Translate
                    combMainAnswr == combWords
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(color: Colors.indigo),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Text(state
                                    .quiz[state.count].mainAnswerTranslate, textAlign: TextAlign.center,),
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 10,
                          ),

                    const SizedBox(
                      height: 5,
                    ),

                    //Quiz
                    Expanded(
                      flex: 3,
                      child: ListView.separated(
                        itemCount: state.quiz[state.count].questions.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.amber,
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Questions
                                Flexible(
                                  child: SizedBox(
                                    height: 60,
                                    child: Text(
                                        state
                                            .quiz[state.count].questions[index],
                                        style: const TextStyle(fontSize: 18)),
                                  ),
                                ),

                                //Answers
                                Expanded(
                                  child: Container(
                                    // margin: EdgeInsets.all(20),
                                    alignment: Alignment.centerRight,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, charIndex) {
                                        // print(state.charCollect);
                                        // // print(String.Join(""), state.charCollect);
                                        // print(
                                        //     state.quiz[state.count].mainAnswer);
                                        // print(state
                                        //     .quiz[state.count].mainAnswer[2]);
                                        // // List<String> CombWords = state.answerController[state.charCollect];
                                        // print((state
                                        //     .answerController[12].value.text));

                                        print(combWords);
                                        print(combMainAnswr);
                                        // // print(state.answerController);
                                        // print(state.count);
                                        // print(state.quiz.length);
                                        final controller =
                                            state.answerController[state
                                                .charCollect
                                                .indexWhere((element) =>
                                                    element ==
                                                    state.quiz[state.count]
                                                            .answers[index]
                                                        [charIndex])];
                                        return Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white),
                                          width: 20,
                                          child: Column(
                                            children: [
                                              //Answer's Word
                                              SizedBox(
                                                height: 40,
                                                child: TextField(
                                                  decoration:
                                                      const InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            3, 0, 0, 15),
                                                    counter: Offstage(),
                                                  ),
                                                  // maxLength: 1,
                                                  textAlign: TextAlign.center,
                                                  controller: controller,
                                                  onTap: () {
                                                    controller.selection =
                                                        TextSelection
                                                            .fromPosition(
                                                      TextPosition(
                                                          offset: controller
                                                              .text.length),
                                                    );
                                                  },

                                                  // On Change Event
                                                  onChanged: (value) {
                                                    // if (value != '') {
                                                    // controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length),);
                                                    context.read<QuizCubit>().setAnswer(
                                                        answerIndex: state
                                                            .charCollect
                                                            .indexWhere((element) =>
                                                                element ==
                                                                state
                                                                        .quiz[state
                                                                            .count]
                                                                        .answers[index]
                                                                    [
                                                                    charIndex]),
                                                        answer: value != ''
                                                            ? String
                                                                .fromCharCode(
                                                                    value.runes
                                                                        .last)
                                                            : '');
                                                    // }
                                                  },
                                                ),
                                              ),

                                              //Answer's Indeex
                                              Text(
                                                  '${state.quiz[state.count].order(state.quiz[state.count].answerToList(index)[charIndex])}'
                                                  // state.quiz[state.count].answerToList(index)[charIndex]
                                                  )
                                            ],
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
                                        return const SizedBox(
                                          width: 5,
                                        );
                                      },
                                    ),
                                  ),
                                ),

                                // Text(
                                //   state.quiz[state.count].answers[index],
                                // )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 5,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (combMainAnswr == combWords)
                  Padding(
                    padding: EdgeInsets.all(8),
                    child:
                        ElevatedButton(onPressed: () {}, child: Text('Clear')),
                  ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<QuizCubit>().nextQuiz();
                      },
                      child: const Text('next')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      startTimer();
                    },
                    child: Text('Start'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      stopTimer();
                    },
                    child: Text('Stop'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      resetTimer();
                    },
                    child: Text('Reset'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        // Navigator.popAndPushNamed(context, '/home');
                        Get.back();
                      },
                      child: Text('Back')),
                )
              ],
            ),
          );
        },
      
    );
  }
}
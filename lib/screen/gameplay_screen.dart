import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:test_harhar/app_assets.dart';
import 'package:test_harhar/bloc/quiz/quiz_cubit.dart';
import 'package:test_harhar/screen/game_end_screen.dart';

class GameplayScreen extends StatefulWidget {
  @override
  State<GameplayScreen> createState() => _GameplayScreenState();
}

class _GameplayScreenState extends State<GameplayScreen> {
  @override
  void initState() {
    // context.read<QuizCubit>().stopAudio();
    context.read<QuizCubit>().playLoopAudio(appAssets.quizbgSound);
    context.read<QuizCubit>().startAnswers();
    super.initState();
    // context.read<QuizCubit>().playLoopAudio(appAssets.quizbgSound);
    // context.read<QuizCubit>().playBackgroundMusic();
  }

  static const maxSecond = 0;
  int seconds = maxSecond;
  Timer? timer;
  final gameplayPlayer = AudioPlayer();
  final typePlayer = AudioPlayer();
  final lvlClearPlayer = AudioPlayer();

  void dispose() {
    context.read<QuizCubit>().clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (context, state) {
        if (state.combMainAnswr == state.combWords) {}
      },
      builder: (context, state) {
        print('Level: ' + state.count.toString());
        print('Jumlah Level: ' + state.quiz.length.toString());
        print('CharCollect: ' + state.charCollect.toString());
        print('combWords: ' + state.combWords);
        print('combMainAnswr: ' + state.combMainAnswr);
        print('answrController Text: ' +
            state.answerController
                .map((controller) => controller.text)
                .toString());
        print('mainAnswer: ' + state.quiz[state.count].mainAnswer);

        if (state.combMainAnswr == state.combWords) {
          context.read<QuizCubit>().playAudio(appAssets.lvlClearSound);
        }

        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(appAssets.yellowPaper), fit: BoxFit.cover),
            ),
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
                      color: Color(0xff534b52),
                      border: Border.all(width: 5, color: Colors.black45),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: state.quiz[state.count].mainAnswer.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(1),
                          color: Color(0xfff1f0ea),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Main Answer's Word
                              Expanded(
                                flex: 4,
                                child: Text(
                                  state
                                      .answerController[state.charCollect
                                          .indexWhere((element) =>
                                              element ==
                                              state.quiz[state.count]
                                                  .mainAnswer[index])]
                                      .value
                                      .text,
                                  style: const TextStyle(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              //Main Answer's Index
                              Expanded(
                                flex: 4,
                                child: state.quiz[state.count]
                                            .mainAnswer[index] !=
                                        " "
                                    ? Text(
                                        state.quiz[state.count]
                                            .order(state.quiz[state.count]
                                                .mainAnswer[index])
                                            .toString(),
                                        style: const TextStyle(fontSize: 12),
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    : const Text(" "),
                              ),
                            ],
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 20,
                        childAspectRatio: 4 / 7,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 10,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),

                  //Translate
                  state.combMainAnswr == state.combWords
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Color(0xfff1f0ea),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    state.quiz[state.count].mainAnswerTranslate,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 211, 211, 207),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      context.read<QuizCubit>().nextQuiz();
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.lightBlue[700]),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 26, vertical: 14),
                                      child: Text(
                                        'Next Level',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(
                          height: 1,
                        ),

                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.grey[800]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          state.quiz[state.count].instruction,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 2,
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
                            color: Color(0xeffe0ddcf),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 70,
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
                                    state.quiz[state.count].questions[index],
                                    style: GoogleFonts.roboto(fontSize: 14),
                                  ),
                                ),
                              ),

                              //Answers
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, charIndex) {
                                      final controller = state.answerController[
                                          state.charCollect.indexWhere(
                                        (element) =>
                                            element ==
                                            state.quiz[state.count]
                                                .answers[index][charIndex],
                                      )];

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
                                              height: 35,
                                              child: TextField(
                                                decoration:
                                                    const InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          3, 0, 0, 15),
                                                  counter: Offstage(),
                                                  labelStyle:
                                                      TextStyle(fontSize: 13),
                                                ),
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
                                                  context.read<QuizCubit>().setAnswer(
                                                      answerIndex: state
                                                          .charCollect
                                                          .indexWhere((element) =>
                                                              element ==
                                                              state
                                                                      .quiz[state
                                                                          .count]
                                                                      .answers[index]
                                                                  [charIndex]),
                                                      answer: value != ''
                                                          ? String.fromCharCode(
                                                                  value.runes
                                                                      .last)
                                                              .toLowerCase()
                                                          : '');
                                                  if (value.isNotEmpty) {
                                                    FocusScope.of(context)
                                                        .nextFocus();
                                                  }

                                                  print(value);
                                                  print(state.quiz[state.count]
                                                      .answers[index]);
                                                },
                                              ),
                                            ),

                                            //Answer's Index
                                            Text(
                                              '${state.quiz[state.count].order(state.quiz[state.count].answerToList(index)[charIndex])}',
                                              style: const TextStyle(
                                                fontSize: 10,
                                              ),
                                            )
                                          ],
                                        ),
                                      );
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
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
          // bottomNavigationBar: Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     if (state.combMainAnswr == state.combWords)
          //       Padding(
          //         padding: EdgeInsets.all(8),
          //         child: ElevatedButton(
          //             onPressed: () {
          //               context.read<QuizCubit>().stopAudio();
          //               // context.read<QuizCubit>().stopAudio();
          //               context.read<QuizCubit>().nextQuiz();
          //             },
          //             child: Text('Clear')),
          //       ),
          //     Padding(
          //       padding: EdgeInsets.all(8),
          //       child: ElevatedButton(
          //           onPressed: () async {
          //             context.read<QuizCubit>().nextQuiz();
          //           },
          //           child: const Text('next')),
          //     ),
          //     // Padding(
          //     //   padding: const EdgeInsets.all(8.0),
          //     //   child: ElevatedButton(
          //     //     onPressed: () {
          //     //       startTimer();
          //     //     },
          //     //     child: Text('Start'),
          //     //   ),
          //     // ),
          //     // Padding(
          //     //   padding: EdgeInsets.all(8),
          //     //   child: ElevatedButton(
          //     //     onPressed: () {
          //     //       stopTimer();
          //     //     },
          //     //     child: Text('Stop'),
          //     //   ),
          //     // ),
          //     // Padding(
          //     //   padding: const EdgeInsets.all(8.0),
          //     //   child: ElevatedButton(
          //     //     onPressed: () {
          //     //       resetTimer();
          //     //     },
          //     //     child: Text('Reset'),
          //     //   ),
          //     // ),
          //     Padding(
          //       padding: EdgeInsets.all(8.0),
          //       child: ElevatedButton(
          //           onPressed: () {
          //             // Navigator.popAndPushNamed(context, '/home');
          //             Get.back();
          //           },
          //           child: Text('Back')),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.all(8),
          //       child: ElevatedButton(
          //           onPressed: () {
          //             context
          //                 .read<QuizCubit>()
          //                 .playLoopAudio(appAssets.quizbgSound);
          //           },
          //           child: Text('Song')),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.all(8),
          //       child: ElevatedButton(
          //           onPressed: () {
          //             context.read<QuizCubit>().stopAudio();
          //           },
          //           child: Text('Stop')),
          //     )
          //   ],
          // ),
        );
      },
    );
  }
}

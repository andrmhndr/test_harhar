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

  final List<FocusNode> _focusNode = List.generate(50, (index) => FocusNode());

  void moveToNext(int index) {
    final nextIndex = index + 1;
    final nextFocusNode = _focusNode[nextIndex];

    FocusScope.of(context).requestFocus(nextFocusNode);
  }

  String words = "";

  int hehehe = 0;

  void dispose() {
    context.read<QuizCubit>().clear();
    // context.read<QuizCubit>().audioDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (context, state) {
        if (state.combMainAnswr == state.combWords) {
          // context.read<QuizCubit>().playLoopAudio(appAssets.quizbgSound);
          // context.read<QuizCubit>().stopAudio();
          // context.read<QuizCubit>().playAudio(appAssets.lvlClearSound);
        }
      },
      builder: (context, state) {
        print(state.count);
        print(state.quiz.length);
        

        if (state.combMainAnswr == state.combWords) {
          context.read<QuizCubit>().playAudio(appAssets.lvlClearSound);
          // context.read<QuizCubit>().showAlert(context, 'NICE!');
          // context.read<QuizCubit>().alertDialog(context);
        }

        return Scaffold(
          // appBar: AppBar(
          //   centerTitle: true,
          //   title: Text('Time : $seconds'),
          // ),
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
                          // decoration: BoxDecoration(color: Colors.amber),
                          padding: EdgeInsets.all(2),
                          // height: MediaQuery.of(context).size.height * 0.08,
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
                                  style: const TextStyle(fontSize: 18),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              //Main Answer's Index
                              Expanded(
                                flex: 4,
                                child:
                                    state.quiz[state.count].mainAnswer[index] !=
                                            " "
                                        ? Text(
                                            state.quiz[state.count]
                                                .order(state.quiz[state.count]
                                                    .mainAnswer[index])
                                                .toString(),
                                            style: TextStyle(fontSize: 15),
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        : Text(" "),
                              ),
                            ],
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 25,
                              childAspectRatio: 4 / 9,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //Translate
                  state.combMainAnswr == state.combWords
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: Color(0xfff1f0ea)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                state.quiz[state.count].mainAnswerTranslate,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 10,
                        ),

                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.lightBlueAccent),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
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
                            color: Color(0xeffe0ddcf),
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
                                    state.quiz[state.count].questions[index],
                                    style: GoogleFonts.roboto(fontSize: 18),
                                  ),
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
                                      print(state.charCollect);

                                      final controller = state.answerController[
                                          state.charCollect.indexWhere(
                                              (element) =>
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
                                                // focusNode: _focusNode[state.quiz[state.count].answers[index][charIndex]],
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
                                                  // context
                                                  //     .read<QuizCubit>()
                                                  //     .playAudio(
                                                  //         appAssets.typeSound);
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
                                                                  [charIndex]),
                                                      answer: value != ''
                                                          ? String.fromCharCode(
                                                                  value.runes
                                                                      .last)
                                                              .toLowerCase()
                                                          : '');
                                                  // }
                                                  // moveToNext(state.quiz[state.count].answers[index][charIndex]);
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
              if (state.combMainAnswr == state.combWords)
                Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<QuizCubit>().stopAudio();
                        // context.read<QuizCubit>().stopAudio();
                        context.read<QuizCubit>().nextQuiz();
                      },
                      child: Text('Clear')),
                ),
              Padding(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                    onPressed: () async {
                        context.read<QuizCubit>().nextQuiz();
                    },
                    child: const Text('next')),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       startTimer();
              //     },
              //     child: Text('Start'),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.all(8),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       stopTimer();
              //     },
              //     child: Text('Stop'),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       resetTimer();
              //     },
              //     child: Text('Reset'),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      // Navigator.popAndPushNamed(context, '/home');
                      Get.back();
                    },
                    child: Text('Back')),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<QuizCubit>()
                          .playLoopAudio(appAssets.quizbgSound);
                    },
                    child: Text('Song')),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                    onPressed: () {
                      context.read<QuizCubit>().stopAudio();
                    },
                    child: Text('Stop')),
              )
            ],
          ),
        );
      },
    );
  }
}

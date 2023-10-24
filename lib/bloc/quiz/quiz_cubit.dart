import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:test_harhar/models/quiz.dart';
import 'package:test_harhar/repository/quiz_data.dart';
import 'package:test_harhar/screen/game_end_screen.dart';
import 'package:test_harhar/screen/gameplay_screen.dart';
import 'package:test_harhar/app_assets.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizState.initial());

  void nextQuiz() {
    // stopAudio();
    // audioDispose();

    // state.answerController.clear();
    clear();
    if (state.count + 1 > state.quiz.length - 1) {
      stopAudio();
      // emit(state.copyWith(count: 0));
      Get.back();
      // emit(QuizState.initial());
      Get.to(() => GameEndSCreen());
    } else {
      // replayAuido();
      // playLoopAudio(appAssets.quizbgSound);
      emit(
        state.copyWith(
            count: (state.count + 1 > state.quiz.length - 1)
                ? 0
                : state.count + 1),
      );
      // playBackgroundMusic();
      // playAudio(appAssets.quizbgSound);

      startAnswers();
      // playLoopAudio(appAssets.quizbgSound);
    }
  }

  void clear() {
    state.charCollect.clear();
    for (TextEditingController controller in state.answerController) {
      controller.clear();
    }
  }

  void startGame() {
    playAudio(appAssets.clickSound);

    // playLoopAudio(appAssets.quizbgSound);
    stopAudio();

    // Navigate to the gameplay screen when the button is pressed
    // Navigator.popAndPushNamed(context, '/gameplay');
    Get.to(() => GameplayScreen());
    emit(QuizState.initial());
  }

  void updateCharCollect(String value) {
    List<String> newCharCollect = value.runes.fold(
      [],
      (previousValue, char) {
        var chars = previousValue;
        if (!previousValue.contains(
          String.fromCharCode(char),
        )) {
          chars.add(
            String.fromCharCode(char),
          );
        }
        return chars;
      },
    );

    emit(state.copyWith(charCollect: newCharCollect));
  }

  void startAnswers() {
    List<String> charCollect =
        state.quiz[state.count].mainAnswer.characters.fold(
      [],
      (previousValue, char) {
        var chars = previousValue;
        if (!previousValue.contains(char)) {
          chars.add(char);
        }
        return chars;
      },
    );
    emit(
      state.copyWith(
        charCollect: charCollect,
      ),
    );
    // List<String> answers = [];
    // for (var element in state.quiz[state.count].answers) {
    //   String text = '';
    //   for (var count = 0; count < element.length; count++) {
    //     text = text + '-';
    //   }
    //   answers.add(text);
    // }
    // emit(state.copyWith(answers: answers));
  }

  void setAnswer({
    // required int questionIndex,
    required int answerIndex,
    required String answer,
  }) {
    // String text = state.answers[questionIndex];
    // text =
    //     text.substring(0, answerIndex) + answer + text.substring(answerIndex);
    // var answerList = state.answers;
    // answerList[questionIndex] = text;
    // emit(state.copyWith(answers: answerList));
    var controller = TextEditingController(text: answer);
    List<TextEditingController> controllerList =
        List.from(state.answerController);
    controllerList[answerIndex] = controller;
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );

    emit(
      state.copyWith(answerController: controllerList),
    );
  }

  bool isPlaying = false;

  void playAudio(String audioUrl) async {
    await state.audioPlayer.setAsset(audioUrl);
    await state.audioPlayer.play();
  }

  void playLoopAudio(String audioUrl) async {
    await state.loopAudioPlayer.setAsset(audioUrl);
    await state.loopAudioPlayer.setLoopMode(LoopMode.one);
    await state.loopAudioPlayer.play();
    // isPlaying = true;
  }

  void alertDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('LEVEL CLEAR!'),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('NICE!'),
            )
          ],
        );
      },
    );
  }

  void showAlert(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          // content: Text(message),
          actions: <Widget>[
            MaterialButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  void stopAudio() {
    state.loopAudioPlayer.stop();
    // isPlaying = false;
  }

  void stopMainAudio() {
    state.audioPlayer.pause();
  }

  void replayAuido() {
    state.loopAudioPlayer.seek(Duration.zero);
  }

  void playBackgroundMusic() {
    playLoopAudio(appAssets.quizbgSound);
    // isPlaying = true;
  }

  void playMenuMusic() {
    playAudio(appAssets.mainMenuBgScreen);
  }

  void audioDispose() {
    state.loopAudioPlayer.dispose();
  }
}

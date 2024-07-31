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

  Future<void> nextQuiz() async {
    clear();
    if (state.count + 1 == state.quiz.length) {
      stopAudio();
      Get.to(() => const GameEndSCreen());
      emit(QuizState.initial());
    } else {
      
      emit(
        state.copyWith(
            count: (state.count + 1 > state.quiz.length - 1)
                ? 0
                : state.count + 1),
      );
    }
    startAnswers();
  }

  Future<void> clear() async {
    state.charCollect.clear();
    for (TextEditingController controller in state.answerController) {
      controller.clear();
    }
  }

  void startGame() {
    playAudio(appAssets.clickSound);

    playLoopAudio(appAssets.quizbgSound);
    
    Get.to(() => GameplayScreen());
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
  }

  void setAnswer({
    required int answerIndex,
    required String answer,
  }) 
  {
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

  Future playLoopAudio(String audioUrl) async {
    try {
      await state.loopAudioPlayer.setAsset(audioUrl);
      await state.loopAudioPlayer.setLoopMode(LoopMode.all);
      await state.loopAudioPlayer.play();
    } catch (e) {
      print("Error: $e");
    }
  
  }

  Future<void> stopAudio() async {
    await state.loopAudioPlayer.stop();
  }

  void stopMainAudio() {
    state.audioPlayer.pause();
  }

  void replayAuido() {
    state.loopAudioPlayer.seek(Duration.zero);
  }

  void playBackgroundMusic() {
    playLoopAudio(appAssets.quizbgSound);
  }

  void playMenuMusic() {
    playAudio(appAssets.mainMenuBgScreen);
  }

  void pauseAudio() {
    state.loopAudioPlayer.pause();
  }

  void audioDispose() {
    state.loopAudioPlayer.dispose();
  }
}

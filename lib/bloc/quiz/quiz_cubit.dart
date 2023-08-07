import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test_harhar/models/quiz.dart';
import 'package:test_harhar/repository/quiz_data.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizState.initial());

  void nextQuiz() {
    clear();
    emit(
      state.copyWith(
          count:
              (state.count + 1 > state.quiz.length - 1) ? 0 : state.count + 1),
    );
    startAnswers();
  }

  void clear(){ 
    for (TextEditingController controller in state.answerController) {
      controller.clear();
      
    }
    
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
}

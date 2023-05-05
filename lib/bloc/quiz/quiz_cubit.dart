import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_harhar/models/quiz.dart';
import 'package:test_harhar/repository/quiz_data.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizState.initial());

  void nextQuiz() {
    emit(state.copyWith(
        count:
            (state.count + 1 > state.quiz.length - 1) ? 0 : state.count + 1));
  }

  void updateCharCollect(String value) {
    List<String> newCharCollect = value.runes.fold([], (previousValue, char) {
      var chars = previousValue;
      if (!previousValue.contains(String.fromCharCode(char))) {
        chars.add(String.fromCharCode(char));
      }
      return chars;
    });

    print(value);
    // value.runes.forEach((char) {
    //   if (!state.charCollect.contains(String.fromCharCode(char))) {
    //     newCharCollect.add('${String.fromCharCode(char)}');
    //   }
    // });

    emit(state.copyWith(charCollect: newCharCollect));
  }
}

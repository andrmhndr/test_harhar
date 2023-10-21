import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Quiz extends Equatable {
  final String mainAnswer;
  final String mainAnswerTranslate;
  final String instruction;
  final List<String> questions;
  final List<String> answers;

  const Quiz({
    required this.mainAnswer,
    required this.mainAnswerTranslate,
    required this.instruction,
    required this.questions,
    required this.answers,
  });

  List<String> answerToList(int answerIndex) {
    return answers[answerIndex].runes.fold(
      [],
      (previousValue, element) {
        previousValue.add(
          String.fromCharCode(element),
        );
        return previousValue;
      },
    );
  }

  //Get Unique Word From Main Answer Data
  List<String> get unique {
    return mainAnswer.runes.fold(
      [],
      (previousValue, char) {
        List<String> chars = previousValue;
        if (!chars.contains(
          String.fromCharCode(char),
        )) {
          chars.add(
            String.fromCharCode(char),
          );
        }
        return chars;
      },
    );
  }

  //Set Number Below Main Answer
  int order(String char) {
    return unique.indexWhere((element) => element == char) + 1;
  }

  
  String filteredMainAnswer(List<TextEditingController> answerController) {
    // answerController.fold(initialValue, (previousValue, element) => null)
    return mainAnswer.runes.fold(
      '',
      (previousValue, char) {
        String text = previousValue;
        if (answerController.contains(
          String.fromCharCode(char),
        )) {
          text = text + String.fromCharCode(char);
        } else {
          text = '$text-';
        }
        return text;
      },
    );
  }

  @override
  List<Object?> get props => [
        mainAnswer,
        mainAnswerTranslate,
        questions,
        answers,
      ];
}

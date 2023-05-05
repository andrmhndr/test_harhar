import 'package:equatable/equatable.dart';

class Quiz extends Equatable {
  final String mainAnswer;
  final List<String> questions;
  final List<String> answers;

  const Quiz({
    required this.mainAnswer,
    required this.questions,
    required this.answers,
  });

  String filteredMainAnswer(List<String> charCollect) {
    print(charCollect);
    return mainAnswer.runes.fold('', (previousValue, char) {
      String text = previousValue;
      if (charCollect.contains(String.fromCharCode(char))) {
        text = text + String.fromCharCode(char);
      } else {
        text = text + '-';
      }
      return text;
    });
  }

  @override
  List<Object?> get props => [
        mainAnswer,
        questions,
        answers,
      ];
}

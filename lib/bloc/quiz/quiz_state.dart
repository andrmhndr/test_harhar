part of 'quiz_cubit.dart';

class QuizState extends Equatable {
  final List<String> charCollect;
  final List<Quiz> quiz;
  final int count;

  QuizState({
    required this.quiz,
    this.count = 0,
    this.charCollect = const <String>[],
  });

  factory QuizState.initial() {
    return QuizState(
      quiz: QuizData.datas,
    );
  }

  @override
  List<Object> get props => [
        quiz,
        count,
        charCollect,
      ];

  QuizState copyWith({
    List<Quiz>? quiz,
    int? count,
    List<String>? charCollect,
  }) {
    return QuizState(
      quiz: quiz ?? this.quiz,
      count: count ?? this.count,
      charCollect: charCollect ?? this.charCollect,
    );
  }
}

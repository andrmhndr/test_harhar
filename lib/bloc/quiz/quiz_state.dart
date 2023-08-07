part of 'quiz_cubit.dart';

class QuizState extends Equatable {
  final List<String> charCollect;
  final List<Quiz> quiz;
  final int count;
  final List<TextEditingController> answerController;

  const QuizState({
    required this.quiz,
    this.count = 0,
    this.charCollect = const <String>[],
    this.answerController = const <TextEditingController>[],
  });

  factory QuizState.initial() {
    return QuizState(
      quiz: QuizData.datas,
      answerController: List.generate(
        50,
        (index) => TextEditingController(),
      ),
    );
  }

  @override
  List<Object> get props => [
        quiz,
        count,
        charCollect,
        answerController,
      ];

  QuizState copyWith({
    List<Quiz>? quiz,
    int? count,
    List<String>? charCollect,
    List<TextEditingController>? answerController,
  }) {
    return QuizState(
      quiz: quiz ?? this.quiz,
      count: count ?? this.count,
      charCollect: charCollect ?? this.charCollect,
      answerController: answerController ?? this.answerController,
    );
  }
}

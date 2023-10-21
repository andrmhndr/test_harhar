part of 'quiz_cubit.dart';

class QuizState extends Equatable {
  final List<String> charCollect;
  final List<Quiz> quiz;
  final int count;
  final List<TextEditingController> answerController;
  final AudioPlayer audioPlayer;
  final AudioPlayer loopAudioPlayer;
  final bool isLoading;

  const QuizState({
    required this.quiz,
    required this.count,
    required this.charCollect,
    required this.answerController,
    required this.audioPlayer,
    required this.loopAudioPlayer,
    required this.isLoading,
  });

  factory QuizState.initial() {
    return QuizState(
      quiz: QuizData.datas,
      count: 0,
      charCollect: const <String>[],
      answerController: List.generate(
        50,
        (index) => TextEditingController(),
      ),
      audioPlayer: AudioPlayer(),
      loopAudioPlayer: AudioPlayer(),
      isLoading: true,
    );
  }

  @override
  List<Object> get props => [
        quiz,
        count,
        charCollect,
        answerController,
        audioPlayer,
        loopAudioPlayer,
        isLoading,
      ];

  QuizState copyWith({
    List<Quiz>? quiz,
    int? count,
    List<String>? charCollect,
    List<TextEditingController>? answerController,
    AudioPlayer? audioPlayer,
    AudioPlayer? loopAudioPlayer,
    bool? isLoading,
  }) {
    return QuizState(
      quiz: quiz ?? this.quiz,
      count: count ?? this.count,
      charCollect: charCollect ?? this.charCollect,
      answerController: answerController ?? this.answerController,
      audioPlayer: audioPlayer ?? this.audioPlayer,
      loopAudioPlayer: loopAudioPlayer ?? this.loopAudioPlayer,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  String get combWords {
    return answerController.map((controller) => controller.text).join();
  }

  String get combMainAnswr {
    return charCollect.join().replaceAll(' ', '');
  }
}

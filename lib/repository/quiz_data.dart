import 'package:test_harhar/models/quiz.dart';

class QuizData {
  static List<Quiz> datas = [
    Quiz(
      mainAnswer: 'he was born in the jungle',
      questions: [
        'yang dipakai kaki',
        'sang raja rimba',
        'delapan belas',
        'gitar',
        'perang',
        'lahir',
        'besar',
        'penjara'
      ],
      answers: [
        'shoes',
        'lion',
        'eighteen',
        'guitar',
        'war',
        'birth',
        'big',
        'jail'
      ],
    ),
    Quiz(
      mainAnswer: 'quiz 2',
      questions: ['soal 1 quiz 2', 'soal 2 quiz 2', 'soal 3 quiz 2'],
      answers: ['jawaban 1 quiz 2', 'jawaban 2 quiz 2', 'jawaban 3 quiz 2'],
    ),
    Quiz(
      mainAnswer: 'soal 3',
      questions: ['test', 'test', 'test', 'test lagi'],
      answers: ['shoes', 'lion', 'eighteen', 'jawaban'],
    ),
  ];
}

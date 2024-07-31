import 'package:test_harhar/models/quiz.dart';

class QuizData {
  static List<Quiz> datas = [
    //1
    const Quiz(
      mainAnswer: 'i have a dream',
      instruction: 'Artikan Kata-Kata Berikut',
      mainAnswerTranslate: '"Aku Punya Sebuah Impian" ~Martin Luther King Jr.',
      questions: [
        'Mendengar',
        'Membangkitkan',
        'Mengagumi',
        'Marah',
        'Membaca',
        'Memperkerjakan',
        'Mengendarai',
        'Sungai',
        'Rusa'
      ],
      answers: [
        'hear',
        'revive',
        'admire',
        'mad',
        'read',
        'hire',
        'ride',
        'river',
        'deer',
      ],
    ),
    //2
    const Quiz(
      mainAnswer: 'togetherness is the key to success',
      mainAnswerTranslate: '"Kebersamaan adalah kunci kesuksesan." - Gus Dur',
      instruction: 'Artikan Kata-Kata Berikut',
      questions: [
        'Kesatria',
        'Madu',
        'Lapar',
        'Layar',
        'Jam',
        'Koin',
        'Kunci',
        'Raja',
        'Mereka',
        'Matahari',
      ],
      answers: [
        'knight',
        'honey',
        'hungry',
        'screen',
        'hour',
        'coin',
        'key',
        'king',
        'they',
        'sun',
      ],
    ),
    //3 
    const Quiz(
      mainAnswer: 'evil will win if the righteous do nothing',
      mainAnswerTranslate:
          '"Kejahatan akan menang bila orang yang benar tidak melakukan apa-apa." -Jenderal Sudirman',
      instruction: 'Artikan Kata-Kata Berikut',
      questions: [
        'Rusa',
        'Bunga',
        'Angin',
        'Salju',
        'Baju',
        'Delapan',
        'Sungai',
        'Lima',
        'Lari',
        'Selatan',
        // 'cincin'
      ],
      answers: [
        'deer',
        'flower',
        'wind',
        'snow',
        'shirt',
        'eight',
        'river',
        'five',
        'run',
        'south',
        // 'ring'
      ],
    ),
    //4
    const Quiz(
      mainAnswer: 'fall seven times stand up eight',
      mainAnswerTranslate:
          '"Jatuh tujuh kali, berdiri delapan kali" - Pepatah Jepang',
      instruction: 'Artikan Kata-Kata Berikut',
      questions: [
        'Simpan',
        'Hewan',
        'Manusia',
        'Tumbuhan',
        'Menit',
        'Kepala',
        'Ikan',
        'Bendera',
        'Kecepatan',
        'Memberi',
      ],
      answers: [
        'save',
        'animal',
        'human',
        'plant',
        'minute',
        'head',
        'fish',
        'flag',
        'speed',
        'give',
      ],
    ),
    //5
    const Quiz(
        mainAnswer: 'after darkness light is born',
        mainAnswerTranslate: '“Habis Gelap Terbitlah Terang” ~R. A. Kartini',
        instruction: 'Antonim',
        questions: [
          'Cruel/Brutal',
          'Villain/Bad Guy',
          'Right',
          'Repair/Adjusment',
          'Exit/Leave',
          'First',
          'Avoid/Drop',
          'Junior',
          'Death/Decease',
          'True/Correct',
          'Small/Little',
          'Day/Daytime'
        ],
        answers: [
          'kind',
          'hero',
          'left',
          'break',
          'enter',
          'last',
          'bring',
          'senior',
          'birth',
          'false',
          'large',
          'night'
        ]),
    //6
    const Quiz(
        mainAnswer: 'all that glitters is not gold',
        mainAnswerTranslate:
            '"Tak Selalu yang Berkilau Itu Emas" ~William Shakespeare',
        instruction: 'Sinonim',
        questions: [
          'Huge/Jumbo',
          'Unhappy/Sorrowful',
          'Very warm/Burning',
          'Arm/Fist',
          'Rage/Fury',
          'Restroom/Bathroom',
          'Quiet/Soundless',
          'Dislike/Despise',
          'Anger/Fury',
          'Great/Wonderful'
        ],
        answers: [
          'giant',
          'sad',
          'hot',
          'hand',
          'anger',
          'toilet',
          'silent',
          'hate',
          'rage',
          'good'
        ]),
    
  ];
}

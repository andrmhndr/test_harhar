import 'package:test_harhar/models/quiz.dart';

class QuizData {
  static List<Quiz> datas = [
    const Quiz(
      mainAnswer: 'he was born in the jungle',
      mainAnswerTranslate: 'Dia Lahir di Hutan',
      instruction: 'Arti Kata',
      questions: [
        'Sepatu',
        'Singa',
        'Delapan Belas',
        'Gitar',
        'Perang',
        'Lahir',
        'Lebih Besar',
        'Penjara',
        'Keringat',
        'Rahang',
        'Gula',
        'Mempelajari'
        // 'cincin'
      ],
      answers: [
        'shoes',
        'lion',
        'eighteen',
        'guitar',
        'war',
        'birth',
        'bigger',
        'jail',
        'sweat',
        'jaw',
        'sugar',
        'learn'
        // 'ring'
      ],
    ),
    const Quiz(
      mainAnswer: 'i have a dream',
      instruction: 'Arti Kata',
      mainAnswerTranslate: '"Aku Punya Sebuah Impian" ~Martin Luther King Jr.',
      questions: [
        'Membangkitkan',
        'Mengagumi',
        'Marah',
        'Membaca',
        'Memperkerjakan',
        'Mengendarai',
        // 'Mimpi',
        'Sungai',
        'Rusa'
      ],
      answers: [
        'revive',
        'admire',
        'mad',
        'read',
        'hire',
        'ride',
        // 'dream',
        'river',
        'deer'
      ],
    ),
    const Quiz(
      mainAnswer: 'be the change that you wish to see in the world',
      mainAnswerTranslate:
          '"Anda Harus Menjadi Perubahan yang Ingin Anda Lihat di Dunia" ~Mahatma Gandhi',
      instruction: 'Arti Kata',
      questions: [
        'Keju',
        'Kunci Inggris',
        'Harapan',
        'Pasir',
        'Berdansa',
        'Gerbang',
        'Menekuk',
        'Abu-abu',
        'Kembar Dua',
        'Burung Hantu',
        'Batu Bara',
        'Mengangkut',
        'Sejarah',
        'Pelangi',
        'Membeli'
      ],
      answers: [
        'cheese',
        'wrench',
        'wish',
        'sand',
        'dance',
        'gate',
        'bend',
        'gray',
        'twin',
        'owl',
        'coal',
        'haul',
        'history',
        'rainbow',
        'buying'
      ],
    ),
    const Quiz(
        mainAnswer: 'after darkness light is born',
        mainAnswerTranslate: '“Habis Gelap Terbitlah Terang” ~R. A. Kartini',
        instruction: 'Antonim',
        questions: [
          'Cruel/Brutal',
          'Villain/Bad Guy',
          'Right',
          'Repair/Adjusment',
          'First',
          'Avoid/Drop',
          'Junior',
          'Death/Decease',
          'True/Correct',
          'Small/Little'
        ],
        answers: [
          'kind',
          'hero',
          'left',
          'break',
          'last',
          'bring',
          'senior',
          'birth',
          'false',
          'large'
        ]),
    const Quiz(
        mainAnswer: 'all that glitters is not gold',
        mainAnswerTranslate:
            '"Tak Selalu yang Berkilau Itu Emas" ~William Shakespeare',
        instruction: 'Sinonim',
        questions: [
          'Huge/Jumbo',
          'Unhappy/Sorrowful',
          'Very warm/Burning',
          'Rage/Fury',
          'Restroom/Bathroom',
          'Quiet/Soundless',
          'Dislike/Despise',
          'Anger/Fury'
        ],
        answers: [
          'giant',
          'sad',
          'hot',
          'anger',
          'toilet',
          'silent',
          'hate',
          'rage'
        ]),
    const Quiz(
        mainAnswer: 'everyone is a teacher every house is a school',
        mainAnswerTranslate:
            '"Setiap Orang Menjadi Guru, Setiap Rumah Menjadi Sekolah" ~Ki Hajar Dewantara',
        instruction: 'Deskripsi',
        questions: [
          'Benda keras dan padat yang berasal dari bumi atau planet lain, tetapi bukan logam',
          'Wilayah yg dikepalai oleh seorang wali kota',
          'Orang yang menonjol karena keberanian dan pengorbanannya dalam membela kebenaran',
          'Dapat menangkap suara (bunyi) dengan telinga',
          'Planet ke-2 di tata surya',
          'Pembungkus kaki yang biasanya dibuat dari kulit (karet dan sebagainya)',
          'Tumbuhan yang berbatang keras dan besar',
          'Benda langit terdiri atas gas menyala seperti matahari, terutama tampak pada malam hari',
          'Catatan sejumlah nama atau hal (tentang kata-kata, yang disusun berderet dari atas ke bawah',
          'Kendaraan darat yang digerakkan oleh tenaga mesin',
          'Masa yang lamanya dua belas bulan',
          'Bunyi bahasa yang dihasilkan oleh mulut',
          'Istana yg sekaligus dijadikan benteng'
        ],
        answers: [
          'stone',
          'city',
          'hero',
          'hear',
          'venus',
          'shoe',
          'tree',
          'star',
          'list',
          'car',
          'years',
          'vocal',
          'castle',
        ])
  ];
}

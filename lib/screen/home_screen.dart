import 'dart:typed_data';

// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:test_harhar/app_assets.dart';
import 'package:test_harhar/bloc/quiz/quiz_cubit.dart';
import 'package:test_harhar/screen/gameplay_screen.dart';

// import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    // context.read<QuizCubit>().playLoopAudio(appAssets.mainBgSound);
    super.initState();
  }

  @override
  void dispose() {
    context.read<QuizCubit>().audioDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // context.read<QuizCubit>().playLoopAudio(appAssets.mainBgSound);

    // context.read<QuizCubit>().playMenuMusic();
    // playMenuAudio();
    // String menuSong = 'lib/assets/musics/Wallpaper.mp3';
    // assetsAudioPlayer.open(Audio(menuSong),autoStart: false);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
      ),
      body: Container(
        height: screenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(appAssets.mainMenuBgScreen), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24,
                ),
                Image.asset(appAssets.mainLogo, width: screenWidth * 0.8),

                // Add main menu options/widgets here, e.g., buttons to start the game5
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 40, 2, 2),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<QuizCubit>().stopAudio();
                      context.read<QuizCubit>().playAudio(appAssets.clickSound);
                      context.read<QuizCubit>().startGame();
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF2D232E)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))),
                      minimumSize: MaterialStatePropertyAll(
                        Size(screenWidth * 0.6, screenHeight * 0.04),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('START GAME', style: TextStyle(fontSize: 36)),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<QuizCubit>()
                        .playLoopAudio(appAssets.mainBgSound);
                    // audioPlay.play(UrlSource('https://motionarray.com/royalty-free-music/corporate-harmonics/?utm_source=google&utm_medium=cpc&utm_campaign=16137732949&utm_content=131484452045&utm_term=free+royalty+free+music&keyword=free+royalty+free+music&ad=620461677255&matchtype=b&device=c&gclid=Cj0KCQjw0bunBhD9ARIsAAZl0E1AjF9fdMoYTkiqGBp0lp4hYzWNhglinLrXL4YMGuDjTpWXumaY1gIaAnLPEALw_wcB&subcategories=free'));
                    // assetsAudioPlayer.play();
                    // audioPlay.play();
                    // playMenuAudio();
                  },
                  child: Text('song'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<QuizCubit>().stopAudio();
                    // stopAudio();
                  },
                  child: Text('Stop song'),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     context.read<QuizCubit>().playAudio(appAssets.clickSound);
                //     // playClickSound();
                //   },
                //   child: Text('click'),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

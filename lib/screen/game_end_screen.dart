import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_harhar/app_assets.dart';
import 'package:test_harhar/screen/home_screen.dart';

class GameEndSCreen extends StatefulWidget {
  const GameEndSCreen({super.key});

  @override
  State<GameEndSCreen> createState() => _GameEndSCreenState();
}

class _GameEndSCreenState extends State<GameEndSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(appAssets.endScreenPage), fit: BoxFit.cover),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 230),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => HomeScreen());
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Back to Main Menu',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

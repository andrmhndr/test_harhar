import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_harhar/screen/gameplay_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add main menu options/widgets here, e.g., buttons to start the game
            ElevatedButton(
              onPressed: () {
                // Navigate to the gameplay screen when the button is pressed
                // Navigator.popAndPushNamed(context, '/gameplay');
                Get.to(() => GameplayScreen());
              },
              child: Text('Start Game'),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_harhar/components/image_slider.dart';
import 'package:test_harhar/components/main_button.dart';
import 'package:test_harhar/screen/home_screen.dart';
import 'package:test_harhar/app_assets.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final imgSrc = [
    appAssets.tutorial1,
    appAssets.tutorial2,
    appAssets.tutorial3,
    appAssets.tutorial4,
    appAssets.tutorial5,
    appAssets.tutorial6,
    appAssets.tutorial7,
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        
        child: Container(
          height: screenHeight,
          decoration: const BoxDecoration(
            color: Color.fromARGB(179, 229, 229, 229),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Text(
                    'CARA BERMAIN',
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                  ),
                ),

                CarouselSlider.builder(
                  itemCount: imgSrc.length,
                  itemBuilder: (context, index, realIndex) {
                    final imageSource = imgSrc[index];

                    return ImageTile(imageSource: imageSource, index: index);
                  },
                  options: CarouselOptions(
                    height: screenHeight * 0.69,
                    enableInfiniteScroll: false,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 26),
                  child: MainButton(
                    text: 'Kembali',
                    sizeFont: 36,
                    onTap: () {
                      Get.to(() => HomeScreen());
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

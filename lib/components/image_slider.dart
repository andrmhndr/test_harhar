// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  final String imageSource;
  final int index;

  const ImageTile({
    Key? key,
    required this.imageSource,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      color: Colors.grey,
      child: Image.asset(imageSource, fit: BoxFit.cover,),
    );
  }
}


// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final double sizeFont;
  final void Function()? onTap;
  const MainButton({
    Key? key,
    required this.text,
    required this.sizeFont,
    required this.onTap,
  }) : super(key: key);

//Color(0xFF2D232E)

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 26, vertical: 14),
        decoration: BoxDecoration(
          color: Color(0xFF2D232E),
          borderRadius: BorderRadius.circular(14),
        ),
        
        child: Text(
          text,
          style: TextStyle(color: Colors.white,fontSize: sizeFont),
        ),
      ),
    );
  }
}

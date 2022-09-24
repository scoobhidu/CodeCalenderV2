import 'package:flutter/material.dart';

class LabelHeading extends StatelessWidget {
  late String h1;
  late String h2;
  late Color color;
  LabelHeading({required this.h1, required this.h2, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: RichText(
        text: TextSpan(
          text: h1,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Sora',
            fontWeight: FontWeight.w500,
            fontSize: 21,
          ),
          children: <TextSpan>[
            TextSpan(
              text: h2,
              style: TextStyle(
                color: color,
                fontSize: 21,
                fontWeight: FontWeight.w800,
                fontFamily: 'Sora',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
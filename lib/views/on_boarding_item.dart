import 'package:flutter/material.dart';
import '../models/on_boarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({Key? key, required this.boarding}) : super(key: key);
  final OnBoardingModel boarding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Image(
                image: AssetImage(
                  boarding.image,
                )),),
        const SizedBox(
          height: 40,
        ),
        Text(
          boarding.title,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          boarding.desc,
          style: const TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
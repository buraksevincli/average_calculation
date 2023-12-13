import 'package:average_calculation/constants/app_constants.dart';
import 'package:flutter/material.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int numberOfLesson;
  const ShowAverage(
      {super.key, required this.average, required this.numberOfLesson});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          numberOfLesson > 0 ? "$numberOfLesson Ders Girildi" : "Ders Giriniz",
          style: Constants.showAverageTextStyle,
        ),
        Text(
          average >= 0 ? average.toStringAsFixed(2) : "0.0",
          style: Constants.averageTextStyle,
        ),
        Text(
          "Ortalama",
          style: Constants.showAverageTextStyle,
        ),
      ],
    );
  }
}

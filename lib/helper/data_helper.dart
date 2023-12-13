import 'package:average_calculation/model/lesson.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<Lesson> allAddedLessons = [];

  static addLesson(Lesson lesson) {
    allAddedLessons.add(lesson);
  }

  static List<String> _allClassLetters() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static calculateAverage() {
    double allGrade = 0;
    double allCredit = 0;

    for (var element in allAddedLessons) {
      allGrade = allGrade + (element.creditValue * element.letterValue);
      allCredit += element.creditValue;
    }

    return allGrade / allCredit;
  }

  static double _convertLetterToGrade(String letter) {
    switch (letter) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3;
      case "CB":
        return 2.5;
      case "CC":
        return 2;
      case "DC":
        return 1.5;
      case "DD":
        return 1;
      case "FD":
        return .5;
      case "FF":
        return 0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allLessonsLetter() {
    return _allClassLetters()
        .map((e) => DropdownMenuItem(
              value: _convertLetterToGrade(e),
              child: Text(e),
            ))
        .toList();
  }

  static List<int> _allCredits() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> allLessonsCredits() {
    return _allCredits()
        .map((e) => DropdownMenuItem(
              value: e.toDouble(),
              child: Text(e.toString()),
            ))
        .toList();
  }
}

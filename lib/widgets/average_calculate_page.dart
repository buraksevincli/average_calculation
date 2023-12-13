import 'package:average_calculation/constants/app_constants.dart';
import 'package:average_calculation/helper/data_helper.dart';
import 'package:average_calculation/model/lesson.dart';
import 'package:average_calculation/widgets/credit_dropdown_widget.dart';
import 'package:average_calculation/widgets/lesson_list.dart';
import 'package:average_calculation/widgets/letter_dropdown_widget.dart';
import 'package:average_calculation/widgets/show_average.dart';
import 'package:flutter/material.dart';

class AverageCalculatePage extends StatefulWidget {
  const AverageCalculatePage({super.key});

  @override
  State<AverageCalculatePage> createState() => _AverageCalculatePageState();
}

class _AverageCalculatePageState extends State<AverageCalculatePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double? selectedLetterValue = 4;
  double? selectedCreditValue = 1;
  String enteredLessonName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text(
              Constants.appHeaderText,
              style: Constants.appHeaderStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                  flex: 1,
                  child: ShowAverage(
                      average: DataHelper.calculateAverage(),
                      numberOfLesson: DataHelper.allAddedLessons.length),
                )
              ],
            ),
            Expanded(
              child: LessonList(
                onDismiss: (index) {
                  DataHelper.allAddedLessons.removeAt(index);
                  setState(() {});
                },
              ),
            )
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: Constants.horizontalPadding,
              child: _buildTextFormField(),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: Constants.horizontalPadding,
                    child: LetterDropdownWidget(
                      onLetterSelected: (newSelectedLetterValue) {
                        selectedLetterValue = newSelectedLetterValue;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: Constants.horizontalPadding,
                    child: CreditDropdownWidget(
                      onCreditSelected: (newSelectedCreditValue) {
                        selectedCreditValue = newSelectedCreditValue;
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: addLessonAndCalculateAverage,
                  icon: const Icon(Icons.arrow_forward_ios_sharp),
                  color: Constants.mainColor,
                  iconSize: 30,
                ),
              ],
            ),
            const SizedBox(height: 5)
          ],
        ));
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (newValue) {
        setState(() {
          enteredLessonName = newValue!;
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Ders Adını Giriniz!";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: "Ders İsmi",
          border: OutlineInputBorder(
              borderRadius: Constants.borderRadius,
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Constants.mainColor.shade100.withOpacity(.3)),
    );
  }

  void addLessonAndCalculateAverage() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var lessonToBeAdded = Lesson(
          name: enteredLessonName,
          letterValue: selectedLetterValue!,
          creditValue: selectedCreditValue!);
      DataHelper.addLesson(lessonToBeAdded);
      setState(() {});
    }
  }
}

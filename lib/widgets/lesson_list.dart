import 'package:average_calculation/constants/app_constants.dart';
import 'package:average_calculation/helper/data_helper.dart';
import 'package:average_calculation/model/lesson.dart';
import 'package:flutter/material.dart';

class LessonList extends StatelessWidget {
  final Function onDismiss;
  const LessonList({super.key, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    List<Lesson> allLessons = DataHelper.allAddedLessons;
    return allLessons.isNotEmpty
        ? ListView.builder(
            itemCount: allLessons.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(allLessons[index].name),
                      subtitle: Text(
                          "${allLessons[index].creditValue} Kredi, Not Değeri ${allLessons[index].letterValue}"),
                      leading: CircleAvatar(
                        backgroundColor: Constants.mainColor,
                        child: Text((allLessons[index].letterValue *
                                allLessons[index].creditValue)
                            .toStringAsFixed(0)),
                      ),
                    ),
                  ),
                ),
              );
            })
        : Center(
            child: Container(
            child: Text("Lütfen Ders Ekleyin", style: Constants.appHeaderStyle,),
          ));
  }
}

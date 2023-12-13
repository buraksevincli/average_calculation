import 'package:average_calculation/constants/app_constants.dart';
import 'package:average_calculation/helper/data_helper.dart';
import 'package:flutter/material.dart';

class CreditDropdownWidget extends StatefulWidget {
  final Function onCreditSelected;
  const CreditDropdownWidget({super.key, required this.onCreditSelected});

  @override
  State<CreditDropdownWidget> createState() => _CreditDropdownWidgetState();
}

class _CreditDropdownWidgetState extends State<CreditDropdownWidget> {
  double selectedCreditValue = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropdownPadding,
      decoration: BoxDecoration(
          color: Constants.mainColor.withOpacity(.3),
          borderRadius: Constants.borderRadius),
      child: DropdownButton<double>(
        value: selectedCreditValue,
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        underline: Container(),
        items: DataHelper.allLessonsCredits(),
        onChanged: (value) {
          setState(() {
            selectedCreditValue = value!;
            widget.onCreditSelected(selectedCreditValue);
          });
        },
      ),
    );
  }
}
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/infrastructure/constant.dart';
import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  final IconData? iconData;
  final String? label;
  final VoidCallback? onPress;
  final bool? isActive;

  const GenderButton(
      {super.key, this.iconData, this.label, this.onPress, this.isActive});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: ReusableCard(
        color: isActive == true ? kActiveColor : kInActiveColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              this.iconData,
              size: 55.0,
              color: Colors.white,
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              this.label!,
              style: const TextStyle(
                fontSize: 24.0,
                color: kLabelTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

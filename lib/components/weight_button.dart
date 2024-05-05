import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

class WeightButton extends StatelessWidget {
  final IconData? iconData;

  const WeightButton({super.key, this.iconData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ReusableCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              this.iconData,
              size: 55.0,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

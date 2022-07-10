import 'package:flutter/material.dart';
import 'package:greengocer/src/config/custom_colors.dart';
import 'package:greengocer/src/pages/commons_widgets/quantity_button.dart';

class QuantityWidget extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function(int quantity) result;
  final bool isRemovable;

  const QuantityWidget(
      {super.key,
      required this.value,
      required this.suffixText,
      required this.result,
      this.isRemovable = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            QuantityButton(
              icon: !isRemovable || value > 1
                  ? Icons.remove
                  : Icons.delete_forever,
              color: !isRemovable || value > 1 ? Colors.grey : Colors.red,
              onPressed: () {
                if (value == 1 && !isRemovable) return;
                int resultCount = value - 1;
                result(resultCount);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                '$value$suffixText',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            QuantityButton(
              icon: Icons.add,
              color: CustomColors.customSwatchColor,
              onPressed: () {
                int resultCount = value + 1;
                result(resultCount);
              },
            ),
          ],
        ),
      ),
    );
  }
}

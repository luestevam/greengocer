import 'package:flutter/material.dart';
import 'package:greengocer/src/config/custom_colors.dart';

class QuantityWidget extends StatelessWidget {
  final int value;
  final String suffixText;
  const QuantityWidget({
    super.key,
    required this.value,
    required this.suffixText,
  });

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
          children: [
            _QuantityButton(
              icon: Icons.remove,
              color: Colors.grey,
              onPressed: () {},
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
            _QuantityButton(
              icon: Icons.add,
              color: CustomColors.customSwatchColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const _QuantityButton(
      {super.key,
      required this.color,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}

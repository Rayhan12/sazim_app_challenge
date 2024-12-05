import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCreationProgressIndicator extends StatelessWidget {
  final double value;
  const ProductCreationProgressIndicator({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 35),
        LinearProgressIndicator(
          borderRadius: BorderRadius.circular(10),
          minHeight: 15,
          value: value <=1 ? value : 1,
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}

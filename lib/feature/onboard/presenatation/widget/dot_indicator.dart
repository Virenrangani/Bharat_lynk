import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int currentIndex;
  final int total;

  const DotIndicator({
    super.key,
    required this.currentIndex,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        total,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(right: 6),
          height: 6,
          width: currentIndex == index ? 28 : 6,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? Colors.white
                : Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
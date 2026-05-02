import 'package:bharat_lyak/core/widget/button/app_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/text_style/app_text_style.dart';
import 'onboarding_content.dart';

class OnboardingPage extends StatelessWidget {
  final VoidCallback next;
  final OnboardingContent content;

  const OnboardingPage({super.key, required this.content, required this.next});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Background Image
        SizedBox.expand(
          child: Image.asset(
            content.image,
            fit: BoxFit.cover,
          ),
        ),

        /// Bottom White Card
        Positioned(
          bottom: 26,
          left: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  content.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 12),
                Text(
                  content.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                AppButton(onPressed:next, buttonText: "Continue")
              ],
            ),
          ),
        )
      ],
    );
  }
}
import 'package:bharat_lyak/core/constant/image/app_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/text_style/app_text_style.dart';
import '../widget/dot_indicator.dart';
import '../widget/onboarding_content.dart';
import '../widget/onboarding_page.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<OnboardingContent> contents = [
    OnboardingContent(
      image: AppImage.onBoarding1,
      title: "Find your \n Perfect stay.",
      description:
      "Browse verified PGs near colleges, offices, or your desired location - all in one place..",
    ),
    OnboardingContent(
      image: AppImage.onBoarding2,
      title: "Filter fast Book faster.",
      description:
      "Sort by budget, amenities, and room type. Book your stay in just a few taps.",
    ),
    OnboardingContent(
      image: AppImage.onBoarding3,
      title: "No brokers No tension.",
      description:
      "Direct chat with PG owners, instant confirmations, and smooth move-ins.",
    ),
  ];

  void nextPage() {
    if (currentIndex == contents.length - 1) {
      // Navigate to home
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void skip() {
    _controller.jumpToPage(contents.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            /// PageView
            PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (index) {
                setState(() => currentIndex = index);
              },
              itemBuilder: (_, index) {
                return OnboardingPage(
                  content: contents[index],
                  next: nextPage,
                );
              },
            ),
        
            /// Top Controls (Dots + Skip)
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DotIndicator(
                      currentIndex: currentIndex,
                      total: contents.length,
                    ),
                    TextButton(
                      onPressed: skip,
                      child: Text("Skip",style:AppTextStyles.bodyMedium(color: Colors.white),),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
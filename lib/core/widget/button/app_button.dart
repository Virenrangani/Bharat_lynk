import 'package:flutter/material.dart';

import '../../constant/text_style/app_text_style.dart';

class AppButton extends StatelessWidget {
 final VoidCallback onPressed;
 final String buttonText;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          buttonText,
          style: AppTextStyles.bodyMedium(color: Colors.white),
        ),
      ),
    );
  }
}
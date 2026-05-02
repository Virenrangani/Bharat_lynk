import 'package:flutter/material.dart';

class CommonTopBar extends StatelessWidget {
  final bool showLeftIcon;
  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;

  const CommonTopBar({
    super.key,
    this.showLeftIcon = false,
    this.onLeftTap,
    this.onRightTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// LEFT ICON (Optional)
          if (showLeftIcon)
            GestureDetector(
              onTap: onLeftTap,
              child: _buildIcon(Icons.arrow_back),
            )
          else
            const SizedBox(width: 40), // keep spacing balanced

          /// RIGHT ICON (Always visible)
          GestureDetector(
            onTap: onRightTap,
            child: _buildIcon(Icons.headset_mic_outlined),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        icon,
        size: 20,
        color: Colors.black87,
      ),
    );
  }
}
import 'package:final_project_ebook/presentation/auth/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/route_manager.dart';

class SocialLoginButton extends StatelessWidget {
  final String text;
  final String iconAsset;
  final Color textColor;
  final Color backgroundColor;
  final Color? OutlineBorderColor;
  final VoidCallback onPressed;

  const SocialLoginButton({
    Key? key,
    required this.text,
    required this.iconAsset,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.OutlineBorderColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(25),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(25),
              border: OutlineBorderColor != null
                  ? Border.all(color: OutlineBorderColor!, width: 1)
                  : null),
          child: Row(
            children: [
              Image.asset(
                iconAsset,
                height: 26,
                width: 26,
              ),
              SizedBox(width: 24),
              Text(
                text,
                style: TextStyle(
                  fontSize: 17,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

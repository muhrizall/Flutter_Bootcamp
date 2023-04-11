import 'package:final_project_ebook/core/values/colors.dart';
import 'package:final_project_ebook/core/values/images.dart';
import 'package:final_project_ebook/presentation/auth/login/login_controller.dart';
import 'package:final_project_ebook/presentation/widgets/signin_google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:final_project_ebook/core/values/colors.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:final_project_ebook/presentation/widgets/signin_google_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Login',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: '',
                ),
              ),
            ),
            SizedBox(height: 36),
            SvgPicture.asset(
              ImagesAssets.imageIllustrationLoginSvg,
              height: 225,
            ),
            SizedBox(height: 40),
            Text(
              'Selamat Datang',
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            Text(
              'Selamat Datang di Aplikasi Widya Edu Aplikasi Latihan dan Konsultasi Soal',
              style: TextStyle(
                  color: AppColors.grey6A,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            Expanded(child: SizedBox.shrink()),
            SocialLoginButton(
              text: 'Sign in with Google',
              iconAsset: ImagesAssets.iconGooglePng,
              OutlineBorderColor: AppColors.mint,
              onPressed: () async {
                // GoogleSignIn().signIn();
                await Get.find<LoginController>().onGoogleSignIn();
              },
            ),
            // Expanded(child: SizedBox.shrink()),
            SizedBox(height: 14),
            SocialLoginButton(
              text: 'Sign in with Apple',
              iconAsset: ImagesAssets.iconApplePng,
              backgroundColor: AppColors.black,
              textColor: AppColors.white,
              OutlineBorderColor: AppColors.mint,
              onPressed: () async {
                // await Get.find<LoginController>().onGoogleSignIn();
              },
            ),
          ],
        ),
      )),
    );
  }
}

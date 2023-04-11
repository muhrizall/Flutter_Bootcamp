import 'dart:async';
import 'dart:math';
import 'package:final_project_ebook/data/model/user_response.dart';
import 'package:final_project_ebook/data/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/services/firebase_auth_service.dart';
import '../../../routes/routes.dart';

class LoginController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final AuthRepository authRepository;

  LoginController(
      {required this.firebaseAuthService, required this.authRepository});

  /// Steps:
  /// 1. Sign In With Google
  /// 2. Get Email from UserCredential
  /// 3. Check isUserRegistered()
  Future<void> onGoogleSignIn() async {
    User? user = await firebaseAuthService.signInWithGoogle();
    print("USER $user");
    if (user != null) {
      await isUserRegistered();
    }
  }

  Future<void> signOut() async {
    await firebaseAuthService.signOut();
    Get.offAllNamed(Routes.login);
  }

  Future<void> isUserRegistered() async {
    String? email = FirebaseAuth.instance.currentUser?.email;
    print("email adakah $email");
    if (email != null) {
      print("masuk kesini");
      UserData? userData = await authRepository.getUserByEmail(email: email);
      if (userData != null) {
        // User is Registered
        print("user registed");
        Get.offAllNamed(Routes.dashboard);
      } else {
        print("user signedin");
        // User is Signed In & Is not Registered
        Get.offAllNamed(Routes.registerForm);
      }
    } else {
      Get.offAllNamed(Routes.login);
    }
  }
}

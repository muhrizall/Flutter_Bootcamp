import 'package:final_project_ebook/data/model/user_response.dart';
import 'package:final_project_ebook/data/repository/auth_repository.dart';
import 'package:get/get.dart';

import '../../../data/services/firebase_auth_service.dart';
import '../../../routes/routes.dart';

class ProfileController extends GetxController {
  FirebaseAuthService firebaseAuthService;
  AuthRepository authRepository;
  ProfileController({
    required this.firebaseAuthService,
    required this.authRepository,
  });

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 100)).then((value) async {
      await getUserData();
    });
  }

  Future<void> signOut() async {
    await firebaseAuthService.signOut();
    Get.offAllNamed(Routes.login);
  }

  UserData? userData;

  Future<void> getUserData() async {
    final String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      final user = await authRepository.getUserByEmail(email: email);

      if (user != null) userData = user;

      update();
    }
  }
}

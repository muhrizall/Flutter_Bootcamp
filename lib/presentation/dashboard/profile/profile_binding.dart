import 'package:final_project_ebook/data/repository/auth_repository.dart';
import 'package:get/get.dart';

import '../../../data/services/firebase_auth_service.dart';
import 'profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut<ProfileController>(() => ProfileController(
          firebaseAuthService: Get.find<FirebaseAuthService>(),
          authRepository: Get.find<AuthRepository>(),
        ));
  }
}

import 'package:final_project_ebook/data/repository/auth_repository.dart';
import 'package:final_project_ebook/data/services/firebase_auth_service.dart';
import 'package:get/get.dart';

import 'edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      EditProfileController(
        Get.find<AuthRepository>(),
        Get.find<FirebaseAuthService>(),
      ),
    );
  }
}

import 'package:final_project_ebook/data/model/register_user_request.dart';
import 'package:final_project_ebook/data/repository/auth_repository.dart';
import 'package:final_project_ebook/data/services/firebase_auth_service.dart';
import 'package:final_project_ebook/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final AuthRepository authRepository;
  final FirebaseAuthService firebaseAuthService;

  EditProfileController(this.authRepository, this.firebaseAuthService);

  final etGender = TextEditingController();
  final etName = TextEditingController();
  final etEmail = TextEditingController();
  final etJk = TextEditingController();
  final etKelas = TextEditingController();
  final etSekolah = TextEditingController();

  final _selectedGender = Rx<bool?>(null);

  bool? get selectedGender => _selectedGender.value;

  void onSelectedGender({
    required bool value,
    Function? onSelected,
  }) {
    _selectedGender.value = value;
    etGender.text = (value) ? 'Laki - laki' : 'Perempuan';
    onSelected?.call();
  }

  void onSelectedKelas({
    required String value,
    Function? onSelected,
  }) {
    etKelas.text = value;
    onSelected?.call();
  }

  Future<void> updateProfile() async {
    final email = FirebaseAuth.instance.currentUser?.email;
    if (email != null) {
      final UserBody user = UserBody(
        fullName: etName.text,
        email: email,
        schoolName: etSekolah.text,
        schoolLevel: etKelas.text,
        schoolGrade: etSekolah.text,
        gender: etGender.text,
        photoUrl:
            'https://api.duniagames.co.id/api/content/upload/file/11297623561589089919.jpg',
      );
      await authRepository.updateUserByEmail(userBody: user);
      await firebaseAuthService.signOut();
      Get.offAllNamed(Routes.login);
    }
  }
}

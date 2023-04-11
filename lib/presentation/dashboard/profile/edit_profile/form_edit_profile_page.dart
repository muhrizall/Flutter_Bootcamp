import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_profile_controller.dart';

class FormEditProfilePage<C extends EditProfileController>
    extends GetWidget<C> {
  const FormEditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Data Diri',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: TextField(
            controller: controller.etName,
            decoration: InputDecoration(
              labelText: 'Nama Lengkap',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: 16,
        //     vertical: 8,
        //   ),
        //   child: TextField(
        //     readOnly: true,
        //     controller: controller.etEmail,
        //     decoration: InputDecoration(
        //       labelText: 'Email',
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(16),
        //       ),
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: TextField(
            readOnly: true,
            controller: controller.etGender,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.arrow_drop_down),
              labelText: 'Jenis Kelamin',
              hintText: 'Pilih Jenis Kelamin',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onTap: () => Get.bottomSheet(chooseGender(context)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: TextField(
            readOnly: true,
            controller: controller.etKelas,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.arrow_drop_down),
              labelText: 'Kelas',
              hintText: 'Pilih Kelas',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onTap: () => Get.bottomSheet(chooseKelas(context)),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: 16,
        //     vertical: 8,
        //   ),
        //   child: TextField(
        //     controller: controller.etKelas,
        //     decoration: InputDecoration(
        //       labelText: 'Kelas',
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(16),
        //       ),
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: TextField(
            controller: controller.etSekolah,
            decoration: InputDecoration(
              labelText: 'Sekolah',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: ElevatedButton(
            onPressed: () async => await onUpdateData(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff3A7FD5),
            ),
            child: const Text('Perbarui Data & Relogin'),
          ),
        ),
      ],
    );
  }

  Future<void> onUpdateData() async {
    debugPrint('Ditekan onUpdateData');

    if (controller.etName.text.isEmpty) {
      Get.snackbar(
        'Invalid!!!',
        'Nama wajib diisi',
        backgroundColor: Colors.red,
      );
      return;
    }

    // if (controller.etEmail.text.isEmpty) {
    //   Get.snackbar(
    //     'Invalid!!!',
    //     'Email wajib diisi',
    //     backgroundColor: Colors.red,
    //   );
    //   return;
    // }

    if (controller.etEmail.text.isEmail) {
      Get.snackbar(
        'Invalid!!!',
        'Format email salah',
        backgroundColor: Colors.red,
      );
      return;
    }
    if (controller.etGender.text.isEmpty) {
      Get.snackbar(
        'Invalid!!!',
        'Jenis kelamin wajib dipilih',
        backgroundColor: Colors.red,
      );
      return;
    }
    if (controller.etKelas.text.isEmpty) {
      Get.snackbar(
        'Invalid!!!',
        'Kelas wajib dipilih',
        backgroundColor: Colors.red,
      );
      return;
    }
    if (controller.etSekolah.text.isEmpty) {
      Get.snackbar(
        'Invalid!!!',
        'Asal sekolah wajib diisi',
        backgroundColor: Colors.red,
      );
      return;
    }

    Get.snackbar(
      'Berhasil!!!',
      'Data berhasil diupdate',
      backgroundColor: Colors.green,
    );
    await controller.updateProfile();
  }

  Widget chooseGender(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Laki - laki'),
            onTap: () => controller.onSelectedGender(
              value: true,
              onSelected: () => Get.back(),
            ),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text('Perempuan'),
            onTap: () => controller.onSelectedGender(
              value: false,
              onSelected: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }

  Widget chooseKelas(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('10'),
            onTap: () => controller.onSelectedKelas(
              value: '10',
              onSelected: () => Get.back(),
            ),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text('11'),
            onTap: () => controller.onSelectedKelas(
              value: '11',
              onSelected: () => Get.back(),
            ),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text('12'),
            onTap: () => controller.onSelectedKelas(
              value: '12',
              onSelected: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }
}

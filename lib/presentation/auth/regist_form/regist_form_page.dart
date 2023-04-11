import 'package:final_project_ebook/data/model/register_user_request.dart';
import 'package:final_project_ebook/presentation/auth/login/login_page.dart';
import 'package:final_project_ebook/presentation/auth/regist_form/regist_form_controller.dart';
import 'package:final_project_ebook/routes/pages_binding.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../core/values/colors.dart';
import '../../../routes/routes.dart';

class RegistFormPage extends StatefulWidget {
  const RegistFormPage({Key? key}) : super(key: key);

  @override
  State<RegistFormPage> createState() => _RegistFormPageState();
}

class _RegistFormPageState extends State<RegistFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameTextController = TextEditingController();
  final TextEditingController _schoolNameTextController =
      TextEditingController();
  String? selectedKelas;
  String jenisKelamin = '';

  bool isAllValid = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistFormController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 130,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
          backgroundColor: AppColors.white,
          leading: IconButton(
            onPressed: () {
              Get.offAllNamed(Routes.login);
              // Navigator.pop(context);
              // Navigator.pop(context, GetMaterialPageRoute(builder: (context) {
              //   return Pages(name);
              // }));
            },
            color: AppColors.black,
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text(
            'Yuk isi data diri',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(28),
            children: [
              const Text(
                'Email',
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  height: 2,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: TextFormField(
                  controller: controller.emailTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Email',
                  ),
                  enabled: false,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
              ),
              SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: const Text(
                  'Nama Lengkap',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.w600,
                    height: 2,
                    fontSize: 16,
                  ),
                ),
              ),
              TextFormField(
                controller: _fullNameTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Nama Lengkap',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(6),
                ]),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  'Jenis  Kelamin',
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 0,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          jenisKelamin = 'Laki-Laki';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: jenisKelamin == 'Laki-Laki'
                              ? Colors.green
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xFFD6D6D6),
                          ),
                        ),
                        child: Text(
                          'Laki-Laki',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            height: 1,
                            fontSize: 16,
                            color: jenisKelamin == 'Laki-Laki'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Perempuan
                  SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          jenisKelamin = 'Perempuan';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: jenisKelamin == 'Perempuan'
                              ? Colors.green
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Color(0xFFD6D6D6), width: 1),
                        ),
                        child: Text(
                          'Perempuan',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            height: 1,
                            fontSize: 16,
                            color: jenisKelamin == 'Perempuan'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(child: SizedBox(height: 10)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  'Kelas',
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                child: DropdownButtonFormField<String?>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Pilih Kelas',
                  ),
                  value: selectedKelas,
                  items: ['10', '11', '12']
                      .map((element) => DropdownMenuItem<String?>(
                            value: element,
                            child: Text('Kelas $element'),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value != null) {
                        selectedKelas = value;
                      }
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  'Nama Sekolah',
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              TextFormField(
                controller: _schoolNameTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Nama Sekolah',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(6),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: SizedBox(
                  height: 65,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(46),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_fullNameTextController.text.isEmpty) {
                        Get.snackbar(
                          'Invalid!!!',
                          'Nama Lengkap wajib diisi!',
                          backgroundColor: Colors.red,
                        );
                        return;
                      } else if (_fullNameTextController.text.length <= 5) {
                        Get.snackbar(
                          'Invalid!!!',
                          'Nama Lengkap minimal 6 karakter!',
                          backgroundColor: Colors.red,
                        );
                        return;
                      }
                      if (_schoolNameTextController.text.isEmpty) {
                        Get.snackbar(
                          'Invalid!!!',
                          'Nama Sekolah wajib diisi!',
                          backgroundColor: Colors.red,
                        );
                        return;
                      }
                      if (jenisKelamin.isEmpty) {
                        Get.snackbar(
                          'Invalid!!!',
                          'Jenis Kelamin wajib dipilih!',
                          backgroundColor: Colors.red,
                        );
                        return;
                      }
                      if (selectedKelas == null) {
                        Get.snackbar(
                          'Invalid!!!',
                          'Kelas wajib dipilih!',
                          backgroundColor: Colors.red,
                        );
                        return;
                      }
                      /**
                       * Email: controller.emailTextController.text
                       * Nama: _fullNameTextController.text
                       * Sekolah: _schoolNameTextController.text
                       * JK: jenisKelamin
                       * Kelas: selectedKelas
                       */

                      controller.registerUser(
                        user: UserBody(
                          fullName: _fullNameTextController.text,
                          email: controller.emailTextController.text,
                          schoolName: _schoolNameTextController.text,
                          schoolLevel: selectedKelas!,
                          schoolGrade: 'SMA',
                          gender: jenisKelamin!,
                          photoUrl: '0',
                        ),
                      );
                      Get.snackbar(
                        'Success!!!',
                        'Success lurd!',
                        backgroundColor: Colors.green,
                      );

                      // Pindah ke dashboard page.
                      Get.offAllNamed(Routes.dashboard);
                    },
                    child: const Text(
                      'DAFTAR',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
